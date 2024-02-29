import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/edit_profie.dart';
import 'package:slot_seek/notifications.dart';

import 'home.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: const Text('Profile'),
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.greyLight, width: 2),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 80,
                      color: AppColors.greyLight,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigate to Edit Profile screen
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const EditProfile(),
                              ),
                            );

                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.edit,
                                color: AppColors.primaryLight,
                                size: 24,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Edit Profile',
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle Help button press
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.help,
                                color: AppColors.primaryLight,
                                size: 24,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Help',
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle Theme button press
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.palette,
                                color: AppColors.textDark,
                                size: 24,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Theme',
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle Change Password button press
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.lock,
                                color: AppColors.primaryLight,
                                size: 24,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Change Password',
                                style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle Logout button press
                          },
                          child: Row(
                            children: const [
                              Icon(
                                Icons.exit_to_app,
                                color: AppColors.secondaryColor,
                                size: 24,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Logout',
                                style: TextStyle(
                                    color: AppColors.secondaryColor,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                    // Navigate to profile page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()),
                    );
                  }
                  if (index == 1) {
                    // Navigate to profile page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationsPage()),
                    );
                  }
                  // Implement navigation logic based on index
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
      ),
    );
  }
}
