import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newyork_times/home_page.dart';
import 'package:newyork_times/network_linyar/newyork_bloc.dart';

void main() {
  runApp(
      MultiBlocProvider(
      providers: [
        BlocProvider<NewyorkBloc>(
          create: (BuildContext context) => NewyorkBloc(),)
      ],
  child: const MaterialApp(home: HomePage())));
}
