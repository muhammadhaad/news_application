import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/model/news/news_add_new.dart';
import 'package:news_application/model/news/news_generator.dart';
import 'package:news_application/model/news/news_model.dart';

class NewsFeedCard extends StatefulWidget {
  final NewsData newsData;

  NewsFeedCard({this.newsData});

  @override
  _NewsFeedCardState createState() => _NewsFeedCardState();
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  @override
  Widget build(BuildContext context) {
    NewsGenerator nd = new NewsGenerator();

    Post post = new Post();
    return GestureDetector(
      onTap: () {
        /*Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FullNewsPage(snapshot.data[index])),
        );*/
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5.0,
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: nd.getPostImageUrl(widget.newsData.imageUrl),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(snapshot.data);
                  }
                  if (snapshot.data == null) {
//                    print("data = " +snapshot.data);
                    return Text("Loading");
                  } else
                    return Text("error");
                },
              ),
//              Container(
//                height: 200.0,
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(10.0),
//                      topRight: Radius.circular(10.0),
//                    ),
//                    image: FutureBuilder(
//                        future: nd.getPostImageUrl(newsData.imageUrl),
//                        builder: (context,snapshot){
//                          return Image.network(snapshot)
//                        },
//                      ),
//                     ),
//              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${widget.newsData.heading}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, bottom: 8.0, top: 0.0),
                child: Text(
                  "${widget.newsData.description}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15.0, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, bottom: 8.0, top: 0.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      size: 18,
                    ),
                    Text(
                      //todo have to set data format
                      "  ${widget.newsData.date}",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Spacer(),
                    Text(
                      "${widget.newsData.likes}",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    IconButton(
                      iconSize: 20,
                      icon: Icon(Icons.favorite),
                      color: widget.newsData.like ? Colors.red : Colors.black12,
                      onPressed: () {
                        setState(() {
                          if (widget.newsData.like) {
                            widget.newsData.like = false;
                            if (widget.newsData.likes != 0) {
                              widget.newsData.likes--;
                            }
                          } else {
                            widget.newsData.like = true;
                            widget.newsData.likes++;
                          }
                          print(widget.newsData.articleId);
                          print(widget.newsData.likes);
                          print(widget.newsData.like);

                          post.updateLikeDislike(widget.newsData.articleId,
                              widget.newsData.like, widget.newsData.likes);
                        });
                      },
                      padding: EdgeInsets.all(10.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
