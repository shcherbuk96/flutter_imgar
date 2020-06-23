class AboutFilm {
  final String id;
  final String titleType;
  final bool isTitleType;
  final String title;
  final bool isTitle;
  final String imageUrl;
  final bool isImageUrl;
  final String description;
  final bool isDescription;
  final String length;
  final bool isLength;
  final String yearr;
  final bool isYearr;
  final String rate;
  final bool isRate;
  final String episodes;
  final bool isEpisodes;
  final String startSeason;
  final bool isStartSeason;
  final String endSeason;
  final bool isEndSeason;
  final String trailerUrl;
  final bool isTrailer;

  AboutFilm(
    this.id,
    this.titleType,
    this.isTitleType,
    this.title,
    this.isTitle,
    this.imageUrl,
    this.isImageUrl,
    this.description,
    this.isDescription,
    this.length,
    this.isLength,
    this.yearr,
    this.isYearr,
    this.rate,
    this.isRate,
    this.episodes,
    this.isEpisodes,
    this.startSeason,
    this.isStartSeason,
    this.endSeason,
    this.isEndSeason,
    this.trailerUrl,
    this.isTrailer,
  );

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'titleType': titleType,
      'isTitleType': isTitleType ? 1 : 0,
      'title': title,
      'isTitle': isTitle ? 1 : 0,
      'imageUrl': imageUrl.toString(),
      'isImageUrl': isImageUrl ? 1 : 0,
      'description': description,
      'isDescription': isDescription ? 1 : 0,
      'length': length.toString(),
      'isLength': isLength ? 1 : 0,
      'yearr': yearr.toString(),
      'isYearr': isYearr ? 1 : 0,
      'rate': rate.toString(),
      'isRate': isRate ? 1 : 0,
      'episodes': episodes.toString(),
      'isEpisodes': isEpisodes ? 1 : 0,
      'startSeason': startSeason.toString(),
      'isStartSeason': isStartSeason ? 1 : 0,
      'endSeason': endSeason.toString(),
      'isEndSeason': isEndSeason ? 1 : 0,
      'trailerUrl': trailerUrl.toString(),
      'isTrailer': isTrailer ? 1 : 0,
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
        map['isTitleType'] == 1 ? true : false,
        map['title'],
        map['isTitle'] == 1 ? true : false,
        map['imageUrl'].toString(),
        map['isImageUrl'] == 1 ? true : false,
        map['description'],
        map['isDescription'] == 1 ? true : false,
        map['length'].toString(),
        map['isLength'] == 1 ? true : false,
        map['yearr'].toString(),
        map['isYearr'] == 1 ? true : false,
        map['rate'].toString(),
        map['isRate'] == 1 ? true : false,
        map['episodes'].toString(),
        map['isEpisodes'] == 1 ? true : false,
        map['startSeason'].toString(),
        map['isStartSeason'] == 1 ? true : false,
        map['endSeason'].toString(),
        map['isEndSeason'] == 1 ? true : false,
        map['trailerUrl'].toString(),
        map['isTrailer'] == 1 ? true : false);
  }
}
