import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgar/constants/routes_constants.dart';
import 'package:imgar/data/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

//---------------------------States-----------------------------//
abstract class MainScreenStates {
  const MainScreenStates();
}

class InitState extends MainScreenStates {}
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
  var navigationService = createNavigationService();
  MainScreenBloc() {
    // getValue().then((value) {
    //   print(value);
    //   if (value) {
    //     add(NavigateToNextScreenEvent());
    //   }
    // });
  }
  @override
  MainScreenStates get initialState => InitState();

  @override
  Stream<MainScreenStates> mapEventToState(MainScreenEvents event) async* {
    if (event is NavigateToNextScreenEvent) {
      _setVisibilityScreen(true);
      navigationService.navigateTo(listScreenRoute, null);
    } else if (event is ExitFromAppEvent) {
      navigationService.exitApp();
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
