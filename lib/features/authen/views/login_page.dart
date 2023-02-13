import 'package:ddd_arch/features/authen/blocs/login_bloc/login_bloc.dart';
import 'package:ddd_arch/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => getIt()..add(InitLoginEvent()),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final loginState = context.select((LoginBloc bloc) => bloc.state);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (loginState.loginStatus == LoginStatus.loading)
              const CupertinoActivityIndicator()
            else
              const SizedBox(),
            TextButton(
                onPressed: () {
                  context.read<LoginBloc>().add(SubmitLoginEvent());
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
