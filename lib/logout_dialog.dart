import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/get_started.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: const Text(
          'Logout',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        content: const Text(
          'Are you sure you want to logout?',
          style: TextStyle(color: AppColors.textDark),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Dismiss the dialog
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Perform logout action
              // For example, navigate to the login page
              Navigator.pop(context); // Close dialog
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GetStartedPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
