import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'custom_widgets.dart';
import 'login.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0.30, 0.86),
                radius: 0.06,
                colors: [
                  AppColors.primaryGradientStart,
                  AppColors.primaryGradientEnd
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  const Text(
                    'Create an account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 32,
                      fontFamily: 'Gabriela',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Register with an email and password to continue using the application',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textDark,
                            fontSize: 14,
                            fontFamily: 'Gabriela',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const CustomTextFormField(
                          labelText: 'Email',
                        ),
                        const SizedBox(height: 20),
                        const CustomTextFormField(
                          labelText: 'Password',
                        ),
                        const SizedBox(height: 20),
                        const CustomTextFormField(
                          labelText: 'Confirm Password',
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 300,
                          height: 60,
                          child: PrimaryElevatedButton(
                            onPressed: () {},
                            text: 'Sign Up',
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: AppColors.textDark,
                                fontSize: 14,
                                fontFamily: 'Gabriela',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(width: 10),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ));
                              },
                              child: const Text(
                                'Log in',
                                style: TextStyle(
                                  color: AppColors.secondaryColor,
                                  fontSize: 20,
                                  fontFamily: 'Gabriela',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
            BackButtonWidget(context: context),
        ],
      ),
    );
  }
}
