import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newyork_times/bloc/newyork/article_repo.dart';
import 'package:newyork_times/constant.dart';

import 'package:newyork_times/bloc/newyork/newyork_bloc.dart';
import 'package:newyork_times/models/newyork/new_york.dart';

class DetailsScreen extends StatefulWidget {
  final ArticleModel? articleModel;

  const DetailsScreen([Key? key, this.articleModel]) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  NewyorkBloc newyorkBloc = NewyorkBloc(baseArticleRepository: ArticleRepository());

  @override
  void initState() {
    newyorkBloc.add(FetchData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text(appBarText),
        centerTitle: true,
      ),
      body: BlocBuilder<NewyorkBloc, NewyorkState>(
        builder: (context, state) {
          if (state is NewyorkSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.articleModel!.articleTitle!),
                    sizedBox(10),
                    Text(widget.articleModel!.abstractArticle!),
                    sizedBox(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.articleModel!.authorName!),
                        Text(widget.articleModel!.articlePublishedDate!)
                      ],
                    ),
                    sizedBox(30),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                          widget.articleModel!.articlePhoto.toString()),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Source:"),
                        Text(widget.articleModel!.articleSource.toString())
                      ],
                    ),
                    sizedBox(10),
                    const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                  ],
                ),
              ),
            );
          }
          return loader();
        },
      ),
    );
  }

  loader() => const Center(
        child: CircularProgressIndicator(),
      );

  sizedBox([double? height, width]) => SizedBox(
        height: height,
        width: width,
      );
}
