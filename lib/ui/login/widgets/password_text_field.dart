import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../generated/l10n.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    this.onSaved,
  }) : super(key: key);

  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(S.of(context).password),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SvgPicture.asset(
            AppAssets.svg.password,
            width: 16.0,
            color: AppColors.neutral1,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12.0),
        ),
        fillColor: AppColors.neutral2,
        filled: true,
      ),
      obscureText: true,
      maxLength: 16,
      validator: (value) {
        if (value == null) return S.of(context).inputErrorCheckPassword;
        if (value.length < 8) {
          return S.of(context).inputErrorPasswordIsShort;
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
