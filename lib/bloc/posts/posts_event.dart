part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class PostsFetch extends PostsEvent {}

class SearchFilter extends PostsEvent {
  final String search;

  const SearchFilter({required this.search});
   @override
  List<Object> get props => [search];
}
