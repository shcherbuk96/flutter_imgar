import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:imgar/data/models/about_film_model.dart';

//---------------------------States-----------------------------//
abstract class FilmScreenState {
  const FilmScreenState();
}

class FilmIsLoadingState extends FilmScreenState {}

class FilmIsLoadedState extends FilmScreenState {}

class FilmIsSavingState extends FilmScreenState {}

class FilmIsSavedState extends FilmScreenState {}
//----------------------------------------------------------------//

//------------------------------Events----------------------------//
abstract class FilmScreenEvent {
  const FilmScreenEvent();
}

class SaveFilmImageEvent extends FilmScreenEvent {
  String urlImage;

  SaveFilmImageEvent(this.urlImage);
}

class FilmLoadedEvent extends FilmScreenEvent {}
//----------------------------------------------------------------//

//------------------------------Bloc----------------------------//
class FilmScreenBloc extends Bloc<FilmScreenEvent, FilmScreenState> {
  final AboutFilm film;
  FilmScreenBloc(this.film) {
    Future.delayed(Duration(milliseconds: 1000))
        .then((value) => add(FilmLoadedEvent()));
  }

  @override
  FilmScreenState get initialState => FilmIsLoadingState();

  @override
  Stream<FilmScreenState> mapEventToState(FilmScreenEvent event) async* {
    if (event is SaveFilmImageEvent) {
      yield FilmIsSavingState();
      var response = await http.get(event.urlImage);
      await ImagePickerSaver.saveFile(fileData: response.bodyBytes);
      yield FilmIsSavedState();
    } else if (event is FilmLoadedEvent) {
      yield FilmIsLoadedState();
    }
  }
}
