import 'package:flutter/material.dart';
import 'package:news/view/widget/detail_view.dart';

class NewsContainer extends StatelessWidget {
  final String imgUrl;
  final String newsHead;
  final String newsDes;
  final String newsUrl;
  final String newsCnt;

  const NewsContainer({super.key, required this.imgUrl, required this.newsHead, required this.newsDes, required this.newsUrl, required this.newsCnt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(height: 400, width: MediaQuery.of(context).size.width, fit: BoxFit.cover,
              placeholder: "/assets/img/news.jpg", image: imgUrl),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              Text(
                newsHead.length > 90 ?
                    "${newsHead.substring(0, 90)}..." : newsHead, style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Text(newsDes, style: TextStyle(fontSize: 18, color: Colors.black54)),
              const SizedBox(height: 30,),
              Text(
                newsCnt != "--" ?
                newsCnt.length > 100 ? newsCnt.substring(0, 100) :
                "${newsCnt.toString().substring(0, newsCnt.length-15)}..." : newsCnt, style: TextStyle(fontSize: 15),),
              const SizedBox(height: 30,),
            ],
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailViewScreen(newsUrl: newsUrl)));
              }, child: Text("Read More")),
            ),
          ],
        ),
          const SizedBox(height: 20,),
      ],),
    );
  }
}

