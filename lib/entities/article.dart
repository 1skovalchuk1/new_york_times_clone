class Article {
  final int id;
  String img = '';
  final String headline;
  final String abstract;
  final String body;
  final String author;
  final String section;
  final String date;
  final String articleUri;
  final String timeToRead;

  Article({
    required this.id,
    required this.headline,
    required this.abstract,
    required this.body,
    required this.author,
    required this.section,
    required this.date,
    required this.articleUri,
    required this.timeToRead
  });

  // 100 words --> 25 second
  static String _timeToRead (String body) {
    final seconds = body.split(' ').length ~/ 4;
    final minutes = seconds ~/ 60;
    return '$minutes MIN READ';
  }

  static String _parseBody(String body) {
    return body.split('\n\n').map((s) => s.substring(3, s.length - 4)).join('\n\n');
  }

  Article updateArticleImgPath(String path) {
    img = path + id.toString();
    return this;
  }

  Article.empty()
    : id = -1,
    img = '',
    headline = '',
    abstract = '',
    body = '',
    author = '',
    section = '',
    date = '',
    articleUri = '',
    timeToRead = '';



  factory Article.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'headline': String headline,
        'abstract': String abstract,
        'body': String body,
        'author': String author,
        'section': String section,
        'date': String date,
        'article_uri': String articleUri,
        'pfd_uri': _
      } =>
        Article(
            id: id,
            headline: headline,
            abstract: abstract,
            body: _parseBody(body),
            author: author,
            section: section,
            date: date,
            articleUri: articleUri,
            timeToRead: _timeToRead(body)),
      _ => throw const FormatException('Failed to load article.'),
    };
  }
}
