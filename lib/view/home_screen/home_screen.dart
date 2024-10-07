import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/home_screen/widgets/movie_card.dart';

import '../../cubit/movie_cubit/movie_cubit.dart';
import 'widgets/company_info.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void showCompanyInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: ContentBox(context),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showCompanyInfoDialog(context);
            },
          ),
        ],
      ),
      body: BlocConsumer<MoviesCubit, MoviesState>(
        listener: (context, state) {
          if (state is MoviesError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is MoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MoviesLoaded) {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  movie: state.movies[index],
                );
              },
            );
          } else {
            return const Center(child: Text('No movies available'));
          }
        },
      ),
    );
  }
}
