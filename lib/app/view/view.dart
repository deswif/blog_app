import 'package:auth_repository/auth_repository.dart';
import 'package:blog_app/app/app.dart';
import 'package:blog_app/auth/auth.dart';
import 'package:blog_app/home/home.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppBloc(authRepository: GetIt.instance.get<AuthRepository>()),
      child: const _App(),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        brightness: Brightness.dark,
      ),
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: _onGeneratePages,
      ),
    );
  }

  List<Page<dynamic>> _onGeneratePages(
    AppStatus state,
    List<Page<dynamic>> pages,
  ) {
    switch (state) {
      case AppStatus.authenticated:
        return [
          const CupertinoPage(
            child: HomePage(),
          )
        ];
      case AppStatus.unauthenticated:
        return [
          const CupertinoPage(
            child: AuthPage(),
          )
        ];
    }
  }
}
