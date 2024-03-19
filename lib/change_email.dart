import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/custom_widgets.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String oldEmail = '';
    String password = '';
    String newEmail = ''; // Variable to store the new email

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryGradientStart,
            AppColors.primaryGradientEnd
          ],
        ),
      ),
      child: AlertDialog(
        contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0), // Adjust padding
        title: const Text('Change Email',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Set to minimize height
          children: [
            TextFormField(
              cursorColor: AppColors.secondaryColor,
              onChanged: (value) {
                newEmail = value; // Update the new email when the user types
              },
              decoration: const InputDecoration(
                labelText: 'Enter Old Email',
                labelStyle: TextStyle(
                  color: AppColors.greyMedium,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
            ),
            TextFormField(
              cursorColor: AppColors.secondaryColor,
              onChanged: (value) {
                newEmail = value; // Update the new email when the user types
              },
              decoration: const InputDecoration(
                labelText: 'Enter Password',
                labelStyle: TextStyle(
                  color: AppColors.greyMedium,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
            ),
            TextFormField(
              cursorColor: AppColors.secondaryColor,
              onChanged: (value) {
                newEmail = value; // Update the new email when the user types
              },
              decoration: const InputDecoration(
                labelText: 'Enter New Email',
                labelStyle: TextStyle(
                  color: AppColors.greyMedium,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Close the dialog
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppColors.secondaryColor),
            ),
          ),
          PrimaryElevatedButton(
            onPressed: () {
              // Perform the edit operation with the new email
              // For example, you can update the user's profile with the new email
    
              // Close the dialog
              Navigator.of(context).pop();
            },
            text: 'Save',
          ),
        ],
      ),
    );
  }
}
