import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/custom_widgets.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newPassword = '';

    // Variable to store the new name
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
        title: const Text('Change Password',style: TextStyle(color: AppColors.primaryColor),),
        contentPadding:const  EdgeInsets.symmetric(vertical: 12),
        content: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                cursorColor: AppColors.secondaryColor,
                onChanged: (value) {
                  newPassword =
                      value; // Update the new name when the user types
                },
                decoration: const InputDecoration(
                  labelText: ' Old Password',
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
                  newPassword =
                      value; // Update the new name when the user types
                },
                decoration: const InputDecoration(
                  labelText: ' New Password',
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
                  newPassword =
                      value; // Update the new name when the user types
                },
                decoration: const InputDecoration(
                  labelText: 'Confirm New Password',
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
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
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
                const SizedBox(
                  width: 20,
                ), // Disable the save button if password is empty
                PrimaryElevatedButton(
                  onPressed: newPassword.isNotEmpty
                      ? () {
                          // Perform the edit operation with the new password
                          // For example, you can update the user's password

                          // Close the dialog
                          Navigator.of(context).pop();
                        }
                      : null,
                  text: 'Save',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
