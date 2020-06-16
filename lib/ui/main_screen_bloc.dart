import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

//---------------------------States-----------------------------//
abstract class MainScreenStates {
  const MainScreenStates();
}

class NextScreenState extends MainScreenStates {}

class ExitAppState extends MainScreenStates {}

class ShowScreenState extends MainScreenStates {}
//----------------------------------------------------------------//

//------------------------------Events----------------------------//
abstract class MainScreenEvents {
  const MainScreenEvents();
}

class NavigateToNextScreenEvent extends MainScreenEvents {}

class ExitFromAppEvent extends MainScreenEvents {}

class VisibilityScreenEvent extends MainScreenEvents {}
//----------------------------------------------------------------//

//------------------------------Bloc----------------------------//
class MainScreenBloc extends Bloc<MainScreenEvents, MainScreenStates> {
  MainScreenBloc() {
    getValue().then((value) {
      print(value);
      if (value) {
        add(NavigateToNextScreenEvent());
      }
    });
  }
  @override
  MainScreenStates get initialState => ShowScreenState();

  @override
  Stream<MainScreenStates> mapEventToState(MainScreenEvents event) async* {
    if (event is NavigateToNextScreenEvent) {
      _setVisibilityScreen(true);
      yield NextScreenState();
    } else if (event is ExitFromAppEvent) {
      yield ExitAppState();
    }
  }

  Future<bool> getValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("isShow") ?? false;
  }

  _setVisibilityScreen(bool visibility) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isShow', true);
  }
}
