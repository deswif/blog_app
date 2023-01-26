import 'package:blog_app/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.posts.isNotEmpty) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final post = state.posts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: PostCard(post: post),
                  );
                },
                childCount: state.posts.length,
              ),
            ),
          );
        }

        return const SliverFillRemaining(
          child: Center(
            child: Text('No posts.'),
          ),
        );
      },
    );
  }
}
