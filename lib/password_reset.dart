import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/custom_widgets.dart';
import 'package:slot_seek/success_dialog.dart';

class PasswordReset extends StatelessWidget {
  const PasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: RadialGradient(colors: [
              AppColors.primaryGradientStart,
              AppColors.primaryGradientEnd
            ])),
            child: Stack(children: [
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
                      child: SizedBox(
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/password_solid.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Change Password',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const SizedBox(
                          width: 320,
                          child: Text(
                            'Please ensure that this new password meets the criterion needed',
                            style: TextStyle(
                              color: AppColors.textDark,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const CustomTextFormField(
                          labelText: 'New Password',
                        ),
                        const SizedBox(height: 20),
                        const CustomTextFormField(
                          labelText: 'Confirm Password',
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 50,
                          width: 290,
                          child: PrimaryElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const SuccessDialog();
                                },
                              );
                            },
                            text: 'Save',
                          ),
                        ),
                      ],
                    ),
                  )))
            ])));
  }
}
