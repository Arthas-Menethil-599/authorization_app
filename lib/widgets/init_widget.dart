import 'package:authorization_app/repo/repo_characters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../repo/repo_settings.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => RepoSettings(),
        ),
        Provider(
          create: (context) => RepoCharacters(),
        ),
      ],
      child: child,
    );
  }
}
