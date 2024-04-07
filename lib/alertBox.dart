import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class AlertBox extends StatefulWidget {
  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  DateTime selectedDate = DateTime.now();
  String dropdownValue = 'One';
  final List<String> dropdownOptions = ['One', 'Two', 'Three'];
  final AlertBoxController controller = Get.put(AlertBoxController());

  // Assuming actionDialog is now a method of _AlertBoxState
  void actionDialog(BuildContext context) {
    void _openDatePicker(
        BuildContext context, Function(DateTime) onDateSelected) {
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            height: Get.height * 0.42,
            child: Column(
              children: <Widget>[
                TableCalendar(
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2050),
                  focusedDay: DateTime.now(),
                  calendarFormat: CalendarFormat.month,
                  calendarStyle: CalendarStyle(
                    selectedDecoration: const BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                  ),
                  selectedDayPredicate: (date) {
                    return isSameDay(selectedDate, date);
                  },
                  onDaySelected: (date, focusedDay) {
                    selectedDate = date;
                    onDateSelected(date);
                    Navigator.pop(context);
                    controller.updateSelectedDate(date);
                  },
                  calendarBuilders: CalendarBuilders(
                    selectedBuilder: (context, date, _) => Container(
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          date.day.toString(),
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    showGeneralDialog(
        context: context,
        barrierLabel: "Action",
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Material(
                color: Colors.transparent, // Adjust color as needed
                child: Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.10),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _openDatePicker(context, (DateTime selectedDate) {
                            setState(() {
                              this.selectedDate = selectedDate;
                            });
                          });
                        },
                        child: const Text("Open Date Picker"),
                      ),
                      Container(
                          color: Colors.amber,
                          child: Text(
                              selectedDate.toIso8601String().split('T')[0])),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: dropdownOptions
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        transitionBuilder: (_, anim, __, child) {
          Tween<Offset> tween;
          if (anim.status == AnimationStatus.reverse) {
            tween = Tween(begin: const Offset(-0, -1), end: Offset.zero);
          } else {
            tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
          }

          return SlideTransition(
            position: tween.animate(anim),
            child: FadeTransition(
              opacity: anim,
              child: child,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AlertBox Page"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => actionDialog(context), // Triggering actionDialog
              child: const Text("Show Dialog"),
            ),
            Obx(() => Text(
                controller.selectedDate.value.toIso8601String().split('T')[0])),
          ],
        ),
      ),
    );
  }
}

class AlertBoxController extends GetxController {
  // Use Rx for reactive state management
  var selectedDate = DateTime.now().obs;
  var dropdownValue = 'One'.obs;

  // Method to update selected date
  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

  // Method to update dropdown value
  void updateDropdownValue(String newValue) {
    dropdownValue.value = newValue;
  }
}
