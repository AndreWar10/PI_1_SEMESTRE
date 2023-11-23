import 'package:apaixonautas_site/news/components/web/news_web_item.dart';
import 'package:apaixonautas_site/news/controllers/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NewsWeb extends StatelessWidget {
  const NewsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsController>(
      builder: (_, controller, __) {
        return Container(
          decoration: const BoxDecoration(color: Colors.purple
              // image: DecorationImage(
              //   image: AssetImage(AppAssets.backgroundGIF),
              //   fit: BoxFit.cover,
              // ),
              ),
          child: SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                const SizedBox(height: 20),
                ResponsiveBuilder(
                  builder: (context, sizingInformation) {
                    // Check the sizing information here and return your UI
                    int cross = 4;
                    if (sizingInformation.deviceScreenType ==
                        DeviceScreenType.tablet) {
                      cross = 2;
                    } else if (sizingInformation.deviceScreenType ==
                        DeviceScreenType.mobile) {
                      cross = 1;
                    } else {
                      cross = 4;
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: AlignedGridView.count(
                        // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        //   maxCrossAxisExtent: 400,
                        //   mainAxisExtent: 500,
                        mainAxisSpacing: 16,
                        // ),
                        crossAxisCount: cross,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.newsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return NewsWebItem(news: controller.newsList[index]);
                        },
                      ),
                    );
                  },
                ),

                ValueListenableBuilder(
                  valueListenable: controller.loadingMoreNotifier,
                  builder: (_, loading, __) {
                    if (loading) {
                      return Positioned(
                        bottom: 0,
                        left: (MediaQuery.of(context).size.width / 2) - 16,
                        child: const SizedBox(
                          width: 40,
                          height: 40,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                )
                // const SizedBox(height: 20),

                // TextButton(
                //   style: TextButton.styleFrom(
                //     minimumSize: Size.zero,
                //     padding: EdgeInsets.zero,
                //     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //   ),
                //   onPressed: () {
                //     controller.loadMoreNews();
                //   },
                //   child: Text(
                //     'Carregar mais notícias',
                //     style: TextStyle(
                //       fontFamily: AppFonts.poppins500,
                //       fontSize: 16,
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
