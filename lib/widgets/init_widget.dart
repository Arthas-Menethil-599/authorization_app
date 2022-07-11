import 'package:authorization_app/bloc/characters/bloc_characters.dart';
import 'package:authorization_app/repo/repo_characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../repo/api.dart';
import '../repo/repo_settings.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => Api(),
          ),
          RepositoryProvider(
            create: (context) => RepoSettings(),
          ),
          RepositoryProvider(
            create: (context) => RepoCharacters(
              api: RepositoryProvider.of<Api>(context),
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => BlocCharacters(
                repo: RepositoryProvider.of<RepoCharacters>(context),
              )..add(EventCharactersFilterByName('')),
            ),
          ],
          child: child,
        ));
  }
}
