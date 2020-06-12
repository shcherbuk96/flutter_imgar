class TitleItem {
  static String table = 'title_items';

  String title;
  String image;
  int id;

  TitleItem({this.title, this.image, this.id});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {'title': title, 'image': image};

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  static TitleItem fromMap(Map<String, dynamic> map) {
    return TitleItem(id: map['id'], title: map['title'], image: map['image']);
  }
}
