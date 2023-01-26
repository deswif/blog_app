import 'package:blog_app/app/app.dart';
import 'package:blog_app/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeErrorNotifier(
      child: CupertinoPageScaffold(
        child: WithFloatingButton(
          icon: CupertinoIcons.pen,
          onPressed: () => _onCreatePostPressed(context),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  HomeNavigationBar(
                    onLogOutPressed: () => _onLogOutPressed(context),
                    onRefreshPressed: () => _onRefreshPressed(context),
                  ),
                  const HomeContent(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _onLogOutPressed(BuildContext context) {
    context.read<AppBloc>().add(const AppLogoutRequested());
  }

  void _onRefreshPressed(BuildContext context) {
    context.read<HomeBloc>().add(HomeLoadingRequested());
  }

  void _onCreatePostPressed(BuildContext context) {
    showCupertinoModalBottomSheet<bool>(
      context: context,
      duration: const Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<HomeBloc>(),
          child: const PostCreateView(),
        );
      },
    ).then((value) {
      if (value == null) return;
      if (!value) {
        Navigator.pop(context);
      }
    });
  }
}
