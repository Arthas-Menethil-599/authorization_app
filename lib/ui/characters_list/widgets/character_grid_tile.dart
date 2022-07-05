import 'package:authorization_app/widgets/user_ava.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';
import '../../../dto/character.dart';
import '../../../generated/l10n.dart';

class CharacterGridTile extends StatelessWidget {
  const CharacterGridTile(this.character, {Key? key}) : super(key: key);
  final Character character;

  Color _statusColor(String? status) {
    if (status == 'Dead') return AppColors.statusRed;
    if (status == 'Alive') return AppColors.statusGreen;
    return Colors.grey;
  }

  String _statusLabel(String? status) {
    if (status == 'Dead') return S.current.dead;
    if (status == 'Alive') return S.current.alive;
    return S.current.noData;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserAva(
          character.image,
          radius: 70.0,
          margin: const EdgeInsets.only(bottom: 0.0),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _statusLabel(character.status).toUpperCase(),
                style: AppStyles.s10w500.copyWith(
                  letterSpacing: 1.5,
                  color: _statusColor(
                    character.status,
                  ),
                ),
              ),
              Text(
                character.name ?? S.of(context).noData,
                style: AppStyles.s14w500.copyWith(
                  height: 1.5,
                  color: AppColors.mainText,
                ),
              ),
              Text(
                '${character.species ?? S.of(context).noData}, ${character.gender ?? S.of(context).noData}',
                style: AppStyles.s12w400.copyWith(
                  color: AppColors.neutral1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
