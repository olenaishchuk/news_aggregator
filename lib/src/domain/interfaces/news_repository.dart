import 'package:news_aggregator/src/domain/entities/news_article.dart';

/// Абстракція сховища новин. Реалізується в Infrastructure-шарі,
/// Application-шар працює лише з цим інтерфейсом.
abstract interface class NewsRepository {
  Future<List<NewsArticle>> getAll();
  Future<NewsArticle?> getById(String id);
  Future<void> save(NewsArticle article);
}
