import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/bloc/favourite_app/favourite_app_bloc.dart';

class FavouriteAppScreen extends StatelessWidget {
  const FavouriteAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: BlocBuilder<FavouriteAppBloc, FavouriteAppState>(
        builder: (context, state) {
          state as FavouriteAppInitial;

          if (state.personList.isEmpty) {
            return const Center(
              child: Text('No Data'),
            );
          } else if (state.personList.isNotEmpty) {
            return ListView.builder(
                itemCount: state.personList.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text('index $index'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                    ),
                  );
                });
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
