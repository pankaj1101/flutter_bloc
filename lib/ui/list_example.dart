import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/bloc/list_example/list_example_bloc.dart';

class ListExample extends StatelessWidget {
  const ListExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Person List')),
      body: BlocBuilder<ListExampleBloc, ListExampleState>(
        builder: (context, state) {
          state as ListExampleInitial;
          if (state.personList.isEmpty) {
            return const Center(
              child: Text('Empty List'),
            );
          } else if (state.personList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.personList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.lightGreen.shade100,
                    title: Text(state.personList[index].name),
                    subtitle: Text(state.personList[index].email),
                    trailing: IconButton(
                      onPressed: () {
                        // Remove
                        context
                            .read<ListExampleBloc>()
                            .add(RemoveListEvent(index: index));
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ListExampleBloc>().add(DisplayListEvent());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
