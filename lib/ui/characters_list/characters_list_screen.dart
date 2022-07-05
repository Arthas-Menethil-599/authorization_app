import 'package:authorization_app/repo/repo_characters.dart';
import 'package:authorization_app/ui/characters_list/widgets/character_grid_tile.dart';
import 'package:authorization_app/ui/characters_list/widgets/character_list_tile.dart';
import 'package:authorization_app/ui/characters_list/widgets/vmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';
import '../../generated/l10n.dart';
import '../../widgets/app_nav_bar.dart';
import 'widgets/search_field.dart';
import 'package:authorization_app/dto/character.dart';

part 'widgets/_grid_view.dart';
part 'widgets/_list_view.dart';

class CharactersListScreen extends StatelessWidget {
  const CharactersListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const AppNavBar(current: 0),
        body: ChangeNotifierProvider(
          create: (context) => CharactersListVModel(
            repo: Provider.of<RepoCharacters>(context, listen: false),
          ),
          builder: (context, _) {
            final allCharacters =
                context.watch<CharactersListVModel>().filteredList.length;
            return Column(
              children: [
                SearchField(
                  onChanged: (value) {
                    Provider.of<CharactersListVModel>(context, listen: false)
                        .filter(
                      value.toLowerCase(),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          S
                              .of(context)
                              .allCharacters(allCharacters)
                              .toUpperCase(),
                          style: AppStyles.s10w500.copyWith(
                            letterSpacing: 1.5,
                            color: AppColors.neutral1,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.grid_view),
                        iconSize: 28.0,
                        color: AppColors.neutral1,
                        onPressed: () {
                          Provider.of<CharactersListVModel>(
                            context,
                            listen: false,
                          ).switchView();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Consumer<CharactersListVModel>(
                    builder: (context, vmodel, _) {
                      if (vmodel.isLoading) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                          ],
                        );
                      }
                      if (vmodel.errorMessage != null) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(vmodel.errorMessage!),
                            ),
                          ],
                        );
                      }
                      if (vmodel.filteredList.isEmpty) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(S.of(context).charactersListIsEmpty),
                            ),
                          ],
                        );
                      }
                      return vmodel.isListView
                          ? _ListView(
                              charactersList: vmodel.filteredList,
                            )
                          : _GridView(
                              charactersList: vmodel.filteredList,
                            );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
