import 'package:apaixonautas_site/user/forget_network/pages/forget_network_mobile_page.dart';
import 'package:apaixonautas_site/user/forget_network/pages/forget_network_web_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ForgetNetworkContainer extends StatelessWidget {
  const ForgetNetworkContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return const ForgetNetworkWebPage();
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return const ForgetNetworkWebPage();
        }

        return const ForgetNetworkMobilePage();
      },
    );
  }
}
