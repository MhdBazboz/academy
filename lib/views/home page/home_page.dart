import 'package:ai_academy/components/const.dart';
import 'package:ai_academy/views/home%20page/pages/collage.dart';
import 'package:ai_academy/views/home%20page/pages/main_page.dart' as main;
import 'package:ai_academy/views/home%20page/pages/unvirsity.dart';
import 'package:ai_academy/views/profile_screen.dart';
import 'package:ai_academy/views/your%20courses/your_courses.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _page = 1;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        color: kSwatchColor,
        animationCurve: Curves.easeOutExpo,
        items:  <Widget>[
          SvgPicture.asset('images/unvirsites.svg',color:Color(0xff32504F),width: 35,height: 35,),
       const   Icon(
            Icons.home,
            size: 38,
            color: Color(0xff32504F),
            // color: context.isDarkMode ? kTextColorWhiteDark : Colors.black26,
          ),
          SvgPicture.asset('images/collages.svg',color:Color(0xff32504F),width: 35,height: 35,),
        ],
        onTap: (index) {
          setState(() {
            if (_page != index) {
              _page = index;
            } else {
              _page = _page;
            }
          });
        },
      ),
      endDrawer: Drawer(
        child: Container(
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/drawer.png'),
              fit: BoxFit.fill,
              filterQuality: FilterQuality.high,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(()=>ProfileScreen());
                      },
                      child: ListTile(
                        leading: SvgPicture.asset('images/user (1).svg'),
                        title: Text(
                          'الصفحة الشخصية',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kFontFamily,
                            fontSize: kTitleSize,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: SvgPicture.asset('images/online-education.svg'),
                      title: Text(
                        'الدورات',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: kFontFamily,
                          fontSize: kTitleSize,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                       Get.to(()=>const YourCourses());
                      },
                      child: ListTile(
                        leading: SvgPicture.asset('images/online-course (1).svg'),
                        title: Text(
                          'الكورسات الخاصة بك',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: kFontFamily,
                            fontSize: kTitleSize,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: SvgPicture.asset('images/contact-us.svg'),
                      title: Text(
                        'تواصل معنا',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontFamily: kFontFamily,
                          fontSize: kTitleSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        shadowColor: Colors.black,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.person), onPressed: () {  },),
       // iconSize: 50,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: SvgPicture.asset('images/menu.svg'),
        //   ),
        // ],
      ),
      body: IndexedStack(
        index: _page,
        children:const [
          University(),
          main.MainPage(),
          Collage(),
        ],
      ),

    );
  }
}