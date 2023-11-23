import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:apaixonautas_site/news/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsWebItem extends StatelessWidget {
  NewsWebItem({Key? key, required this.news}) : super(key: key);

  final NewsModel news;

  final ValueNotifier<bool> showAnimation = ValueNotifier(false);

  void setAnimation(bool value) {
    showAnimation.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (h) {
          setAnimation(true);
        },
        onExit: (e) {
          setAnimation(false);
        },
        child: GestureDetector(
          onTap: () {
            if (news.url.isNotEmpty) {
              launchUrl(Uri.parse(news.url));
            }
          },
          child: Center(
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Container(
                  width: 400,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      news.imageUrl.isNotEmpty
                          ? SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Image.network(
                                news.imageUrl,
                                fit: BoxFit.fill,
                              ),
                            )
                          : SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Image.asset(
                                'assets/news/space.jpeg',
                                fit: BoxFit.fill,
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 16),
                        child: Text(
                          DateFormat('LLLL dd, yyyy')
                              .format(news.publishedAt),
                          style: TextStyle(
                            fontFamily: AppFonts.poppins500,
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Text(
                          news.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: AppFonts.poppins600,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 16),
                        child: Text(
                          news.summary,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: AppFonts.poppins500,
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20, left: 16, right: 16),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.chevron_right,
                              size: 20,
                              color: Colors.deepPurple,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                launchUrl(Uri.parse(news.url));
                              },
                              child: Text(
                                'Find out more',
                                style: TextStyle(
                                  fontFamily: AppFonts.poppins500,
                                  fontSize: 16,
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                print('touch');
                              },
                              child: const Icon(
                                Icons.favorite,
                                size: 26,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: showAnimation,
                  builder: (context, showAnimation, __) {
                    if (showAnimation) {
                      return IgnorePointer(
                        child: Container(
                          width: 400,
                          height: 500,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
