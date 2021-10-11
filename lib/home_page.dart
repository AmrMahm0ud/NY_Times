import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newyork_times/constant.dart';
import 'package:newyork_times/details_screen.dart';
import 'package:newyork_times/network_linyar/newyork_bloc.dart';

import 'network_linyar/newyork_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewyorkBloc newyorkBloc = NewyorkBloc();

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
              backgroundColor: appBarColor,
              title: const Text((appBarText)),
              centerTitle: true,
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.search,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.more_vert,
                      size: 30,
                    )
                  ],
                ),
              ],
            ),
            drawer: const Drawer(),
            body: BlocProvider(
              create: (context) => newyorkBloc,
              child: BlocBuilder<NewyorkBloc, NewyorkState>(
                builder: (context, state) {
                  if (state is NewyorkSuccess) {
                    return ListView.builder(
                        itemCount: state.newyork!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(state.newyork![index].articleTitle
                                      .toString()),
                                  trailing:
                                      const Icon(Icons.arrow_forward_ios_outlined),
                                  subtitle: Text(state
                                      .newyork![index].authorName
                                      .toString()),
                                  leading: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(state
                                              .newyork![index].articlePhoto
                                              .toString()),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  // leading: Image.network(
                                  //   state.newyork![index].articlePhoto
                                  //       .toString(),
                                  //   fit: BoxFit.scaleDown,
                                  //   height: 50,
                                  // ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => DetailsScreen(state.newyork![index])));
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 100),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(state
                                          .newyork![index].articlePublishedDate
                                          .toString()),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            )));
  }
}
