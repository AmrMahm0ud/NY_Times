import 'package:json_annotation/json_annotation.dart';

import 'media.dart';
part 'results.g.dart';
@JsonSerializable()
class NewYorkResult{
  @JsonKey(name: "uri")
  String? uri;
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "asset_id")
  int? assetId;
  @JsonKey(name: "source")
  String? source;
  @JsonKey(name: "publishedDate")
  String? publishedDate;
  @JsonKey(name: "updated")
  String? updated;
  @JsonKey(name: "section")
  String? section;
  @JsonKey(name: "subsection")
  String? subsection;
  @JsonKey(name: "nytdsection")
  String? nytdsection;
  @JsonKey(name: "adx_keywords")
  String? adxKeywords;
  @JsonKey(name: "column")
  dynamic column;
  @JsonKey(name: "byline")
  String? byline;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "abstract")
  String? abstract;
  @JsonKey(name: "des_facet")
  List<String>? desFacet;
  @JsonKey(name: "org_facet")
  List<dynamic>? orgFacet;
  @JsonKey(name: "per_facet")
  List<String>? perFacet;
  @JsonKey(name: "geo_facet")
  List<String>? geoFacet;
  @JsonKey(name: "media")
  List<Media>? media;
  @JsonKey(name: "etaId")
  int? etaId;

  NewYorkResult({
      this.uri, 
      this.url, 
      this.id, 
      this.assetId, 
      this.source, 
      this.publishedDate, 
      this.updated, 
      this.section, 
      this.subsection, 
      this.nytdsection, 
      this.adxKeywords, 
      this.column, 
      this.byline, 
      this.type, 
      this.title, 
      this.abstract, 
      this.desFacet, 
      this.orgFacet, 
      this.perFacet, 
      this.geoFacet, 
      this.media, 
      this.etaId});
  factory NewYorkResult.fromJson(Map<String, dynamic> json) =>
      _$NewYorkResultFromJson(json);
  Map<String, dynamic> toJson() => _$NewYorkResultToJson(this);

}