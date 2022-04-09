import 'package:ai_academy/views/home%20page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/const.dart';
import '../components/loggin_text_field.dart';
import '../components/login_button.dart';
import '../components/login_screen_scaffold.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LoginScreenScaffold(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'تسجيل الدخول',
            style: TextStyle(
              color: kSwatchColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'NotoKufiArabic-Medium',
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const LogginTextField(
            title: 'البريد الإلكتروني',
            iconPath: 'images/email.svg',
          ),
          const LogginTextField(
            title: 'كلمة المرور',
            iconPath: 'images/key.svg',
            obSecureText: true,
          ),
          LoginButton(
            onTap: () {
              Get.to(()=>HomePage());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {},
                splashColor: kSwatchColor.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Container(
                  width: size.width * 0.35,
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'إنشاء بريد إالكتروني',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoKufiArabic-Medium',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.35,
                child: const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'لا تملك بريد إالكتروني؟',
                    style: TextStyle(
                      //fontSize: 12,
                      fontFamily: 'NotoKufiArabic-Medium',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
