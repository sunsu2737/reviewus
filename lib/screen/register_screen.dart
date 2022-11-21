import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:review/models/auth_model.dart';
import 'package:review/models/register_model.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFieldModel(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('계정 등록'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailInput(),
                SizedBox(
                  height: 50,
                ),
                PasswordInput(),
                SizedBox(
                  height: 50,
                ),
                PasswordConfirmInput(),
                SizedBox(
                  height: 200,
                ),
                RegisterButton()
              ],
            ),
          )),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    final registerFieldModel =
        Provider.of<RegisterFieldModel>(context, listen: false);
    return Container(
      width: 600.w,
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextField(
        onChanged: (email) {
          registerFieldModel.setEmail(email + "@grepp.co");
        },
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(labelText: '영어 이름', helperText: ''),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    final registerFieldModel =
        Provider.of<RegisterFieldModel>(context, listen: false);
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      width: 600.w,
      child: TextField(
        onChanged: (password) {
          registerFieldModel.setPassword(password);
        },
        obscureText: true,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(labelText: '비밀번호', helperText: ''),
      ),
    );
  }
}

class PasswordConfirmInput extends StatelessWidget {
  const PasswordConfirmInput({super.key});

  @override
  Widget build(BuildContext context) {
    final registerFieldModel = Provider.of<RegisterFieldModel>(
      context,
    );
    return Container(
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      width: 600.w,
      child: TextField(
        onChanged: (password) {
          registerFieldModel.setPasswordConfirm(password);
        },
        obscureText: true,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
            labelText: '비밀번호  확인',
            helperText: '',
            errorText: registerFieldModel.password !=
                    registerFieldModel.passwordConfirm
                ? '비밀번호가 일치하지 않습니다.'
                : null),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    final registerFieldModel =
        Provider.of<RegisterFieldModel>(context, listen: false);
    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    return Container(
      width: 400.w,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
        child: Text('계정 등록'),
        onPressed: () async {
          await authClient
              .registerWithEmail(
                  registerFieldModel.email, registerFieldModel.password)
              .then((registerStatus) {
            if (registerStatus == AuthStatus.registerSuccess &&
                registerFieldModel.password ==
                    registerFieldModel.passwordConfirm) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text('계정 등록이 완료되었습니다! 이메일 인증을 완료해주세요.')));
                
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                    SnackBar(content: Text('계정 등록에 실패했습니다. 다시 시도해주세요.')));
            }
          });
        },
      ),
    );
  }
}
