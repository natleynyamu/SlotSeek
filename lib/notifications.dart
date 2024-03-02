import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/home.dart';
import 'package:slot_seek/profile.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primaryGradientStart,
                AppColors.primaryGradientEnd,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(height: 20),
                  Text(
                    'Today',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                  
                      fontWeight: FontWeight.w400,
                      height: 0.07,
                    ),
                  ),
                  SizedBox(height: 10),
                  NotificationItem(
                    image: 'images/success_notification.png',
                    text:
                        'Password Reset Successful. Action Password Reset on 11 February at...',
                  ),
                  SizedBox(height: 10),
                  NotificationItem(
                    image: 'images/time_low.png',
                    text:
                        'Time Running Out. Your Booked time is coming to an end. Ext...',
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Yesterday',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                   
                      fontWeight: FontWeight.w400,
                      height: 0.07,
                    ),
                  ),
                  SizedBox(height: 10),
                  NotificationItem(
                    image: 'images/cancelled_notification.png',
                    text:
                        'Booking Cancelled. Action Book a Slot has been Cancelled at...',
                  ),
                  SizedBox(height: 10),
                  NotificationItem(
                    image: 'images/added_time.png',
                    text:
                        'Time Extended Successfully! This is to notify you that time has been ex..',
                  ),
                  SizedBox(height: 40),
                  Text(
                    'February 28, 2024',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
             
                      fontWeight: FontWeight.w400,
                      height: 0.07,
                    ),
                  ),
                  SizedBox(height: 10),
                  NotificationItem(
                    image: 'images/success_notification.png',
                    text:
                        'Payment Successful! Your payment has been successfully proc...',
                  ),
                  SizedBox(height: 10),
                  NotificationItem(
                    image: 'images/added_time.png',
                    text:
                        'Time Extended Successfully! This is to notify you that time has been ex..',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'February 27, 2024',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                     
                      fontWeight: FontWeight.w400,
                      height: 0.07,
                    ),
                  ),
                  SizedBox(height: 10),
                  NotificationItem(
                    image: 'images/success_notification.png',
                    text:
                        'Payment Successful! Your payment has been successfully proc...',
                  ),
                  SizedBox(height: 10),
                  NotificationItem(
                    image: 'images/cancelled_notification.png',
                    text:
                        'Booking Cancelled. Action Book a Slot has been Cancelled at...',
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'February 26, 2024',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      
                      fontWeight: FontWeight.w400,
                      height: 0.07,
                    ),
                  ),
                  SizedBox(height: 10),
                  NotificationItem(
                    image: 'images/success_notification.png',
                    text:
                        'Payment Successful! Your payment has been successfully proc...',
                  ),
                  SizedBox(height: 10),
                  NotificationItem(
                    image: 'images/time_low.png',
                    text:
                        'Time Running Out. Your Booked time is coming to an end. Ext...',
                  ),
                ],
              ),
            ),
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
                currentIndex: 1,
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
        ));
  }
}

class NotificationItem extends StatelessWidget {
  final String image;
  final String text;

  const NotificationItem({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColors.greyLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset(image,
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
