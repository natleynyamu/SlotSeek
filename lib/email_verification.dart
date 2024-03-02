import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/custom_widgets.dart';
import 'package:slot_seek/verification_code.dart';

class ForgotPasswordEmailVerification extends StatelessWidget {
  const ForgotPasswordEmailVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Stack(
          children: [
            BackButtonWidget(context: context),
            
            const Positioned(
              top: 20,
              right: 20,
              child: Text(
                'SlotSeek',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16,
               
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/email.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Email Verification',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(width: 320,
                      child: Text(
                        'Please enter the email address associated with your account',
                        style: TextStyle(
                          color: AppColors.textDark,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 320,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        //color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const CustomTextFormField(
                        labelText: 'Enter your email',
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      width: 290,
                      child: PrimaryElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ForgotPasswordVerificationCode(),
                          ));
                        },
                        text: 'Send Code',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
