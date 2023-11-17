import 'package:apaixonautas_site/news/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsWebItem extends StatelessWidget {
  const NewsWebItem({Key? key, required this.news}) : super(key: key);

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (h) {},
      onExit: (e) {},
      child: GestureDetector(
        onTap: () {
          if (news.url.isNotEmpty) {
            launchUrl(Uri.parse(news.url));
          }

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => NewsDetailPage(
          //       news: news,
          //     ),
          //   ),
          // );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                color: const Color(0xFF2C2E2F),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: Image(
                        image: NetworkImage(news.imageUrl),
                        fit: BoxFit.fill,
                        loadingBuilder: (_, child, progress) {
                          if (progress == null) return child;
                          return const CircularProgressIndicator
                              .adaptive(); //adaptative muda de acordo com a plataforma android/ios,etc
                        },
                        errorBuilder: (context, error, stackTrace) => SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset('assets/news/space.jpeg',
                                fit: BoxFit.fill))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: NewsTitleWidget(news: news),
                  ),
                  const SizedBox(height: 5),
                  //   Padding(
                  // padding: const EdgeInsets.only(left: 8, right: 8),
                  //     child: NewsTextWidget(news: news),
                  //   ),
                  const SizedBox(height: 10),
                  //   Padding(
                  // padding: const EdgeInsets.only(left: 8, right: 8),
                  //     child: NewsDateAndShareWidget(news: news),
                  //   ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NewsTitleWidget extends StatelessWidget {
  final NewsModel news;

  const NewsTitleWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Text(
      news.title,
      style: const TextStyle(color: Colors.white),
    );
  }
}
