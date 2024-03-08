import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/custom_widgets.dart';
import 'package:slot_seek/verification_code.dart';

class ForgotPasswordEmailVerification extends StatefulWidget {
  const ForgotPasswordEmailVerification({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordEmailVerification> createState() =>
      _ForgotPasswordEmailVerificationState();
}

class _ForgotPasswordEmailVerificationState
    extends State<ForgotPasswordEmailVerification> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  Future<bool> doesEmailExist(String email) async {
    try {
      // Check if the email exists in the Firebase Auth database
      final userCredential =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email.trim());
      // If userCredential is empty, email does not exist
      return userCredential.isNotEmpty;
    } catch (e) {
      // Show error message in a snack bar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(
            child: Text(
              'An error occurred while checking email existence. Please try again later.',
              style: TextStyle(color: AppColors.errorColor),
            ),
          ),
          backgroundColor: AppColors.greyLight,
        ),
      );
      return false;
    }
  }


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
                    const SizedBox(
                      width: 320,
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
                    Form(
                      key: _formKey,
                      child: Container(
                        width: 320,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          //color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CustomTextFormField(
                          controller: _emailController,
                          labelText: 'Enter your email',
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Please enter an email address';
                            } else if ((!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(email))) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      width: 290,
                      child: PrimaryElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final email = _emailController.text.trim();
                            // Check if email exists in the database
                            final emailExists = await doesEmailExist(email);
                            if (emailExists) {
                              // Navigate to verification code input page
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordVerificationCode(),
                                ),
                              );
                            } else {
                              // Show error message if email does not exist
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Center(
                                    child: Text(
                                      'This email does not exist. Please enter the email associated with your account.',
                                      style: TextStyle(
                                          color: AppColors.errorColor),
                                    ),
                                  ),
                                  backgroundColor: AppColors.greyLight,
                                ),
                              );
                            }
                          }
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
