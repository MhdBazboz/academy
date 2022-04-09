import 'package:get/get.dart';

import '../models/collages_models.dart';

class CollageController extends GetxController{
  List<String> getNames () {
    return collageNames;
  }

  List<String> getImages () {
    return collageImages;
  }

}