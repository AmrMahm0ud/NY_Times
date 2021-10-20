import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newyork_times/home_page.dart';
import 'package:newyork_times/bloc/newyork/newyork_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<NewyorkBloc>(
        create: (context) => NewyorkBloc(),
      )
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  ));
}

