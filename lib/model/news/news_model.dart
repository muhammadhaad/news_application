class NewsData {
  int articleId;
  String imageUrl;
  String heading;
  String description;
  String date;
  String category;

  //String authorID;
  int likes;
  bool like;

  NewsData(
      {this.imageUrl,
      this.heading,
      this.description,
      this.date,
      this.category,
      this.likes,
      this.like});
}
