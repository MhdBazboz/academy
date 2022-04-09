import 'dart:io';

import 'package:ai_academy/components/components.dart';
import 'package:ai_academy/components/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseRegister extends StatefulWidget {
  const CourseRegister({Key? key}) : super(key: key);

  @override
  _CourseRegisterState createState() => _CourseRegisterState();
}

class _CourseRegisterState extends State<CourseRegister> {
  TextEditingController courseName=TextEditingController(text: 'اسم الكورس');
  void launchWhatsApp(
      {required int phone,
        required String message,
      }) async {
    String url() {
      if (Platform.isAndroid) {
        // add the [https]
        return "https://wa.me/$phone}/?text=${Uri.parse(message)}"; // new line
      } else {
        // add the [https]
        return "https://api.whatsapp.com/send?phone=$phone}=${Uri.parse(message)}"; // new line
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           const MyAppBar(title: 'اسم الكورس'),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Container(
                      //   height: size.height/1.38,
                      //   decoration: BoxDecoration(
                      //      // borderRadius: BorderRadius.circular(20),
                      //       image: DecorationImage(
                      //           fit: BoxFit.cover,
                      //           image: NetworkImage('https://images.unsplash.com/photo-1606231140504-b6ec6cbbbf6b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60')
                      //       )
                      //   ),
                      // ),
                      // SizedBox(height: size.height*kPadding,),
                      // SizedBox(
                      //   width: 150,
                      //   height: 40,
                      //   child: BorderedButton(title: 'اشترك الان',color: Color(0xff32504F),onPress: (){},),
                      // )
                    Container(
                      height: size.height/2,
                      decoration: BoxDecoration(
                         // borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage('https://images.unsplash.com/photo-1606231140504-b6ec6cbbbf6b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60')
                          )
                      ),
                    ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              child: Text(
                                  'اسم الكورس',
                                style: TextStyle(
                                  fontSize: kSubTitleSize,
                                  fontFamily: kFontFamily,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      buildTextField(context, courseName,size),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              child: Text(
                                'الرقم',
                                style: TextStyle(
                                  fontSize: kSubTitleSize,
                                  fontFamily: kFontFamily,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              child: Text(
                                '963935197564+',
                                style: TextStyle(
                                  fontSize: kSubTitleSize,
                                  fontFamily: kFontFamily,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 150,
                          height: 45,
                          child: BorderedButton(title: 'تأكيد', color: Color(0xff32504F),
                              onPress: (){
                            launchWhatsApp(phone: 00963935197564, message: courseName.text);
                              }))
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context,controller,size) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:size.width*kPadding ),
      child: Container(
        height: 45,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              color:kSwatchColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: BorderSide(
                color:kSwatchColor,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: BorderSide(
                color: kSwatchColor,
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
