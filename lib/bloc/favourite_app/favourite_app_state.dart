part of 'favourite_app_bloc.dart';

sealed class FavouriteAppState extends Equatable {
  const FavouriteAppState();

  @override
  List<Object> get props => [];
}

final class FavouriteAppInitial extends FavouriteAppState {
  final List<Person> personList;
  final List<Person> favPersonList;

  const FavouriteAppInitial({
    required this.personList,
    required this.favPersonList,
  });

  FavouriteAppInitial copyWith({
    final List<Person>? personList,
    final List<Person>? favPersonList,
  }) {
    return FavouriteAppInitial(
      personList: personList ?? this.personList,
      favPersonList: favPersonList ?? this.favPersonList,
    );
  }

  @override
  List<Object> get props => [personList, favPersonList];
}
