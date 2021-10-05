import 'package:json_annotation/json_annotation.dart';
import 'package:newyork_times/Network_Linyar/models/results.dart';
part 'new_york.g.dart';
@JsonSerializable()
class NewYork {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "copyright")
  String? copyright;
  @JsonKey(name: "numResults")
  int? numResults;
  @JsonKey(name: "results")
  NewYorkResult? results;

  NewYork({
      this.status, 
      this.copyright, 
      this.numResults, 
      this.results});
  factory NewYork.fromJson(Map<String, dynamic> json) =>
      _$NewYorkFromJson(json);
  Map<String, dynamic> toJson() => _$NewYorkToJson(this);


}