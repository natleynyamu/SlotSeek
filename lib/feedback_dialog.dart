import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/custom_widgets.dart';

class FeedbackDialog extends StatelessWidget {
  const FeedbackDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String feedback = ''; // Variable to store the feedback

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
        title: const Text('Leave Feedback',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Set to minimize height
          children: [
            TextFormField(
              cursorColor: AppColors.secondaryColor,
              onChanged: (value) {
                feedback = value; // Update the feedback when the user types
              },
              maxLines: 5, // Allow multiple lines for feedback
              decoration: const InputDecoration(
                labelText: 'Enter your feedback',
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
              // TODO: Handle the feedback submission
              //print('Feedback submitted: $feedback');
    
              // Close the dialog
              Navigator.of(context).pop();
            },
            text: 'Submit',
          ),
        ],
      ),
    );
  }
}
