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
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Bloc Get APIs',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          state as PostsInitial;
          switch (state.postsStatus) {
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case PostStatus.success:
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Enter ID',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        context.read<PostsBloc>().add(SearchFilter(search: value));
                      },
                    ),
                  ),
                  Expanded(
                    child:  state.searchMessage.isNotEmpty ? Center(child: Text(state.searchMessage),) : ListView.builder(
                      itemCount: state.filterList.isEmpty
                          ? state.postList.length
                          : state.filterList.length,
                      itemBuilder: (_, index) {
                        final post = state.filterList.isNotEmpty
                            ? state.filterList[index]
                            : state.postList[index];
                        final id = post.id.toString();
                        final title = post.title ?? '';
                        final body = post.body ?? '';
                        return ListTile(
                          leading: CircleAvatar(child: Text(id)),
                          title: Text(title),
                          subtitle: Text(
                            body,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            case PostStatus.failure:
              return Text(state.message.toString());
          }
        },
      ),
    );
  }
}
