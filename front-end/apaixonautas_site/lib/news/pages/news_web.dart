import 'package:apaixonautas_site/news/components/web/news_web_item.dart';
import 'package:apaixonautas_site/news/controllers/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsWeb extends StatelessWidget {
  const NewsWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsController>(builder: (_, controller, __) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                controller.navigateToNextPage();
              },
              child: Container(
                  color: Colors.blue,
                  height: 50,
                  width: 100,
                  child: const Text(
                    'Next Page',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.newsList.length,
              itemBuilder: (BuildContext context, int index) {
                return NewsWebItem(news: controller.newsList[index]);
              },
            ),
          ],
        ),
      );
    });
  }
}
