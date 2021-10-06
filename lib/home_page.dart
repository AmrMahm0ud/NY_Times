import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newyork_times/listView.dart';
import 'package:newyork_times/network_linyar/newyork_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewyorkBloc newyorkBloc = NewyorkBloc();
  int? _index;

  @override
  void initState() {
    newyorkBloc.add(FetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green[400],
              title: Text(("NY Times Most Popular")),
              centerTitle: true,
              actions: [Icon(Icons.search), Icon(Icons.priority_high_rounded)],
            ),
            drawer: Drawer(),
            body: ListViewBuilder(
              index: _index,
              itemCount: 10,
              widget: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.green),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Title"),
                              SizedBox(
                                height: 15,
                              ),
                              Text("By Line")
                            ],
                          )
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_outlined),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Published Date"),
                    ],
                  )
                ],
              ),
              id: 0,
            )));
  }
}
