import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../components/components.dart';
import '../../components/const.dart';

class CoursePage extends StatefulWidget {
  const CoursePage(
      {Key? key,
        required this.courseImage,
        required this.degree,
        required this.platformImage,
        required this.platformName,
        required this.tag})
      : super(key: key);
  final String courseImage, degree, platformImage, platformName, tag;

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double value = 0.0;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const MyAppBar( title: 'اسم الكورس'),
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: width * kPadding),
                width: width,
                height: height * .07,
                //color: Colors.grey,
                child: Row(
                  children: [
                    SvgPicture.asset('images/post-it.svg'),
                    SizedBox(width: width*.015,),
                     Text(
                      'تهانينا لقد أكملت المقرر 1.1',
                      style: TextStyle(
                        fontFamily: kFontFamily,
                        fontSize: kSubTitleSize,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width*kPadding),
                    child: Text(
                      'التقييم',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: kFontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*.009,),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*kPadding),
                    child: Icon(
                      Icons.timer_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Text('00:59:00',style: TextStyle(color: Colors.black,fontSize: kSubTitleSize),)
                ],
              ),
              buildQuestion(1, 'الانحلال و الشذوذ هي ثقافة وسلوك؟', ['صحيح','خطأ']),
              buildQuestion(2, 'الانحلال و الشذوذ هي ثقافة وسلوك؟', ['صحيح','خطأ']),
              buildQuestion(3, 'الانحلال و الشذوذ هي ثقافة وسلوك؟', ['صحيح','خطأ']),
              buildQuestion(4, 'الانحلال و الشذوذ هي ثقافة وسلوك؟', ['صحيح','خطأ']),
              buildQuestion(5, 'الانحلال و الشذوذ هي ثقافة وسلوك؟', ['صحيح','خطأ']),
              buildQuestion(6, 'الانحلال و الشذوذ هي ثقافة وسلوك؟', ['صحيح','خطأ']),
              buildQuestion(7, 'الانحلال و الشذوذ هي ثقافة وسلوك؟', ['صحيح','خطأ']),
              SizedBox(
                width: 150,
                  height: 50,
                  child: BorderedButton(title: 'انهاء الاختبار', color: kSwatchColor, onPress: (){}))
              // ExpansionPanelList(
              //   animationDuration: const Duration(milliseconds: 850),
              //   elevation: 1,
              //   expandedHeaderPadding: const EdgeInsets.all(8),
              //   expansionCallback: (index,open){
              //     setState(() {
              //       isOpen = !open;
              //     });
              //   },
              //   children: [
              //     ExpansionPanel(
              //         isExpanded: isOpen,
              //         headerBuilder: (context, index) => SizedBox(
              //           width: width * .8,
              //           height: height * .08,
              //           child: Center(
              //             child: Text(
              //               'التقييم',
              //               style: TextStyle(
              //                 fontFamily: kFontFamily,
              //                 fontWeight: FontWeight.w600,
              //                 fontSize: 16,
              //               ),
              //             ),
              //           ),
              //         ),
              //         body: SizedBox(
              //           child: Column(
              //             children: [
              //               Row(
              //                 children: [
              //                   FittedBox(
              //                     child: SvgPicture.asset('images/question-mark.svg'),
              //                   ),
              //                   SizedBox(
              //                     width: width * .035,
              //                   ),
              //                   FittedBox(
              //                     child: Text(
              //                       'عدد الأسئلة',
              //                       style: TextStyle(
              //                           fontFamily:
              //                           kFontFamily,
              //                           fontSize: 16),
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     width: width * .035,
              //                   ),
              //                   FittedBox(
              //                     child: Text(
              //                       '6',
              //                       style: TextStyle(
              //                         fontFamily:
              //                         kFontFamily,
              //                         fontWeight: FontWeight.w700,
              //                         fontSize: 16,
              //                         color: Colors.red,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               Row(
              //                 children: [
              //                   FittedBox(
              //                     child: SvgPicture.asset('images/time.svg'),
              //                   ),
              //                   SizedBox(
              //                     width: width * .035,
              //                   ),
              //                   FittedBox(
              //                     child: Text(
              //                       'المدة',
              //                       style: TextStyle(
              //                           fontFamily:
              //                           kFontFamily,
              //                           fontSize: 16),
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     width: width * .035,
              //                   ),
              //                   FittedBox(
              //                     child: Text(
              //                       '1:00:00',
              //                       style: TextStyle(
              //                         fontFamily:kFontFamily,
              //                         fontWeight: FontWeight.w700,
              //                         fontSize: 16,
              //                         color: Colors.red,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               Row(
              //                 children: [
              //                   FittedBox(
              //                     child: SvgPicture.asset('images/exam.svg'),
              //                   ),
              //                   SizedBox(
              //                     width: width * .035,
              //                   ),
              //                   FittedBox(
              //                     child: Text(
              //                       'درجة النجاح',
              //                       style: TextStyle(
              //                           fontFamily:kFontFamily,
              //                           fontSize: 16),
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     width: width * .035,
              //                   ),
              //                   FittedBox(
              //                     child: Text(
              //                       '60%',
              //                       style: TextStyle(
              //                         fontFamily:kFontFamily,
              //                         fontWeight: FontWeight.w700,
              //                         fontSize: 16,
              //                         color: Colors.red,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ))
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildQuestion(int count,String question,List answers){
    var groupValue;
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*kPadding),
          child: Row(
             children: [
               Text(count.toString()+'.',style: TextStyle(fontSize: kTitleSize,fontWeight: FontWeight.bold),),
               Text(question,style: TextStyle(fontSize: kSubTitleSize),)
             ],
          ),
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
              itemCount: answers.length,
              itemBuilder:(context,index)=>( buildOption(count,answers[index]))),
        )
      ],
    );
  }
  Widget buildOption(int value,String name){
    var groupValue;
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: (value) {
              groupValue = value;
          },
        ),
        Text(name,style:const TextStyle(fontWeight: FontWeight.bold),),
      ],
    );
  }
}
