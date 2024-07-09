import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample/model/post_model.dart';
import 'package:sample/repository/post_repository.dart';
import 'package:sample/utils/enums.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostRepository postRepository = PostRepository();
  PostsBloc()
      : super(
          const PostsInitial(
            postsStatus: PostStatus.loading,
            postList: <PostModel>[],
          ),
        ) {
    on<PostsFetch>(_fetchData);
  }

  Future<FutureOr<void>> _fetchData(
      PostsFetch event, Emitter<PostsState> emit) async {
    final currentState = state as PostsInitial;

    try {
      final posts = await postRepository.fetchPost();
      emit(currentState.copyWith(
        postList: posts,
        message: 'Success',
        postsStatus: PostStatus.success,
      ));
    } catch (error) {
      emit(currentState.copyWith(
        postList: [],
        message: error.toString(),
        postsStatus: PostStatus.failure,
      ));
    }
  }
}
