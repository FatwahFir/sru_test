import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sru_test/core/config/env_config.dart';
import 'package:sru_test/core/errors/exceptions.dart';
import 'package:sru_test/core/services/injector_container.dart';
import 'package:sru_test/features/article/data/models/article_model.dart';

abstract class ArticleDatasource {
  Future<List<ArticleModel>> getArticles();
  Future<List<ArticleModel>> searchArticle(String params);
}

class ArticleDatasourceImpl extends ArticleDatasource {
  final http.Client client;

  ArticleDatasourceImpl({
    required this.client,
  });

  @override
  Future<List<ArticleModel>> getArticles() async {
    try {
      final response = await client.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=${sl<EnvConfig>().apiKey}'));

      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        return (data['articles'] as List)
            .map((e) => ArticleModel.fromJson(e))
            .toList();
      } else {
        throw ServerException(
            message: data['message'], statusCode: response.statusCode);
      }
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: '505');
    }
  }

  @override
  Future<List<ArticleModel>> searchArticle(String params) async {
    try {
      final response = await client.get(Uri.parse(
          'https://newsapi.org/v2/everything?q=$params&apiKey=${sl<EnvConfig>().apiKey}'));

      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        return (data['articles'] as List)
            .map((e) => ArticleModel.fromJson(e))
            .toList();
      } else {
        throw ServerException(
            message: data['message'], statusCode: response.statusCode);
      }
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: '505');
    }
  }
}
