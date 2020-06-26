import 'package:flutter_bloc/flutter_bloc.dart';

abstract class NavigationPageState {
  const NavigationPageState();
}

class CurrentIndexChangedState extends NavigationPageState {
  final int currentIndex;

  CurrentIndexChangedState(this.currentIndex);
}

class PageLoadingState extends NavigationPageState {}

class ListScreenLoadedState extends NavigationPageState {}

class AboutScreenLoadedState extends NavigationPageState {}

//-------------------------------------------------------------------//

//--------------------------Events----------------------------------//
abstract class NavigationPageEvent {
  const NavigationPageEvent();
}

class AppStartedEvent extends NavigationPageEvent {}

class PageTappedEvent extends NavigationPageEvent {
  final int index;

  PageTappedEvent(this.index);
}

//-------------------------------------------------------------------//

//#Bloc
class NavigationPageBloc
    extends Bloc<NavigationPageEvent, NavigationPageState> {
  int currentIndex = 0;

  NavigationPageBloc();
  @override
  NavigationPageState get initialState => PageLoadingState();

  @override
  Stream<NavigationPageState> mapEventToState(
      NavigationPageEvent event) async* {
    if (event is AppStartedEvent) {
      add(PageTappedEvent(this.currentIndex));
    }
    if (event is PageTappedEvent) {
      this.currentIndex = event.index;
      yield CurrentIndexChangedState(this.currentIndex);
      yield PageLoadingState();

      if (this.currentIndex == 0) {
        yield ListScreenLoadedState();
      }
      if (this.currentIndex == 1) {
        yield AboutScreenLoadedState();
      }
    }
  }
}
