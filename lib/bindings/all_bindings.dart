import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:nasa_app/controllers/asteroid_controller.dart';

class AllBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AsteroidController());
  }

}