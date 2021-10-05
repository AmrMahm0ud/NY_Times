import 'package:json_annotation/json_annotation.dart';
part 'media-metadata.g.dart';
@JsonSerializable()
class MediaMetadata {
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "format")
  String? format;
  @JsonKey(name: "height")
  int? height;
  @JsonKey(name: "width")
  int? width;

  MediaMetadata({
      this.url, 
      this.format, 
      this.height, 
      this.width});
  factory MediaMetadata.fromJson(Map<String, dynamic> json) =>
      _$MediaMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$MediaMetadataToJson(this);


}