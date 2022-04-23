class Quote {
  late String quote;
  late String author;
  late bool isLiked;

  void toggleIsLiked() {
    isLiked = !isLiked;
  }

  Quote({required this.quote, required this.author, required this.isLiked});
}