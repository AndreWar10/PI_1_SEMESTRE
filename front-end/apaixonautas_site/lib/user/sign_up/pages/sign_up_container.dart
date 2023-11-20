
import 'package:apaixonautas_site/user/sign_up/pages/sign_up_mobile_page.dart';
import 'package:apaixonautas_site/user/sign_up/pages/sign_up_web_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignUpContainer extends StatelessWidget {
  const SignUpContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return const SignUpWebPage();
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return const SignUpWebPage();
        }

        return const SignUpMobilePage();
      },
    );
  }
}