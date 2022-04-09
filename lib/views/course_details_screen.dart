import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/components.dart';
import '../components/const.dart';

class CourseDetailsScreen extends StatelessWidget {
  const CourseDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAppBar(title: 'لمحة عامة'),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CourseDetailsSection(),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TitleText(title: 'لمحة عن الكورس'),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'دكتوراه علم النفس التربوي',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: kFontFamily,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          const TitleText(title: 'تعريف التخصص'),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'يدرسُ علم النّفس فعالية الفرد طِوال حياته، فهو يدرسه من أوّل تكوينه وهو جنين إلى الرّضاعةِ فالطفولة فالفتّوَة فالنّضج، لا بل أبعد من ذلك إلى سنواتِ ضعفهِ ووهنِهِ الأخير. ويهتمّ علم النفس بمعرفة قوانين الفعالية العامّة، كقوانين التّعلم والتفكير والانفعال، فهو العلم الذي يدرس فعالية الفرد. ونحن نستعمل كلمة (الفعالية) هنا بمعنًى واسع جدًا، فهي تشمل فعاليات الإدراك التّي تمكنّنا من الحصول على المعرفة كالسّمع والنظر والتذكّر والتفكير، وفعاليات العاطفية كالضّحك والصراخ والشّعور بالفرح أو الحزن.[١] وبذلك فعلم النّفس هو دراسة العقل، ومحاولةٌ جادّة للانطلاق إلى ما وراء الإنسان الطبيعيّ لفهم الأفكار والرّغبات والدوافع والحوافز والمشاعر',
                              style: TextStyle(
                                fontFamily: kFontFamily,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          const TitleText(title: 'مجالات عمل تخصص علم النفس'),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, Index) => SubtitleText(
                              text: 'الارشاد النفسي.',
                            ),
                          ),
                        ],
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

/*
*
*
 */
class SubtitleText extends StatelessWidget {
  final String text;

  const SubtitleText({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SvgPicture.asset('assets/svg/dot.svg'),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: kFontFamily,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class CourseDetailsSection extends StatelessWidget {
  const CourseDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleText(
          title: 'تفاصيل الكورس',
        ),
        CourseDetailsRow(
          iconUrl: 'assets/svg/video.svg',
          title: 'المقررات : ',
          value: 6,
        ),
        CourseDetailsRow(
          iconUrl: 'assets/svg/subject.svg',
          title: 'الإختبارات : ',
          value: 6,
        ),
        CourseDetailsRow(
          iconUrl: 'assets/svg/timer.svg',
          title: 'المدة : ',
          value: '01:00:00',
        ),
        CourseDetailsRow(
          iconUrl: 'assets/svg/up-arrow.svg',
          title: 'الدرجة : ',
          value: 6,
        ),
        CourseDetailsRow(
          iconUrl: 'assets/svg/online-education.svg',
          title: 'عدد الطلاب : ',
          value: 6,
        ),
      ],
    );
  }
}

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '- ',
          style: TextStyle(
            fontSize: 30,
            color: Colors.red,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 19,
            fontFamily: kFontFamily,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class CourseDetailsRow extends StatelessWidget {
  final String iconUrl;
  final String title;
  final dynamic value;

  const CourseDetailsRow(
      {Key? key,
      required this.iconUrl,
      required this.title,
      required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            iconUrl,
            fit: BoxFit.none,
            width: 25,
            height: 25,
            color: kSwatchColor,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontFamily: kFontFamily,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            value.toString(),
            style: TextStyle(
              fontSize: 16,
              fontFamily: kFontFamily,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
