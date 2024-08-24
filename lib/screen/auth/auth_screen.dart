import 'package:flutter/material.dart';
import 'package:nike/theme.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    const onBackground = Colors.white;
    final ThemeData themeData = Theme.of(context);
    return Theme(
      data: themeData.copyWith(
        inputDecorationTheme: InputDecorationTheme(
          helperStyle: const TextStyle(color: onBackground),
          focusColor: onBackground,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          labelStyle: const TextStyle(
            color: onBackground,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: LightThemeColors.secondaryColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(48, 0, 48, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/nike.png',
                width: 100,
              ),
              Text(
                isLogin ? 'خوش آمدید' : 'ثبت نام',
                style: themeData.textTheme.bodyMedium!.copyWith(
                  color: onBackground,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                isLogin
                    ? 'لطفا ورارد حساب کاربری خود شوید'
                    : 'لطفا ثبت نام کنید',
                style: themeData.textTheme.bodyMedium!.copyWith(
                  color: onBackground,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                cursorColor: onBackground,
                style: TextStyle(color: onBackground),
                decoration: InputDecoration(
                  label: Text('نام کاربری'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const PasswordTextFelid(),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(isLogin ? 'ورود' : 'ثبت نام',
                      style: themeData.textTheme.bodyMedium),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isLogin ? 'حساب کاربری ندارید' : 'حساب کاربری دارید',
                      style: const TextStyle(
                        color: onBackground,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      isLogin ? 'ثبت نام' : 'ورود',
                      style: themeData.textTheme.bodyMedium!.copyWith(
                        color: LightThemeColors.primaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordTextFelid extends StatefulWidget {
  const PasswordTextFelid({
    super.key,
  });

  @override
  State<PasswordTextFelid> createState() => _PasswordTextFelidState();
}

class _PasswordTextFelidState extends State<PasswordTextFelid> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    const onBackground = Colors.white;
    return TextField(
      cursorColor: onBackground,
      style: const TextStyle(color: onBackground),
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: const Text('رمز عبور'),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          icon: Icon(
            obscureText ? Icons.visibility_off_outlined : Icons.visibility,
            color: onBackground.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
