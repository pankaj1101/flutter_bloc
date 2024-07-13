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
  List<PostModel> filterList = [];

  PostsBloc()
      : super(
          const PostsInitial(
            postsStatus: PostStatus.loading,
            postList: <PostModel>[],
            filterList: <PostModel>[],
          ),
        ) {
    on<PostsFetch>(_fetchData);
    on<SearchFilter>(_searchFilter);
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

  FutureOr<void> _searchFilter(SearchFilter event, Emitter<PostsState> emit) {
    final currentState = state as PostsInitial;

    if (event.search.isEmpty) {
      emit(currentState.copyWith(filterList: [], searchMessage: ''));
    } else {
      filterList = currentState.postList
          .where((element) => element.title.toString().contains(event.search.toString()))
          .toList();
      if (filterList.isEmpty) {
        emit(currentState.copyWith(
            filterList: filterList, searchMessage: 'No Data Found'));
      } else {
        emit(currentState.copyWith(filterList: filterList, searchMessage: ''));
      }
    }
  }
}
