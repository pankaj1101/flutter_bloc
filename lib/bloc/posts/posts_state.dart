part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsInitial extends PostsState {
  final PostStatus postsStatus;
  final List<PostModel> postList;
  final String message;

  const PostsInitial({
    required this.postsStatus,
    required this.postList,
    this.message='',
  });
  PostsInitial copyWith({
    final PostStatus? postsStatus,
    final List<PostModel>? postList,
    final String? message,
  }) {
    return PostsInitial(
      postsStatus: postsStatus ?? this.postsStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [postsStatus,postList,message];
}
