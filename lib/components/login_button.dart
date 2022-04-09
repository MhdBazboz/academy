import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final onTap;

  const LoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: 45,
        margin: EdgeInsets.only(top: 30, bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: const DecorationImage(
            image: AssetImage('images/button_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'تسجيل الدخول',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'NotoKufiArabic-Medium',
            ),
          ),
        ),
      ),
    );
  }
}
