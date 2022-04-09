
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../components/components.dart';
import '../../../components/const.dart';
import '../../../controllers/university_controller.dart';


class University extends StatelessWidget {
  const University({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(width * .03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  'الكليات الجامعية',
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    fontSize: kTitleSize,
                  ),
                ),
              ),
              SizedBox(
                height: height*.015,
              ),
              GetBuilder<UniversityController>(
                init: UniversityController(),
                builder: (controller) => SizedBox(
                  height: height,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.getImages().length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: width * .03,
                        crossAxisSpacing: height * .02),
                    itemBuilder: (context, index) => ItemCard(
                      height: height,
                      width: width,
                      image: controller.getImages()[index],
                      title: controller.getNames()[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),);
  }
}
