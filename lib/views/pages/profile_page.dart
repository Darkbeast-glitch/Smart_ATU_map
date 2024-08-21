import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_atu_nav/repositories/auth_services.dart';
import 'package:smart_atu_nav/utils/my_buttons.dart';
import 'package:smart_atu_nav/views/Auths/login_page.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAuthProvider = ref.read(authSerivceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile '),
      ),
      body: Center(
        child: MyButton(
            onTap: () async {
              await userAuthProvider.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) =>    LoginPage(),
                ),
              );
            },
            text: "Sign Out"),
      ),
    );
  }
}
