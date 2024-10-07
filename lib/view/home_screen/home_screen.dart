import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/auh_cubit/auth_cubit.dart';
import 'package:movie_app/utils/config/colors.dart';
import 'package:movie_app/view/home_screen/widgets/movie_card.dart';
import 'package:movie_app/view/home_screen/widgets/movie_card_shimmer.dart';
import 'package:movie_app/view/login/login_screen.dart';

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

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.read<AuthCubit>().logoutUser();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text.rich(
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          TextSpan(text: 'Movie', children: <InlineSpan>[
            TextSpan(
              text: 'App',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
            )
          ]),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showCompanyInfoDialog(context);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            onPressed: () {
              showLogoutDialog(context);
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
            return const Center(child: MovieCardShimmer());
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
