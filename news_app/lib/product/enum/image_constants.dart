import 'package:flutter/material.dart';

enum IconConstants {
  microphone('ic_microphone');

  final String value;
  const IconConstants(this.value);
  String get toPng => 'assets/icon/$value.png';
}

class image extends StatelessWidget {
  const image({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(IconConstants.microphone.toPng);
  }
}
