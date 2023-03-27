import 'package:flutter/material.dart';

enum IconConstants {
  microphone('ic_microphone'),
  appIcon('ic_logo_icon'),
  ;

  final String value;
  const IconConstants(this.value);
  String get toPng => 'assets/icon/$value.png';
  Image get toImage => Image.asset(toPng);
}
