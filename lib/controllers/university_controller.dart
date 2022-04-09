
import 'package:get/get.dart';

import '../models/university_model.dart';

class UniversityController extends GetxController{
  List<String> getNames () {
    return universityNames;
  }

  List<String> getImages () {
    return universityImages;
  }

}