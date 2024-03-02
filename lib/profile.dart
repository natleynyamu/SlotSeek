import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/change_email.dart';
import 'package:slot_seek/change_password.dart';
import 'package:slot_seek/edit_profile.dart';
import 'package:slot_seek/feedback_dialog.dart';
import 'package:slot_seek/logout_dialog.dart';
import 'package:slot_seek/notifications.dart';


import 'home.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyLight,
      body: Stack(
        children: [
          // Overlapping Container (Blue)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.35,
            child: Container(
              color: AppColors.primaryColor, // Blue color
              child: Center(
                child: GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColors.greyLight, width: 2),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 80,
                        color: AppColors.greyLight,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Overlapping Container
          Positioned(
            bottom: 60, // Adjust the distance from the bottom as needed
            left: 20, // Adjust the left padding as needed
            right: 20, // Adjust the right padding as needed
            height: MediaQuery.of(context).size.height *
                0.55, // Adjust the height as needed

            child: Container(
              color: AppColors.greyLight,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    buildRow(context, Icons.edit, 'Edit Profile Name'),
                    const SizedBox(height: 20),
                    buildRow(context, Icons.email, 'Change Email Address'),
                    const SizedBox(height: 20),
                    buildRow(context, Icons.lock, 'Change Password'),
                    const SizedBox(height: 20),
                    //buildRow(context, Icons.palette, 'Theme'),
                    //const SizedBox(height: 20),
                    buildRow(context, Icons.feedback, 'Feedback'),
                    const SizedBox(height: 20),
                    buildRow(context, Icons.exit_to_app, 'Logout',
                        isOrange: true),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: AppColors.primaryColor,
          ),
          child: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: BottomNavigationBar(
              backgroundColor: AppColors.primaryColor,
              currentIndex: 2,
              selectedItemColor: AppColors.secondaryColor,
              unselectedItemColor: AppColors.greyLight,
              onTap: (index) {
                if (index == 0) {
                  // Navigate to Home page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
                // Implement navigation logic based on index
                if (index == 1) {
                  // Navigate to Notification page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationsPage()),
                  );
                }
                if (index == 2) {
                  // Navigate to profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                }
              },
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(BuildContext context, IconData icon, String text,
      {bool isOrange = false}) {
    return GestureDetector(
      onTap: () {
        // Handle button press
        if (text == 'Logout') {
          // Show logout confirmation dialog
          showDialog(
            context: context,
            builder: (context) => const LogoutDialog(), // Use LogoutDialog here
          );
        } // Handle button press
        if (text == 'Edit Profile Name') {
           // Show edit profile name dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const EditProfileDialog(); // Use the EditProfileDialog widget
            },
          );
        }   // Handle button press
        if (text == 'Change Password') {
          // Show logout confirmation dialog
          showDialog(
            context: context,
            builder: (context) => const ChangePassword(), // Use LogoutDialog here
          );
        }   // Handle button press
        if (text == 'Change Email Address') {
          // Show logout confirmation dialog
          showDialog(
            context: context,
            builder: (context) => const ChangeEmail(), // Use LogoutDialog here
          );
        }   // Handle button press
        if (text == 'Feedback') {
          // Show logout confirmation dialog
          showDialog(
            context: context,
            builder: (context) => const FeedbackDialog(), // Use LogoutDialog here
          );
        }   // Handle button press
        // if (text == 'Theme') {
        //   // Show logout confirmation dialog
        //   showDialog(
        //     context: context,
        //     builder: (context) => const ThemePage(), // Use LogoutDialog here
        //   );
        // }   
      },
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: isOrange
                    ? AppColors.secondaryColor
                    : AppColors.primaryColor,
                size: 24,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                    color: isOrange
                        ? AppColors.secondaryColor
                        : AppColors.textDark,
                    fontSize: 20),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Divider(color: AppColors.greyMedium, height: 1), // Divider
        ],
      ),
    );
  }
}
