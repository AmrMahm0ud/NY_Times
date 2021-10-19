import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newyork_times/home_page.dart';
import 'package:newyork_times/network_linyar/newyork_bloc.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewyorkBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NY Most Popular Articles',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}