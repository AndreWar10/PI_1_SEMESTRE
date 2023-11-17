import 'package:apaixonautas_site/core/components/item_not_found.dart';
import 'package:apaixonautas_site/core/components/loading.dart';
import 'package:apaixonautas_site/core/components/without_network.dart';
import 'package:apaixonautas_site/core/exceptions.dart';
import 'package:apaixonautas_site/solar_system/controllers/solar_system_controller.dart';
import 'package:apaixonautas_site/solar_system/models/solar_system_model.dart';
import 'package:apaixonautas_site/solar_system/pages/solar_system_page.dart';
import 'package:apaixonautas_site/solar_system/pages/solar_system_page_web.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SolarSystemContainer extends StatefulWidget {
  const SolarSystemContainer({super.key});

  @override
  State<SolarSystemContainer> createState() => _SolarSystemContainerState();
}

class _SolarSystemContainerState extends State<SolarSystemContainer> {
  @override
  Widget build(BuildContext context) {
    SolarSystemController controller = SolarSystemController();

    return Scaffold(
      body: FutureBuilder(
          future: controller.fetchSolarSystemData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isNotEmpty) {
                final List<SolarSystemModel> listPlanets = snapshot.data!;
                return ResponsiveBuilder(
                  builder: (context, sizingInformation) {
                    // Check the sizing information here and return your UI
                    if (sizingInformation.deviceScreenType ==
                        DeviceScreenType.desktop) {
                      return SolarSystemPageWeb(listPlanets: listPlanets);
                    }

                    if (sizingInformation.deviceScreenType ==
                        DeviceScreenType.tablet) {
                      return SolarSystemPage(listPlanets: listPlanets);
                    }

                    return SolarSystemPage(listPlanets: listPlanets);
                  },
                );
              }
            }

            if (snapshot.hasError) {
              if (snapshot.error is NoInternetException) {
                return WithoutNetwork(
                  error: snapshot.error as NoInternetException,
                  funcUpdate: () => setState(() {}),
                );
              }
              if (snapshot.error is NoServiceFoundException)
                () => const InfoNotFound(information: 'sistema solar');
              if (snapshot.error is InvalidFormatException)
                () => const InfoNotFound(information: 'sistema solar');
              //default error
              return const InfoNotFound(information: 'sistema solar');
            }

            //snapshot.loading
            return const CustomLoadingWidget(
              screenName: 'dados do sistema solar',
            );
          }),
    );
  }
}
