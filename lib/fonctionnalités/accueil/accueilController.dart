import 'package:get/get.dart';

class AccueilController extends GetxController {
  static final AccueilController instance = AccueilController._internal();

 AccueilController._internal();

  var _curentIndex = 0.obs;

  updateCurentIndex(value) => _curentIndex.value = value;

  get curentIndex => _curentIndex.value;
}
