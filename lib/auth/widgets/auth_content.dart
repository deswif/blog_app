import 'package:blog_app/auth/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthContent extends StatefulWidget {
  const AuthContent({super.key});

  @override
  State<AuthContent> createState() => _AuthContentState();
}

class _AuthContentState extends State<AuthContent> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            AuthTextField(
              controller: _emailController,
              placeholder: 'Email',
            ),
            const SizedBox(height: 30),
            AuthTextField(
              controller: _passwordController,
              placeholder: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            AuthToggleButton(onPressed: () => _onTogglePagePressed(context)),
            const Spacer(),
            AuthButton(onPressed: () => _onAuthPressed(context)),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  void _onTogglePagePressed(BuildContext context) {
    context.read<AuthBloc>().add(AuthPageToggled());
  }

  void _onAuthPressed(BuildContext context) {
    context.read<AuthBloc>().add(
          AuthButtonPressed(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
  }
}
