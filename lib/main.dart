import 'package:michis/src/features/presentation/app.dart';
import 'package:michis/src/injection.dart' as i;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await i.init();
  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(App());
  });
}
