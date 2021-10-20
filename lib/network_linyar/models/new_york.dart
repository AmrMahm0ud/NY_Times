class ArticleModel {
  int? articleId;
  String? articleSource;
  String? articleSubsection;
  String? articleTitle;
  String? authorName;
  String? articlePublishedDate;
  String? articlePhoto;
  String? abstractArticle;
  final String blankPhoto =
      "https://firebasestorage.googleapis.com/v0/b/flutter-chat-ec1f2.appspot.com/o/blankphoto.jpg?alt=media&token=174ed9ac-6577-499c-bc09-c58929edf3f3";

  ArticleModel(


      this.articleId,
      this.articleSource,
      this.articleSubsection,
      this.articleTitle,
      this.authorName,
      this.articlePublishedDate,
      this.articlePhoto,
      this.abstractArticle);

  ArticleModel.fromMap(Map<String, dynamic> articleFromMap) {
    articleId = articleFromMap['id'] as int;
    articleSource = articleFromMap['source'] as String;
    articleSubsection = articleFromMap['subsection'] as String;
    articleTitle = articleFromMap['title'] as String;
    authorName = articleFromMap['byline'] as String;
    articlePublishedDate = articleFromMap['published_date'] as String;
    abstractArticle = articleFromMap['abstract'] as String;
    try {
      articlePhoto =
          articleFromMap['media'][0]['media-metadata'][2]['url'] as String;
    } catch (error) {
      articlePhoto = blankPhoto;
    }
  }
}
