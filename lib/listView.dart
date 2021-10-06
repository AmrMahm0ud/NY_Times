import 'package:flutter/material.dart';
import 'package:newyork_times/details_screen.dart';

class ListViewBuilder extends StatelessWidget {
  ListViewBuilder({this.itemCount, this.index, this.widget, this.id});
  int? itemCount, index;
  Widget? widget;
  int?id;

  // void SetItemCount(int itemCount){
  //   this._itemCount=itemCount;
  // }
  // void SetWidget(Widget _widget){
  //   this._widget=_widget;
  // }
  // void SetIndex(int _index){
  //   this._index=_index;
  // }
  // void SetID(int _id){
  //   this._id=_id;
  // }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int _index) {
          this.index = _index;
          return InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsScreen(id)));
          },child: widget!);
        },
        itemCount: itemCount,
      ),
    );
  }
}

