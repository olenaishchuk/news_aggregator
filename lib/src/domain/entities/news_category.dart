/// Категорії новин (бізнес-правило: допустимі лише ці значення)
enum NewsCategory {
  sport('Спорт'),
  tech('Технології'),
  politics('Політика');

  final String label;
  const NewsCategory(this.label);
}
