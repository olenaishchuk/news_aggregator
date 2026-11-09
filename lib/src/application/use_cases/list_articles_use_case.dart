import 'package:news_aggregator/src/domain/entities/news_article.dart';
import 'package:news_aggregator/src/domain/entities/news_category.dart';
import 'package:news_aggregator/src/domain/interfaces/news_repository.dart';

/// Повертає новини, відфільтровані за категорією та/або закладками,
/// від найновіших до найстаріших.
class ListArticlesUseCase {
  final NewsRepository _repository;

  ListArticlesUseCase(this._repository);

  Future<List<NewsArticle>> call({
    NewsCategory? category,
    bool onlyBookmarked = false,
  }) async {
    final all = await _repository.getAll();
    final result = all
        .where((a) =>
            (category == null || a.category == category) &&
            (!onlyBookmarked || a.isBookmarked))
        .toList();
    result.sort((a, b) => b.publishedAt.compareTo(a.publishedAt));
    return result;
  }
}
