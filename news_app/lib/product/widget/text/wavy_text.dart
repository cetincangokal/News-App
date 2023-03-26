import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:news_app/product/constants/color_constants.dart';
import 'package:news_app/product/constants/string_constants.dart';

class WavyBoldText extends StatelessWidget {
  const WavyBoldText({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        WavyAnimatedText(
          title,
          textStyle: context.textTheme.headlineSmall?.copyWith(
              color: ColorConstants.white, fontWeight: FontWeight.bold,),
        ),
      ],
    );
  }
}