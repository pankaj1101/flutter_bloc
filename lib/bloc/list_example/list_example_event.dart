part of 'list_example_bloc.dart';

abstract class ListExampleEvent extends Equatable {
  const ListExampleEvent();

  @override
  List<Object> get props => [];
}

class DisplayListEvent extends ListExampleEvent {}

class RemoveListEvent extends ListExampleEvent {
  final int index;

  const RemoveListEvent({required this.index});

  @override
  List<Object> get props => [index];
}
