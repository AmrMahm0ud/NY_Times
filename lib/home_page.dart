import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newyork_times/constant.dart';
import 'package:newyork_times/details_screen.dart';
import 'package:newyork_times/bloc/newyork/newyork_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewyorkBloc newyorkBloc = NewyorkBloc();

  Key? get key => null;

  @override
  void initState() {
    BlocProvider.of<NewyorkBloc>(context).add(FetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: BlocListener<NewyorkBloc, NewyorkState>(
          listener: (context, state) {
            if (state is NewyorkError) {
              snackBarError(state.error);
            }
            if (state is NewyorkNetWorkError) {
              snackBarError(state.networkError);
            }
          },
          child: BlocBuilder<NewyorkBloc, NewyorkState>(
            builder: (context, state) {
              if (state is NewyorkSuccess) {
                return buildWidget(state);
              }
              return loader();
            },
          ),
        ));
  }

  buildWidget(state) => ListView.builder(
      itemCount: state.newyork!.length,
      itemBuilder: (BuildContext context, index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              ListTile(
                title: Text(state.newyork![index].articleTitle.toString()),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
                subtitle: Text(state.newyork![index].authorName),
                leading: Container(
                  width: MediaQuery.of(context).size.width / 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            state.newyork![index].articlePhoto),
                        fit: BoxFit.cover),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              DetailsScreen(key, state.newyork![index])));
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(state.newyork![index].articlePublishedDate),
                  ],
                ),
              )
            ],
          ),
        );
      });

  loader() => const Center(
        child: CircularProgressIndicator(),
      );

  void snackBarError(error) {
    final snackBar = SnackBar(content: Text(error));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
