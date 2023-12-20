class Star {
  String title;
  String subTitle;
  String imageUrl;
  String description;
  bool isFavorite;

//<editor-fold desc="Data Methods">
  Star({
    required this.title,
    required this.subTitle,
    required this.imageUrl,
    required this.description,
    required this.isFavorite,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Star &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          subTitle == other.subTitle &&
          imageUrl == other.imageUrl &&
          description == other.description &&
          isFavorite == other.isFavorite);

  @override
  int get hashCode =>
      title.hashCode ^
      subTitle.hashCode ^
      imageUrl.hashCode ^
      description.hashCode ^
      isFavorite.hashCode;

  @override
  String toString() {
    return 'Star{ title: $title, subTitle: $subTitle, imageUrl: $imageUrl, description: $description, isFavorite: $isFavorite,'
        '}';
  }

  Star copyWith({
    String? title,
    String? subTitle,
    String? imageUrl,
    String? description,
    bool? isFavorite,
  }) {
    return Star(
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      imageUrl: imageUrl ?? this.imageUrl,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': this.title,
      'subTitle': this.subTitle,
      'imageUrl': this.imageUrl,
      'description': this.description,
      'isFavorite': this.isFavorite,
    };
  }

  factory Star.fromMap(Map<String, dynamic> map) {
    return Star(
      title: map['title'] as String,
      subTitle: map['subTitle'] as String,
      imageUrl: map['imageUrl'] as String,
      description: map['description'] as String,
      isFavorite: map['isFavorite'] as bool,
    );
  }

//</editor-fold>
}
