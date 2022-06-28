import 'package:authorization_app/constants/app_colors.dart';
import 'package:authorization_app/ui/characters_list/widgets/search_field.dart';
import 'package:flutter/material.dart';

import '../../../../../dto/Character.dart';
import '../../../constants/app_styles.dart';
import '../../../dto/Character.dart';
import '../../../generated/l10n.dart';
import '../../widgets/app_nav_bar.dart';
import 'widgets/character_grid_tile.dart';
import 'widgets/character_list_tile.dart';

part 'widgets/_grid_view.dart';
part 'widgets/_list_view.dart';

class CharactersListScreen extends StatefulWidget {
  const CharactersListScreen({Key? key}) : super(key: key);

  @override
  State<CharactersListScreen> createState() => _CharactersListScreenState();
}

class _CharactersListScreenState extends State<CharactersListScreen> {
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const AppNavBar(current: 0),
        body: Column(
          children: [
            const SearchField(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${S.of(context).allCharacters.toUpperCase()}: ${_charactersList.length}',
                      style: AppStyles.s10w500.copyWith(
                        color: AppColors.neutral1,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(isListView ? Icons.list : Icons.grid_view),
                    iconSize: 20.0,
                    color: AppColors.neutral1,
                    onPressed: () {
                      setState(
                        () {
                          isListView = !isListView;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
                child: isListView
                    ? _ListView(charactersList: _charactersList)
                    : _GridView(charactersList: _charactersList))
          ],
        ),
      ),
    );
  }
}

final _charactersList = [
  const Character(
    name: 'Рик Санчез',
    gender: 'Мужской',
    species: 'Человек',
    status: 'Живой',
  ),
  const Character(
    name: 'Директор Агентства',
    gender: 'Мужской',
    species: 'Человек',
    status: 'Живой',
  ),
  const Character(
    name: 'Морти Смит',
    gender: 'Мужской',
    species: 'Человек',
    status: 'Живой',
  ),
  const Character(
    name: 'Саммер Смит',
    gender: 'Мужской',
    species: 'Человек',
    status: 'Живой',
  ),
  const Character(
    name: 'Альберт Эйнштейн',
    gender: 'Мужской',
    species: 'Человек',
    status: 'Мертвый',
  ),
  const Character(
    name: 'Алан Райлс',
    gender: 'Мужской',
    species: 'Человек',
    status: 'Мертвый',
  ),
];
