import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/bloc/posts/posts_bloc.dart';
import 'package:sample/utils/enums.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(PostsFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Get API Call',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green.shade200,
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          state as PostsInitial;
          switch (state.postsStatus) {
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PostStatus.success:
              return ListView.builder(
                itemBuilder: (_, index) {
                  final id = state.postList[index].id.toString();
                  final title = state.postList[index].title ?? '';
                  final body = state.postList[index].body ?? '';

                  return ListTile(
                    leading: CircleAvatar(child: Text(id)),
                    title: Text(title),
                    subtitle: Text(
                      body,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                },
              );
            case PostStatus.failure:
              return Text(state.message.toString());
          }
        },
      ),
    );
  }
}
