import 'package:flutter/material.dart';

import '../../../model/news/news_generator.dart';

class FullNewsPage extends StatefulWidget {
  String imageUrl;
  String heading;
  String description;
  String date;
  bool like;
  int likes;

  FullNewsPage(String imageUrl, String heading, String description, String date,
      bool like, int likes) {
    this.likes = likes;
    this.like = like;
    this.date = date;
    this.description = description;
    this.heading = heading;
    this.imageUrl = imageUrl;
  }

  @override
  _FullNewsPageState createState() => _FullNewsPageState();
}

class _FullNewsPageState extends State<FullNewsPage> {
  NewsGenerator nd = new NewsGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Full news article"),
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: nd.getPostImageUrl(widget.imageUrl),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${widget.heading}",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, bottom: 16.0, top: 0.0),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          size: 18,
                        ),
                        Text(
                          //todo have to set data format
                          "  ${widget.date}",
                          /* DateFormat.yMMMMd().format(snapshot.data[index].date.toDate()),*/
                          style: TextStyle(fontSize: 12.0),
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Text(
                  "${widget.likes}",
                  style: TextStyle(fontSize: 12.0),
                ),
                IconButton(
                  iconSize: 20,
                  icon: Icon(Icons.favorite),
                  color: widget.like ? Colors.red : Colors.black12,
                  onPressed: () {
                    setState(() {
                      if (widget.like) {
                        widget.like = false;
                        if (widget.likes != 0) {
                          widget.likes--;
                        }
                      } else {
                        widget.like = true;
                        widget.likes++;
                      }
                    });
                  },
                  padding: EdgeInsets.all(10.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, bottom: 8.0, top: 0.0),
            child: Text(
              "${widget.description}",
              style: TextStyle(fontSize: 15.0, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
