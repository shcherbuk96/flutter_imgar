class AboutFilm {
  final String id;
  final String titleType;
  final String title;
  final String imageUrl;
  final String description;
  final String length;
  final String yearr;
  final String rate;
  final String episodes;
  final String startSeason;
  final String endSeason;

  AboutFilm(
      this.id,
      this.titleType,
      this.title,
      this.imageUrl,
      this.description,
      this.length,
      this.yearr,
      this.rate,
      this.episodes,
      this.startSeason,
      this.endSeason);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'titleType': titleType,
      'title': title,
      'imageUrl': imageUrl,
      'description': description,
      'length': length,
      'yearr': yearr,
      'rate': rate,
      'episodes': episodes,
      'startSeason': startSeason,
      'endSeason': endSeason,
    };

    // if (id != null) {
    //   map['id'] = id;
    // }
    return map;
  }

  static AboutFilm fromMap(Map<String, dynamic> map) {
    return AboutFilm(
        map['id'],
        map['titleType'],
        map['title'],
        map['imageUrl'],
        map['description'],
        map['length'],
        map['yearr'],
        map['rate'],
        map['episodes'],
        map['startSeason'],
        map['endSeason']);
  }
}
