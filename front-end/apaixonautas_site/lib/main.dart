import 'package:apaixonautas_site/config/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  setUrlStrategy(PathUrlStrategy());

  runApp(MyApp());
}
