import 'package:flutter/material.dart';
import 'package:movie_app/utils/config/colors.dart';
import 'package:shimmer/shimmer.dart';

class MovieCardShimmer extends StatelessWidget {
  const MovieCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          color: AppColors.white,
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 15,
                          height: 15,
                          color: AppColors.white,
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 30,
                          height: 30,
                          color: AppColors.white,
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 40,
                          height: 10,
                          color: AppColors.white,
                        ),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Container(
                      width: 70,
                      height: 100,
                      color: AppColors.white,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 16,
                            color: AppColors.white,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: 100,
                            height: 12,
                            color: AppColors.white,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 150,
                            height: 12,
                            color: AppColors.white,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 120,
                            height: 12,
                            color: AppColors.white,
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 80,
                            height: 12,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  height: 35,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
