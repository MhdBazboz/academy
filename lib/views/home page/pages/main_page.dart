import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/const.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    return  SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(size.width*kPadding),
        child: Column(
          children: [
            Row(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('مرحبا بك',style: TextStyle(fontSize: kTitleSize),),
                ),
                SizedBox(width: 5,),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('الاسم',style: TextStyle(fontFamily: kFontFamily,color: kSwatchColor,fontSize: kTitleSize),),
                ),
              ],
            ),
            SearchTextField(),
            SizedBox(height: size.height*.025,),
            Container(
              width: size.width,
              height: 110,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  UniversityContainer(name: 'ادارة أعمال', color: Color(0xff32504F),icon: SvgPicture.asset('images/portfolio.svg',color: Colors.white,),),
                  UniversityContainer(name: 'الحقوق', color: Color(0xff0096B1),icon: SvgPicture.asset('images/justice.svg',color: Colors.white)),
                  UniversityContainer(name: 'هندسة', color: Color(0xffE2498A),icon: SvgPicture.asset('images/connection.svg',color: Colors.white)),
                  UniversityContainer(name: 'الصحة', color: Color(0xff0096B1),icon: SvgPicture.asset('images/pharmacy.svg',color: Colors.white)),
                  UniversityContainer(name: 'العلوم', color: Color(0xff562DD4),icon: SvgPicture.asset('images/microscope.svg',color: Colors.white)),
                  UniversityContainer(name: 'الصحافة', color: Color(0xffFFB606),icon: SvgPicture.asset('images/journalism.svg',color: Colors.white)),
                  UniversityContainer(name: 'الاداب', color: Color(0xffFF067D),icon: SvgPicture.asset('images/literature.svg',color: Colors.white)),
                  UniversityContainer(name: 'العلوم السياسية', color: Color(0xffF4B110),icon: SvgPicture.asset('images/political-science.svg',color: Colors.white)),
                  UniversityContainer(name: 'الفنون', color: Color(0xff32504F),icon: SvgPicture.asset('images/art-studies.svg',color: Colors.white)),
                  UniversityContainer(name: 'الدراسات الاسلامية', color: Color(0xff0096B1),icon: SvgPicture.asset('images/quran.svg',color: Colors.white)),
                  UniversityContainer(name: 'التربية', color: Color(0xff562DD4),icon: SvgPicture.asset('images/education.svg',color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: size.height*.005,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FittedBox(child: Text('أبرز ',style: TextStyle(fontSize: kTitleSize),),),
                    FittedBox(child: Text('المساقات',style: TextStyle(fontSize: kTitleSize,color: kSwatchColor,fontWeight: FontWeight.bold),),)
                  ],
                ),
                FittedBox(child: Text('عرض الكل',style: TextStyle(fontSize: kTitleSize))),
              ],
            ),
            SizedBox(height: size.height*.005,),
            Container(
              width: size.width,
              height: 175,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Collage(image: 'images/collage.png', name: 'دورة بوصلة التفكير', onPressed:(){} ),
                  Collage(image: 'images/collage.png', name: 'دورة بوصلة التفكير', onPressed:(){} ),
                  Collage(image: 'images/collage.png', name: 'دورة بوصلة التفكير', onPressed:(){} ),
                  Collage(image: 'images/collage.png', name: 'دورة بوصلة التفكير', onPressed:(){} ),
                  Collage(image: 'images/collage.png', name: 'دورة بوصلة التفكير', onPressed:(){} ),
                  Collage(image: 'images/collage.png', name: 'دورة بوصلة التفكير', onPressed:(){} ),
                  Collage(image: 'images/collage.png', name: 'دورة بوصلة التفكير', onPressed:(){} ),
                ],
              ),
            ),
            SizedBox(height: size.height*.005,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FittedBox(child: Text('أبرز ',style: TextStyle(fontSize: kTitleSize),),),
                    FittedBox(child: Text('الدورات',style: TextStyle(fontSize: kTitleSize,color: kSwatchColor,fontWeight: FontWeight.bold),),)
                  ],
                ),
                FittedBox(child: Text('عرض الكل',style: TextStyle(fontSize: kTitleSize))),
              ],
            ),
            Container(
              width: size.width,
              height: 175,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Course(image: 'images/collage.png', name: 'دورة بوصلة التفكير', onPressed:(){} ),
                  Course(image: 'images/collage.png', name: 'دورة بوصلة التفكير', onPressed:(){} ),
                  Course(image: 'images/collage.png', name: 'دورة بوصلة التفكير', onPressed:(){} ),
                  Course(image: 'images/collage.png', name: 'دورة بوصلة التفكير', onPressed:(){} ),
                  Course(image: 'images/collage.png', name: 'دورة بوصلة التفكير', onPressed:(){} ),
                  Course(image: 'images/collage.png', name: 'دورة بوصلة التفكير', onPressed:(){} ),
                  Course(image: 'images/collage.png', name: 'دورة بوصلة التفكير', onPressed:(){} ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(

        //  focusNode:FocusScope.of(context).unfocus();,
        decoration: InputDecoration(
          focusColor: kSwatchColor,
          // iconColor: kSwatchColor,
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
          filled: true,
          // fillColor: isLightMode.value
          //     ? Color(0xffF2F0F0)
          //     : Colors.black.withOpacity(0.4),
          prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(Icons.search)
          ),
          suffixIcon: Container(
            width: 45,
            decoration: BoxDecoration(
                color: kSwatchColor,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Icon(Icons.filter_alt,color: Colors.white,),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kSecondaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}
class Collage extends StatelessWidget{
  Collage({Key? key,required this.image,required this.name,required this.onPressed}) : super(key: key);
  Function() onPressed;
  String image;
  String name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover
                ),
              ),
            ),
          ),
          FittedBox(
            child: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }

}
class Course extends StatelessWidget{
  Course({Key? key,required this.image,required this.name,required this.onPressed}) : super(key: key);
  Function() onPressed;
  String image;
  String name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover
                ),
              ),
            ),
          ),
          FittedBox(
            child: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }

}
class UniversityContainer extends StatelessWidget{
  const UniversityContainer({Key? key, required this.name, required this.color, required this.icon}) : super(key: key);
  final String name;
  final Color color;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(child: icon),
          ),
          FittedBox(
            child: Text(name),
          )
        ],
      ),
    );
  }

}