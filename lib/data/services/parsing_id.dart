String getParsedIdFilm(String id) {
  if (id.isNotEmpty) {
    var words = id.split('/');
    return words[2];
  }
  return id;
}
