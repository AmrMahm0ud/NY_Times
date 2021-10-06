class NewYork {
  Result? results;

  NewYork({this.results});

  NewYork.fromJson(Map<String, dynamic> json) {
    results = json['results'];
  }
}

class Result {
  String? source;
  String? publishedDate;
  String? byline;
  String? title;
  String? abstract;

  Result({
    this.source,
    this.publishedDate,
    this.byline,
    this.title,
    this.abstract,
  });

  Result.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    publishedDate = json['publishedDate'];
    byline = json['byline'];
    title = json['title'];
    abstract = json['abstract'];
  }
}

class Media {
  List<MediaMetadata>? mediaMetadata;

  Media({this.mediaMetadata});

  Media.fromJson(Map<String, dynamic> json) {
    mediaMetadata = json['media-metadata'];
  }
}

class MediaMetadata {
  String? url;

  MediaMetadata({this.url});

  MediaMetadata.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}
