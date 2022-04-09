import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../components/const.dart';
import '../components/custom_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List textItems = ["الكل", "الغير منتهية", "المنتهية", "نجاح", "فشل"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              title: 'الصفحة الشحصية',
            ),
            // MyAppBar(
            //   title: 'الصفحة الشحصية',
            //   width: size.width,
            //   height: size.height * 0.11,
            // ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.person_sharp,
                  size: 90,
                ),
                Text(
                  'علاء مجبل',
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontFamily: kFontFamily,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: const [
                  CoursesCountContainer(
                    count: 12,
                    title: 'الكورسات المسجلة',
                  ),
                  CoursesCountContainer(
                    count: 10,
                    title: 'الكورسات الفعالة',
                  ),
                  CoursesCountContainer(
                    count: 5,
                    title: 'الكورسات المنتهية',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ...List.generate(
                    5,
                    (index) => AppBarItem(
                      title: textItems[index],
                      onPress: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      isSelected: selectedIndex == index,
                    ),
                  ),
                ],
              ),
            ),
            getCoursesInfo(),
          ],
        ),
      ),
    );
  }

  Widget getCoursesInfo() {
    return IndexedStack(
      index: selectedIndex,
      children: [
        AllCourses(), // index = 0
        AllCourses(), // index = 1
        AllCourses(),
        AllCourses(),
        AllCourses(),
      ],
    );
  }
}

class AppBarItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final onPress;

  const AppBarItem(
      {Key? key,
      required this.title,
      required this.onPress,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onPress,
        child: Column(
          children: [
            Container(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    color: kSecondaryColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: kFontFamily,
                  ),
                ),
              ),
            ),
            if (isSelected)
              Container(
                height: 3,
                width: 45,
                color: kSwatchColor,
                margin: EdgeInsets.only(top: 3),
              ),
          ],
        ),
      ),
    );
  }
}

class AllCourses extends StatelessWidget {
  const AllCourses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => CourseItemCard(
        imageUrl: '',
        title: 'التغيير في المجتمعات',
        date: '12/2/2022',
      ),
    );
  }
}

class CourseItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;

  const CourseItemCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.date})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 10, right: 25, left: 25),
      width: size.width,
      height: 140,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: size.width * 0.33,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  imageUrl,
                ),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => const BlankImageWidget(),
              errorWidget: (context, url, error) => const BlankImageWidget(),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          title,
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 16,
                            fontFamily: kFontFamily,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 30,
                      child: Text(date)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CoursesCountContainer extends StatelessWidget {
  final int count;
  final String title;

  const CoursesCountContainer(
      {Key? key, required this.count, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xff32504F),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
                child: Text(
              count.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              title,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                color: Color(0xff32504F),
                fontFamily: kFontFamily,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
                onPressed: () {},
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
