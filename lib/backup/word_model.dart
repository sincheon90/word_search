class Word {
  final int id;
  final String word;
  final String meaning;
  final String? category;
  final bool? isFavorite;

  Word({required this.id,
    required this.word,
    required this.meaning,
    this.category,
    this.isFavorite});

  Word.fromJson({
    required Map<String, dynamic> json,
  })  : id = json['id'],
        word = json['word'],
        meaning = json['meaning'],
        category = json['category'],
        isFavorite = json['isFavorite'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'word': word,
      'meaning': meaning,
      'category': category,
      'isFavorite': isFavorite,
    };
  }

  Word copyWith({
    int? id,
    String? word,
    String? meaning,
    String? category,
    bool? isFavorite,
  }) {
    return Word(
      id: id ?? this.id,
      word: word ?? this.word,
      meaning: meaning ?? this.meaning,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

}