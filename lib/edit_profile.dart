import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/custom_widgets.dart';

class EditProfileDialog extends StatelessWidget {
  const EditProfileDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newName = ''; // Variable to store the new name

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primaryGradientStart,
            AppColors.primaryGradientEnd,
          ],
        ),
      ),
      child: AlertDialog(
        title: const Text('Edit Profile Name',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        content: TextFormField(
          cursorColor: AppColors.secondaryColor,
          onChanged: (value) {
            newName = value; // Update the new name when the user types
          },
          decoration: const InputDecoration(
            labelText: 'Enter New Name',
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
              // Perform the edit operation with the new name
              // For example, you can update the user's profile with the new name

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
