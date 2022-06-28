import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../generated/l10n.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField({
    Key? key,
    this.onSaved,
  }) : super(key: key);

  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(S.of(context).login),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SvgPicture.asset(
            AppAssets.svg.account,
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
      maxLength: 8,
      validator: (value) {
        if (value == null) return S.of(context).inputErrorCheckLogin;
        if (value.length < 3) {
          return S.of(context).inputErrorLoginIsShort;
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
