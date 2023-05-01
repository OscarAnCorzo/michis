import 'package:get/get.dart';
import 'package:michis/src/features/presentation/views/landing_view.dart';

class SplashController extends GetxController {
  
  @override
  void onReady() {
    super.onReady();

    this.goToLandingView();
  }


  Future<void> goToLandingView() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offAll(() => LandingView());
  }
}