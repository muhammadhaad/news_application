import 'package:flutter/material.dart';
import 'package:news_application/model/news/news_generator.dart';
import 'package:news_application/model/news/news_model.dart';

class NewsFeedCard extends StatefulWidget {
  NewsFeedCard(AsyncSnapshot<List<NewsData>> snapshot, int index) {
    this._snapshot = snapshot;
    this._index = index;
  }

  AsyncSnapshot<List<NewsData>> _snapshot;
  int _index;

  @override
  _NewsFeedCardState createState() => _NewsFeedCardState(_snapshot, _index);
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  _NewsFeedCardState(AsyncSnapshot<List<NewsData>> snapshot, int index) {
    this.snapshot = snapshot;
    this.index = index;
  }

  AsyncSnapshot<List<NewsData>> snapshot;
  int index;

  final NewsGenerator _newsGenerator = NewsGenerator();

  @override
  void dispose() {
    super.dispose();
    _newsGenerator.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      //todo have to code image logic now hardcoding to test card layout
                      image: AssetImage("assets/images/news_card_template.jpg"),
                      /*image: NetworkImage(snapshot.data[index].imageUrl),*/
                      /*image:
                                    (NetworkImage(snapshot.data[index].imageUrl)),*/
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${snapshot.data[index].heading}",
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
                  "${snapshot.data[index].description}",
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
                      "  ${snapshot.data[index].date}",
                      /* DateFormat.yMMMMd().format(snapshot.data[index].date.toDate()),*/
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Spacer(),
                    Text(
                      "${snapshot.data[index].likes}",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    IconButton(
                      iconSize: 20,
                      icon: Icon(Icons.favorite),
                      color: snapshot.data[index].like
                          ? Colors.red
                          : Colors.black12,
                      onPressed: () {
                        setState(() {
                          //todo have to add
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
