import 'package:news_aggregator/src/domain/entities/news_category.dart';

/// Сутність "Новина". Містить бізнес-правило: заголовок не може бути порожнім.
class NewsArticle {
  final String id;
  final String title;
  final NewsCategory category;
  final String source;
  final DateTime publishedAt;
  final bool isBookmarked;

  NewsArticle({
    required this.id,
    required this.title,
    required this.category,
    required this.source,
    required this.publishedAt,
    this.isBookmarked = false,
  }) {
    if (title.trim().isEmpty) {
      throw ArgumentError('Заголовок новини не може бути порожнім');
    }
  }

  /// Повертає копію новини зі зміненим станом закладки
  NewsArticle copyWith({bool? isBookmarked}) {
    return NewsArticle(
      id: id,
      title: title,
      category: category,
      source: source,
      publishedAt: publishedAt,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}
