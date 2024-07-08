part of 'favourite_app_bloc.dart';

sealed class FavouriteAppEvent extends Equatable {
  const FavouriteAppEvent();

  @override
  List<Object> get props => [];
}

class SetPersonListEvent extends FavouriteAppEvent {
  final List<Person> personList;

  const SetPersonListEvent({
    required this.personList,
  });

  @override
  List<Object> get props => [personList];
}
