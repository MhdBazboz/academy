import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/components.dart';
import '../components/const.dart';

class TestResultScreen extends StatelessWidget {
  const TestResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyAppBar(title: 'أسم الكورس'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/svg/note.svg'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'تهانينا لقد أنجزت المقرر 1.1',
                            style: TextStyle(
                              color: Color(0xffFF2020),
                              fontSize: 15,
                              fontFamily: kFontFamily,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'التقييم',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: kFontFamily,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TestMark(
                        mark: 88.5,
                      ),
                      // نتيجة الفحص : راسب او ناجح
                      FinalResult(),
                      TitleWithValueRow(
                        title: 'وقت الإختبار',
                        value: '00:07:25',
                      ),
                      TitleWithValueRow(
                        title: 'النقاط',
                        value: '7/5',
                      ),
                      TitleWithValueRow(
                        title: 'عدد الأسئلة',
                        value: '7',
                      ),
                      TitleWithValueRow(
                        title: 'الأسئلة الصحيحة',
                        value: '5',
                      ),
                      TitleWithValueRow(
                        title: 'الأسئلة الخطأ',
                        value: '2',
                      ),
                      const TitleWithValueRow(
                        title: 'الأسئلة المتجاوزة',
                        value: '0',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyButton(
                            title: 'إعادة الإختبار (1)',
                            width: size.width * 0.4,
                            onTap: () {}, height: 150,
                          ),
                          MyButton(
                            height: 150,
                            title: 'مشاهدة الإختبار',
                            width: size.width * 0.4,
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleWithValueRow extends StatelessWidget {
  final String title;
  final dynamic value;

  const TitleWithValueRow({Key? key, required this.title, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w600,
            ),
          ),
          // SizedBox(
          //   width: 80,
          // ),
          Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class FinalResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: size.width * 0.38,
        height: 45,
        margin: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          //color: Colors.green,
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(colors: [
            Color(0xff00B706),
            Colors.green.shade800,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Center(
          child: Text(
            'ناجح',
            style: TextStyle(
              fontSize: 18,
              fontFamily: kFontFamily,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class TestMark extends StatelessWidget {
  final double mark;

  const TestMark({Key? key, required this.mark}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '% ${mark.toString()}',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xff00B706),
            ),
          ),
          Container(
            height: 1.2,
            width: 120,
            margin: EdgeInsets.symmetric(vertical: 10),
            color: Colors.black,
          ),
          Text(
            '% 60',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
