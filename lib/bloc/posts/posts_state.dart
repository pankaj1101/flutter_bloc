part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {
  final PostStatus postsStatus;
  final List<PostModel> postList;
  final List<PostModel> filterList;
  final String message;
  final String searchMessage;

  const PostsInitial({
    required this.postsStatus,
    required this.postList,
    required this.filterList,
    this.message = '',
    this.searchMessage = '',
  });
  PostsInitial copyWith({
    final PostStatus? postsStatus,
    final List<PostModel>? postList,
    final List<PostModel>? filterList,
    final String? message,
    searchMessage,
  }) {
    return PostsInitial(
      postsStatus: postsStatus ?? this.postsStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
      filterList: filterList ?? this.filterList,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object> get props => [postsStatus, postList, message, filterList,searchMessage];
}
