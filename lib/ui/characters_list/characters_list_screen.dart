import 'package:authorization_app/bloc/characters/bloc_characters.dart';
import 'package:authorization_app/dto/character.dart';
import 'package:authorization_app/ui/characters_list/widgets/character_grid_tile.dart';
import 'package:authorization_app/ui/characters_list/widgets/character_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/characters/bloc_characters.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';
import '../../generated/l10n.dart';
import '../../widgets/app_nav_bar.dart';
import 'widgets/search_field.dart';

part 'widgets/_grid_view.dart';
part 'widgets/_list_view.dart';

class CharactersListScreen extends StatelessWidget {
  const CharactersListScreen({Key? key}) : super(key: key);

  static final isListView = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const AppNavBar(current: 0),
        body: Column(
          children: [
            SearchField(
              onChanged: (value) {
                BlocProvider.of<BlocCharacters>(context).add(
                  EventCharactersFilterByName(
                    value,
                  ),
                );
              },
            ),
            BlocBuilder<BlocCharacters, StateBlocCharacters>(
              builder: (context, state) {
                var charactersTotal = 0;
                if (state is StateCharactersData) {
                  charactersTotal = state.data.length;
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          S
                              .of(context)
                              .allCharacters(charactersTotal)
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
                          isListView.value = !isListView.value;
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            Expanded(
              child: BlocBuilder<BlocCharacters, StateBlocCharacters>(
                builder: (context, state) {
                  if (state is StateCharactersLoading) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    );
                  }
                  if (state is StateCharactersError) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(state.error),
                        ),
                      ],
                    );
                  }
                  if (state is StateCharactersData) {
                    if (state.data.isEmpty) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(S.of(context).charactersListIsEmpty),
                          ),
                        ],
                      );
                    } else {
                      return ValueListenableBuilder<bool>(
                        valueListenable: isListView,
                        builder: (context, isListViewMode, _) {
                          return isListViewMode
                              ? _ListView(
                                  charactersList: state.data,
                                )
                              : _GridView(
                                  charactersList: state.data,
                                );
                        },
                      );
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
