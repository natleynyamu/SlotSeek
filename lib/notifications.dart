import 'dart:html';

import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/home.dart';
import 'package:slot_seek/profile.dart';

import 'custom_widgets.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

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
              title: const Text('Notifications'),
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [




                  ])),
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
                  currentIndex: 1,
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
                    // Implement navigation logic based on index
                    if (index == 1) {
                      // Navigate to profile page
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
        ));
  }
}
