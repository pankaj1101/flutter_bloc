import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample/model/person.dart';
import 'package:sample/utils/person_data_list.dart';

part 'favourite_app_event.dart';
part 'favourite_app_state.dart';

class FavouriteAppBloc extends Bloc<FavouriteAppEvent, FavouriteAppState> {
  FavouriteAppBloc()
      : super(const FavouriteAppInitial(personList: [], favPersonList: [])) {
    on<SetPersonListEvent>(_setPersonList);
    final List<dynamic> jsonList = json.decode(personDetailsList);
    final List<Person> personList =
        jsonList.map((json) => Person.fromJson(json)).toList();

    add(SetPersonListEvent(personList: personList));
  }

  FutureOr<void> _setPersonList(
      SetPersonListEvent event, Emitter<FavouriteAppState> emit) {
    final currentState = state as FavouriteAppInitial;
    emit(currentState.copyWith(personList: event.personList));
  }
}
