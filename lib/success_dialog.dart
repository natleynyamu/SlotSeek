import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'custom_widgets.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      
      child: Container(
        
        width: 350,
        height: 414,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
            gradient: const RadialGradient(colors: [
          AppColors.primaryGradientStart,
          AppColors.primaryGradientEnd
        ]
        )
        ),
        
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: CloseButton(
                      color: AppColors.secondaryColor,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/success.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Well Done!',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  width: 300,
                  child: Text(
                    'You have successfully changed password! Please use the newly created password when logging in',textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  width: 250,
                  child: PrimaryElevatedButton(
                    onPressed: () {},
                    text: 'Log In to Continue',
                  ),
                ),
              ],
              
            ),
          ),
          
        ),
      ),
    );
  }
}
