import 'package:fireappx/constant/colors.dart';
import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 1.01).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.easeOut),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _animationController?.forward(),
      onTapUp: (_) => _animationController?.reverse(),
      onTapCancel: () => _animationController?.reverse(),
      child: Transform.scale(
        scale: _animation?.value ?? 1.0,
        child: Container(
          width: 340,
          height: 54,
          padding: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            color: AppColors().myDarkBlue,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    margin: EdgeInsets.all(5),
                    height: 20,
                    width: 20,
                    child: Image.asset('assets/icons/icon-gold-star.png')),
                Text(
                  'Manage your membership',
                  style: TextStyle(
                      color: AppColors().mytheam,
                      fontSize: 16,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: AppColors().mytheam,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
