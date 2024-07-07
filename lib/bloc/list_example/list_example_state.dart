part of 'list_example_bloc.dart';

sealed class ListExampleState extends Equatable {
  const ListExampleState();

  @override
  List<Object> get props => [];
}

final class ListExampleInitial extends ListExampleState {
  final List<Person> personList;
  const ListExampleInitial({required this.personList});

  ListExampleInitial copyWith({
    List<Person>? personList,
  }) {
    return ListExampleInitial(personList: personList ?? this.personList);
  }

  @override
  List<Object> get props => [personList];
}
