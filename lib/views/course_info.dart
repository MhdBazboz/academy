import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../components/components.dart';
import '../components/const.dart';
import '../components/custom_image.dart';
import '../components/video player/video_player.dart';
import 'course_details_screen.dart';

class CourseInfo extends StatefulWidget {
  const CourseInfo({Key? key}) : super(key: key);

  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  int activeTabBar = 0;

  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: MyButton(
             height: 150,
            title: 'أشترك الأن',
            width: size.width,
            onTap: () {}),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // cover Image
            Container(
              width: size.width,
              height: isRegistered ? size.height * 0.29 : size.height * 0.35,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
              ),
              child: isRegistered
                  ? MyVideoPlayer(
                      videoUrl:
                          "https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4",
                    )
                  : CustomImage(
                      'https://data.whicdn.com/images/321215000/original.jpg',
                      radius: 0,
                      width: 60,
                      height: 60,
                    ),
            ),
            Container(
              width: size.width,
              height: size.height,
              margin: EdgeInsets.only(
                  top: isRegistered ? size.height * 0.285 : size.height * 0.3),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: isRegistered
                    ? BorderRadius.zero
                    : BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 40, left: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTabBarButton(
                          title: 'المنهاج',
                          isActive: activeTabBar == 0,
                          onPress: () {
                            setState(() {
                              setState(() {
                                activeTabBar = 0;
                              });
                            });
                          },
                        ),
                        CustomTabBarButton(
                          title: 'التقييمات',
                          isActive: activeTabBar == 1,
                          onPress: () {
                            setState(() {
                              setState(() {
                                activeTabBar = 1;
                              });
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.6),
                    thickness: 1.3,
                    height: 0,
                  ),
                  activeTabBar == 0 ? getCourseContent() : getReviews(),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded getReviews() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 12,
              itemBuilder: (context, index) => CustomerReview(),
            ),
          ],
        ),
      ),
    );
  }

  Expanded getCourseContent() {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const TitleWithDotIcon(
              title: 'المقررات',
              fontSize: 18,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) => ExpansionTile(
                tilePadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'المقرر 1.1 :',
                        ),
                        Text('أسم المقرر'),
                        Text(
                          'مفتوح',
                          style: TextStyle(
                            fontFamily: kFontFamily,
                            color: kSwatchColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'إجراء الاختبار',
                          style: TextStyle(
                            color: Color(0xff00B706),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff00B706),
                          ),
                        ),
                        const Text(
                          'مكتمل',
                          style: TextStyle(
                            color: Color(0xff00B706),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                children: [
                  // here inner content
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const TitleWithDotIcon(
                  title: 'اترك تقييم :',
                  fontSize: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: RatingBar.builder(
                    initialRating: 1,
                    minRating: 1,
                    itemSize: 24,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: kSwatchColor,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
              ],
            ),
            const TitleWithDotIcon(
              title: 'اترك تعليق :',
              fontSize: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: commentController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: MyButton(
                  title: 'إرسال',
                  width: size.width * 0.22,
                  height: 38,
                  onTap: () {}),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomerReview extends StatelessWidget {
  const CustomerReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // user profile image
          CustomImage(
            'https://images.unsplash.com/photo-1537368910025-700350fe46c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',
            radius: 50,
            width: 60,
            height: 60,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('اسم المستخدم'),
                    ClientRating(
                      ratingValue: 4,
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'كورس مفيد جدا و اكثر من رائع كورس مفيد جدا  ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClientRating extends StatelessWidget {
  final double ratingValue;

  const ClientRating({Key? key, required this.ratingValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: ratingValue,
      minRating: 1,
      itemSize: 14,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: false,
      itemCount: 5,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: kSwatchColor,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

class TitleWithDotIcon extends StatelessWidget {
  final String title;
  final double fontSize;

  const TitleWithDotIcon({Key? key, this.fontSize = 16, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Row(
        children: [
          SvgPicture.asset('assets/svg/dot.svg'),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: kFontFamily,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabBarButton extends StatelessWidget {
  final String title;
  final bool isActive;
  final onPress;

  const CustomTabBarButton(
      {Key? key, required this.title, required this.isActive, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPress,
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? kSecondaryColor : Colors.grey,
              fontSize: 20,
              fontFamily: kFontFamily,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
        if (isActive)
          Container(
            width: 90,
            height: 2,
            margin: EdgeInsets.only(bottom: 15),
            color: kSwatchColor,
          ),
      ],
    );
  }
}
