import 'package:authorization_app/constants/app_styles.dart';
import 'package:authorization_app/widgets/user_ava.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../dto/Character.dart';
import '../../../generated/l10n.dart';

class CharacterListTile extends StatelessWidget {
  const CharacterListTile(this.character, {Key? key}) : super(key: key);

  final Character character;

  Color _statusColor(String? status) {
    if (status == 'Мертвый') return AppColors.statusRed;
    if (status == 'Живой') return AppColors.statusGreen;
    return Colors.grey;
  }

  String _statusLabel(String? status) {
    if (status == 'Мертвый') return S.current.dead;
    if (status == 'Живой') return S.current.alive;
    return S.current.noData;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UserAva(
          character.image,
          margin: const EdgeInsets.only(left: 5.0, right: 15.0),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                style: AppStyles.s16w500.copyWith(
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
