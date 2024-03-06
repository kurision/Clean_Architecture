import 'dart:developer';

import 'package:bloc_news/feature/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:bloc_news/feature/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:bloc_news/feature/daily_news/presentation/widgets/article_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News'),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(
          child: CupertinoActivityIndicator(),
        );
      }
      if (state is RemoteArticlesError) {
        return const Center(
          child: Icon(Icons.refresh),
        );
      }
      if (state is RemoteArticlesDone) {
        log(state.articles!.length.toString());
        return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: state.articles![index],
              );
            });
      }
      return const SizedBox();
    });
  }
}
