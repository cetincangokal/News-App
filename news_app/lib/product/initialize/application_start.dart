

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:news_app/firebase_options.dart';

class ApplicationStart {
  @immutable
  ApplicationStart._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await DeviceUtility.deviceInit();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  }
}