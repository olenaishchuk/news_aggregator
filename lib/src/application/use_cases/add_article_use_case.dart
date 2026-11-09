import 'dart:math';

import 'package:news_aggregator/src/domain/entities/news_article.dart';
import 'package:news_aggregator/src/domain/entities/news_category.dart';
import 'package:news_aggregator/src/domain/interfaces/news_repository.dart';

/// Сценарій: додати нову новину.
/// Залежить лише від інтерфейсу NewsRepository (принцип DIP).
class AddArticleUseCase {
  final NewsRepository _repository;

  AddArticleUseCase(this._repository);

  Future<NewsArticle> call({
    required String title,
    required NewsCategory category,
    required String source,
  }) async {
    final now = DateTime.now();
    final article = NewsArticle(
      id: '${now.microsecondsSinceEpoch}${Random().nextInt(9999)}',
      title: title.trim(),
      category: category,
      source: source.trim(),
      publishedAt: now,
    );
    await _repository.save(article);
    return article;
  }
}
