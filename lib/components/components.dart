import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../views/course page/course_page.dart';
import 'const.dart';


class MyAppBar extends StatelessWidget {
  final String title;

  const MyAppBar({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        width: size.width,
        height: size.height * 0.11,
        decoration: BoxDecoration(
          color: kSwatchColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(32),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 18,
                    fontFamily: kFontFamily,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BorderedButton extends StatelessWidget {
  final String title;
  final Color color;
  final onPress;

  const BorderedButton(
      {Key? key,
        required this.title,
        required this.color,
        required this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      //width: size.width,
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: RaisedButton(
        onPressed: onPress,
        splashColor: color,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
          side: BorderSide(color: color, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: FittedBox(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
               // fontSize: 12,
              ),
            ),
          ),
        ),
        //color: Colors.white,
      ),
    );
  }
}

class Course extends StatelessWidget {
  const Course({
    Key? key,
    required this.width,
    required this.height,
    required this.courseImage,
    required this.platformImage,
    required this.courseName,
    required this.coursePrice,
    required this.courseCommentsCount,
    required this.courseStudentsCount,
    required this.tag,
    required this.onTap,
  }) : super(key: key);

  final double width;
  final double height;
  final VoidCallback onTap;
  final String courseImage,
      platformImage,
      courseName,
      coursePrice,
      courseCommentsCount,
      courseStudentsCount,
      tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(width * .03),
        height: height * .33,
        width: width * .43,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9.0),
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: kSecondaryColor,
            ),
          ],
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Hero(
                  tag: tag,
                  child: Container(
                    height: height * .142,
                    width: width * .43,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(9.0),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(courseImage),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  minRadius: 24,
                  maxRadius: 28,
                  backgroundImage: NetworkImage(platformImage),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(width * .03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * .45,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          courseName,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: kFontFamily,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          coursePrice,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: kFontFamily,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.comment_outlined),
                              FittedBox(
                                child: Text(
                                  '($courseCommentsCount)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: kFontFamily,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.group),
                              FittedBox(
                                child: Text(
                                  '(${courseStudentsCount})',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily:kFontFamily,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // FittedBox(
                      //   child: Text(
                      //     platformName,
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //       fontFamily:kFontFamily,
                      //       fontWeight: FontWeight.w400,
                      //       decoration: TextDecoration.underline,
                      //       color: Colors.blueGrey,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.height,
    required this.width,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final double height;
  final double width;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height * .07,
        width: width * .4,
        decoration: BoxDecoration(
          color: kSwatchColor,
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child:  Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily:kFontFamily,
              ),
            ),
          ),
        )
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.height,
    required this.width,
    required this.image,
    required this.title,
  }) : super(key: key);

  final double height;
  final double width;
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedBuilder: (context, action) => SizedBox(
        height: height * .25,
        width: width * .35,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: height * .01),
              height: height * .17,
              width: width * .35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  isAntiAlias: true,
                ),
                color: Colors.black,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Container(
                color: kSwatchColor,
                height: height * .1,
                width: width,
                child: FittedBox(
                  child:  Text(
                      title,
                      style: TextStyle(
                        fontFamily: kFontFamily,
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                ),
              ),
            )
          ],
        ),
      ),
      openBuilder: (context, action) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAppBar(title: title),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [ GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: height * .37,
                      mainAxisSpacing: width * .03,
                      //   crossAxisSpacing: height * .02
                    ),
                    itemBuilder: (context, index) => Course(
                      width: width,
                      height: height,
                      courseImage:
                      'https://aiacademy.info/wp-content/uploads/2020/04/imageedit_1_7774889739-768x512.webp',
                      platformImage:
                      'https://lh3.googleusercontent.com/a-/AOh14Giz3B5xi3irpfXiJEiaB5tmmLcLVWMcB9xM7t4o=s96-c',
                      courseName: 'lawCODip',
                      coursePrice: '\$60.000',
                      courseCommentsCount: '0',
                      courseStudentsCount: '25',
                    //  platformName: 'MAad',
                      onTap: () {
                        Get.to(() => const CoursePage(
                          courseImage:
                          'https://aiacademy.info/wp-content/uploads/2020/04/imageedit_1_7774889739-768x512.webp',
                          degree: 'Diploma',
                          platformImage:
                          'https://lh3.googleusercontent.com/a-/AOh14Giz3B5xi3irpfXiJEiaB5tmmLcLVWMcB9xM7t4o=s96-c',
                          platformName: 'MAad',
                          tag: '1',
                        ));
                      },
                      tag: '1',
                    ),
                  ),],
                ),
              ),
            ),
            //GridView Builder for the courses
          ],
        ),
      ),
    );
  }
}