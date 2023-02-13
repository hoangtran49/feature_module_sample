import 'package:ddd_arch/features/authen/views/login_page.dart';
import 'package:ddd_arch/features/profile/models/user.dart';
import 'package:ddd_arch/features/profile/profile.dart';
import 'package:ddd_arch/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (_) => getIt()..add(RequestSubmitProfileEvent()),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentProfile =
        context.select((ProfileBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: currentProfile != null
          ? _AuthenticatedView(
              user: currentProfile,
            )
          : _UnAuthenView(),
    );
  }
}

class _UnAuthenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('You are not login, please login to continue'),
          TextButton(
            child: const Text('Login'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          )
        ],
      ),
    );
  }
}

class _AuthenticatedView extends StatelessWidget {
  const _AuthenticatedView({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Loggin name: ${user.name}'),
          Text('Birth day: ${user.birthDay}'),
          TextButton(
            onPressed: () {
              context.read<ProfileBloc>().add(LogoutEvent());
            },
            child: const Text('Logout'),
          )
        ],
      ),
    );
  }
}
