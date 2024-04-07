import 'dart:convert';
import 'package:fireappx/model/dataModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DataController extends GetxController {
  var isLoading = true.obs;
  DataModel? dataModel;
  DataModel? shareddataModel;

  @override
  void onInit() {
    super.onInit();
    loadDataModel();
    fetchData();
  }

  void fetchData() async {
    print('Fetching data...');
    isLoading(true);
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final response = await http
          .get(Uri.parse('https://ajanitech.com/test/chat-app-x/user-1.json'));
      if (response.statusCode == 200) {
        print('Data fetched successfully.');
        final data = jsonDecode(response.body);
        dataModel = DataModel.fromJson(data);
        String dataModelString = jsonEncode(dataModel!.toJson());
        await prefs.setString('dataModel', dataModelString);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading(false);
      print('Fetching process completed. isLoading: ${isLoading.value}');
    }
  }

  void loadDataModel() async {
    isLoading(true);
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? dataModelString = prefs.getString('dataModel');
      if (dataModelString != null) {
        Map<String, dynamic> dataModelMap = jsonDecode(dataModelString);
        shareddataModel = DataModel.fromJson(dataModelMap);
      }
    } catch (e) {
      fetchData();
      update();

      print("Error loading DataModel from SharedPreferences: $e");
    } finally {
      fetchData();
      isLoading(false);
      update();
    }
  }
}
