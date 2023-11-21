import 'package:apaixonautas_site/user/sign_up/controllers/signup_controller.dart';
import 'package:apaixonautas_site/user/sign_up/pages/sign_up_mobile_page.dart';
import 'package:apaixonautas_site/user/sign_up/pages/sign_up_web_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignUpContainer extends StatefulWidget {
  const SignUpContainer({super.key});

  @override
  State<SignUpContainer> createState() => _SignUpContainerState();
}

class _SignUpContainerState extends State<SignUpContainer> {
  late SignUpController signUpController;

  @override
  void initState() {
    signUpController = SignUpController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return SignUpWebPage(signUpController: signUpController);
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return SignUpWebPage(signUpController: signUpController);
        }

        return SignUpMobilePage(signUpController: signUpController);
      },
    );
  }
}
