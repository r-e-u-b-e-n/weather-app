import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigate extends StatelessWidget {
  const BottomNavigate({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: SvgPicture.asset(
        'assets/svg/buttons.svg',
        fit: BoxFit.fill,
        width: double.infinity,
      ),
    );
  }
}