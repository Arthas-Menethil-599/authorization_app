import 'package:authorization_app/ui/characters_list/characters_list_screen.dart';
import 'package:authorization_app/constants/app_assets.dart';
import 'package:authorization_app/ui/login/widgets/login_text_field.dart';
import 'package:authorization_app/ui/login/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_styles.dart';
import '../../../generated/l10n.dart';
import '../../widgets/app_alert_dialog.dart';
import '../../widgets/app_button_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  String? login;
  String? password;

  void goHomeScreen() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                AppAssets.images.logo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      S.of(context).login,
                      style: AppStyles.s14w500.copyWith(
                        height: 2.0,
                        leadingDistribution: TextLeadingDistribution.even,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    LoginTextField(
                      onSaved: (login) {
                        this.login = login;
                      },
                    ),
                    Text(
                      S.of(context).password,
                      style: AppStyles.s14w500.copyWith(
                        height: 2.0,
                        leadingDistribution: TextLeadingDistribution.even,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    PasswordTextField(
                      onSaved: (password) {
                        this.password = password;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: AppButtonStyles.elevated1,
                      child: Text(
                        S.of(context).signIn,
                      ),
                      onPressed: () {
                        final isValidated =
                            formKey.currentState?.validate() ?? false;
                        if (isValidated) {
                          FocusScope.of(context).unfocus();
                          formKey.currentState?.save();
                          if (login == 'qwerty' && password == '123456ab') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const CharactersListScreen(),
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AppAlertDialog(
                                  title: Text(S.of(context).error),
                                  content: Text(
                                    S.of(context).wrongLoginOrPassword,
                                  ),
                                );
                              },
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text('${S.of(context).dontHaveAnAccountHint}?'),
                ),
                TextButton(
                  style: AppButtonStyles.text1,
                  child: Text(
                    S.of(context).create,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
