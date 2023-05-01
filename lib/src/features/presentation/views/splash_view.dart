import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:michis/src/core/settings/app_assets.dart';
import 'package:michis/src/features/presentation/controllers/splash_controller.dart';
import 'package:michis/src/injection.dart';

class SplashView extends StatelessWidget {
  static const routeName = '/splash';
  final SplashController _ctrl = sl<SplashController>();
  
  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: this._ctrl,
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Catbreeds',
                  style: TextStyle(color: Colors.black, fontSize: 36, fontWeight: FontWeight.w700),
                ),

                SizedBox(height: 15),
          
                Image.asset(
                  AppAssets.cat1,
                )
              ]
            )
          )
        );
      }
    );
  }
}