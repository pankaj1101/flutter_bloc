import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample/model/person.dart';
import 'package:sample/utils/person_data_list.dart';

part 'list_example_event.dart';
part 'list_example_state.dart';

class ListExampleBloc extends Bloc<ListExampleEvent, ListExampleState> {
  ListExampleBloc() : super(const ListExampleInitial(personList: [])) {
    on<DisplayListEvent>(_displayList);
    on<RemoveListEvent>(_removeList);
  }

  FutureOr<void> _displayList(
      DisplayListEvent event, Emitter<ListExampleState> emit) {
    final currentState = state as ListExampleInitial;

    List<dynamic> jsonList = json.decode(personDetailsList);
    List<Person> person =
        jsonList.map((json) => Person.fromJson(json)).toList();
    emit(currentState.copyWith(personList: person));
  }

  FutureOr<void> _removeList(
      RemoveListEvent event, Emitter<ListExampleState> emit) {
    final currentState = state as ListExampleInitial;
    List<Person> updatedList = List.from(currentState.personList);

    if (updatedList.isNotEmpty) {
      updatedList.removeAt(event.index);
    }
    emit(currentState.copyWith(personList: updatedList));
  }
}
