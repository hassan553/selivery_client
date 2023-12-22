import 'package:flutter/material.dart';
import 'package:selivery_client/features/auth/data/data_source/social_auth.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
            onPressed: () async {
             // await handleSignInWithFacebook();
            },
            child: Text(
              "Text Button",
            ),
          ),
          const SizedBox(height:20),
          TextButton(
            onPressed: () async {
             // await facebookSignOut();
            },
            child: Text(
              "Text logout",
            ),
          ),
          ],
        )
      ),
    );
    ;
  }
}
