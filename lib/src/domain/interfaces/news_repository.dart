import 'package:news_aggregator/src/domain/entities/news_article.dart';

abstract interface class NewsRepository {
  Future<List<NewsArticle>> getAll();
  Future<NewsArticle?> getById(String id);
  Future<void> save(NewsArticle article);
}
