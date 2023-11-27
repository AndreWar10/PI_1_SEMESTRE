import 'package:apaixonautas_site/user/login/controllers/login_controller.dart';
import 'package:apaixonautas_site/user/login/pages/login_mobile_page.dart';
import 'package:apaixonautas_site/user/login/pages/login_web_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginPageContainer extends StatefulWidget {
  const LoginPageContainer({super.key});

  @override
  State<LoginPageContainer> createState() => _LoginPageContainerState();
}

class _LoginPageContainerState extends State<LoginPageContainer> {
  late LoginController loginController;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  void initState() {
    loginController = LoginController(
      emailController : emailController,
      passController: passController,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return LoginPageWeb(loginController: loginController);
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return LoginPageWeb(loginController: loginController);
        }

        return LoginPageMobile(loginController: loginController);
      },
    );
  }
}
