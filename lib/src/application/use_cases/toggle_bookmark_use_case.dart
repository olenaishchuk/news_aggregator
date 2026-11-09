import 'package:news_aggregator/src/domain/entities/news_article.dart';
import 'package:news_aggregator/src/domain/interfaces/news_repository.dart';

class ToggleBookmarkUseCase {
  final NewsRepository _repository;

  ToggleBookmarkUseCase(this._repository);

  Future<NewsArticle> call(String id) async {
    final article = await _repository.getById(id);
    if (article == null) {
      throw StateError('Новину з id=$id не знайдено');
    }
    final updated = article.copyWith(isBookmarked: !article.isBookmarked);
    await _repository.save(updated);
    return updated;
  }
}
