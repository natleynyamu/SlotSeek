import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/sign_up.dart';

import 'custom_widgets.dart';
import 'email_verification.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                    'Welcome back',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 32,
                      
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Log in with your email and password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 14,
                   
                      fontWeight: FontWeight.w400,
                    ),
                  ),   const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: Column(
                      children: [
                        const CustomTextFormField(
                          labelText: 'Email',
                        ),
                        const SizedBox(height: 20),
                        const CustomTextFormField(
                          labelText: 'Password',
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 300,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            // ignore: sort_child_properties_last
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                color: AppColors.textLightorange,
                                fontSize: 20,
                             
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ForgotPasswordEmailVerification(),
                      ));
                    },
                    child: const Text(
                      'Forgot your password?',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                        
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Do not have an Account?',
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: 14,
                          
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {
                          // Navigate to the registration page
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ));
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 20,
                           
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
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
