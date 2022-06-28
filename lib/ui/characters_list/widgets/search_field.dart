import 'package:authorization_app/constants/app_colors.dart';
import 'package:authorization_app/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: AppStyles.s16w400,
              decoration: InputDecoration(
                hintText: S.of(context).searchCharacter,
                hintStyle: AppStyles.s16w400.copyWith(
                  color: AppColors.neutral3,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                filled: true,
                fillColor: AppColors.neutral2,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20.0,
                  color: AppColors.neutral1,
                ),
                suffixIcon: const Icon(
                  Icons.filter_list_alt,
                  size: 20.0,
                  color: AppColors.neutral1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
