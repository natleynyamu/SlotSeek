import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'custom_widgets.dart';


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
                  Image.asset('images/sign_up.png'),
                  const Text(
                    'Create an account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 32,
                    
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                 
                  const SizedBox(height: 20),
                  const Text(
                    'Create an account to be able to keep your records, book records, leave feedback, set your preferences and receive personalized information',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 14,
                 
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(height: 30),
                        CustomTextFormField(
                          labelText: 'Email',
                        ),
                        SizedBox(height: 20),
                        CustomTextFormField(
                          labelText: 'Password',
                        ),
                        SizedBox(height: 20),
                        CustomTextFormField(
                          labelText: 'Confirm Password',
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
