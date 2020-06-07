import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mystore_project/utilities/mystore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/config/config_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  MyStore.prefs = await SharedPreferences.getInstance();
  runApp(ConfigPage());
}
