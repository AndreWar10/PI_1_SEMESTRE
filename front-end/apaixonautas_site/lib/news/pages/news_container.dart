import 'package:apaixonautas_site/core/components/item_not_found.dart';
import 'package:apaixonautas_site/core/components/loading.dart';
import 'package:apaixonautas_site/core/components/without_network.dart';
import 'package:apaixonautas_site/core/exceptions.dart';
import 'package:apaixonautas_site/news/controllers/news_controller.dart';
import 'package:apaixonautas_site/news/pages/news_web.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NewsContainer extends StatefulWidget {
  const NewsContainer({super.key});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  final NewsController newsController = NewsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: ChangeNotifierProvider<NewsController>(
          create: (_) => NewsController(),
          child: FutureBuilder(
              future: newsController.fetchNewsOfDay(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (newsController.hasNewsOfDay) {
                    return ResponsiveBuilder(
                      builder: (context, sizingInformation) {
                        // Check the sizing information here and return your UI
                        if (sizingInformation.deviceScreenType ==
                            DeviceScreenType.desktop) {
                          return const NewsWeb();
                        }

                        if (sizingInformation.deviceScreenType ==
                            DeviceScreenType.tablet) {
                          return const NewsWeb();
                        }

                        return const NewsWeb();
                      },
                    );
                  } else {
                    //Without News of today :(
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
                    () => const InfoNotFound(information: 'notícias');
                  if (snapshot.error is InvalidFormatException)
                    () => const InfoNotFound(information: 'notícias');
                  //default error
                  return const InfoNotFound(information: 'notícias');
                }

                //snapshot.loading
                return const CustomLoadingWidget(
                  screenName: 'notícias',
                );
              }),
        ),
      ),
    );
  }
}
