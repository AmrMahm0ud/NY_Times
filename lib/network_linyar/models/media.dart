import 'package:json_annotation/json_annotation.dart';

import 'media-metadata.dart';
part 'media.g.dart';
@JsonSerializable()
class Media {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "subtype")
  String? subtype;
  @JsonKey(name: "caption")
  String? caption;
  @JsonKey(name: "copyright")
  String? copyright;
  @JsonKey(name: "approved_for_syndication")
  int? approvedForSyndication;
  @JsonKey(name: "media-metadata")
  List<MediaMetadata>? mediaMetadata;

  Media({
      this.type, 
      this.subtype, 
      this.caption, 
      this.copyright, 
      this.approvedForSyndication, 
      this.mediaMetadata});

  factory Media.fromJson(Map<String, dynamic> json) =>
      _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}