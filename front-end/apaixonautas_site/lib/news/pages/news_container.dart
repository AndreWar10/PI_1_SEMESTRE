import 'package:apaixonautas_site/core/components/custom_web_menu.dart';
import 'package:apaixonautas_site/core/components/item_not_found.dart';
import 'package:apaixonautas_site/core/components/loading.dart';
import 'package:apaixonautas_site/core/models/data_model.dart';
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
  final ScrollController scrollController = ScrollController();
  late NewsController newsController;

  @override
  void initState() {
    newsController = NewsController(scrollController: scrollController);
    super.initState();
  }

  @override
  void dispose() {
    newsController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderWeb(),
      drawer: const HeaderMobile(),
      body: Container(
        width: double.infinity,
        height: Data.height,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: ChangeNotifierProvider.value(
          value: newsController,
          child:
              Consumer<NewsController>(builder: (context, newsController, __) {
            return Stack(
              children: [
                if (newsController.hasNewsOfDay) ...{
                  ResponsiveBuilder(
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
                  )
                } else ...{
                  ResponsiveBuilder(
                    builder: (context, sizingInformation) {
                      // Check the sizing information here and return your UI
                      if (sizingInformation.deviceScreenType ==
                          DeviceScreenType.desktop) {
                        return const InfoNotFound(information: 'notícias');
                      }

                      if (sizingInformation.deviceScreenType ==
                          DeviceScreenType.tablet) {
                        return const InfoNotFound(information: 'notícias');
                      }

                      return const InfoNotFound(information: 'notícias');
                    },
                  )
                },
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 58, 58, 58),
                    onPressed: () {
                      newsController.scrollController.animateTo(
                        0,
                        duration: const Duration(seconds: 1),
                        curve: Curves.ease,
                      );
                    },
                    child: const Icon(
                      Icons.expand_less,
                      size: 30,
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: newsController.loadingNotifier,
                  builder: (_, isloading, __) {
                    if (isloading == true) {
                      return const CustomLoadingWidget(
                        screenName: 'notícias',
                      );
                    }
                    return const SizedBox();
                  },
                )
              ],
            );

            // FutureBuilder(
            //   future: newsController.fetchNewsOfDay(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       if (newsController.hasNewsOfDay) {
            // return ResponsiveBuilder(
            //   builder: (context, sizingInformation) {
            //     // Check the sizing information here and return your UI
            //     if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            //       return const NewsWeb();
            //     }

            //     if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
            //       return const NewsWeb();
            //     }

            //     return const NewsWeb();
            //   },
            // );
            //       } else {
            //         //Without News of today :(
            //       }
            //     }

            //     if (snapshot.hasError) {
            //       if (snapshot.error is NoInternetException) {
            //         return WithoutNetwork(
            //           error: snapshot.error as NoInternetException,
            //           funcUpdate: () => setState(() {}),
            //         );
            //       }
            //       if (snapshot.error is NoServiceFoundException) {
            //         () => const InfoNotFound(information: 'notícias');
            //       }
            //       if (snapshot.error is InvalidFormatException) {
            //         () => const InfoNotFound(information: 'notícias');
            //       }
            //       //default error
            //       return const InfoNotFound(information: 'notícias');
            //     }

            //     //snapshot.loading
            //     return const CustomLoadingWidget(
            //       screenName: 'notícias',
            //     );
            //   },
            // );
          }),
        ),
      ),
    );
  }
}
