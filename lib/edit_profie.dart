import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/notifications.dart';

import 'custom_widgets.dart';
import 'home.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

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
                title: const Text('Edit Profile'),
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
            body: Column(children: [
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
              Column(
                children: const [
                  Text(
                    'Jane Doe',
                    style: TextStyle(color: AppColors.primaryLight),
                  ),
                  Text(
                    'janedoe@gmail.com',
                    style: TextStyle(color: AppColors.primaryLight),
                  )
                ],
              ),
              Center(
                  child: SizedBox(
                      width: 300,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Name',
                                  style: TextStyle(
                                      fontFamily: 'Gabriela',
                                      fontSize: 20,
                                      color: AppColors.textDark),
                                ),
                                Container(
                                  width: 380,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        10), // Adjust the radius as needed
                                    border: Border.all(
                                        color: AppColors.primaryColor),
                                  ),
                                  child: const TextField(
                                    cursorColor: AppColors.secondaryColor,
                                    decoration: InputDecoration(
                                      hintText: ' Jane Doe',
                                      border: InputBorder
                                          .none, // No underline border
                                      // You can also customize other properties like fillColor, filled, contentPadding, etc.
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Email',
                                  style: TextStyle(
                                      fontFamily: 'Gabriela',
                                      fontSize: 20,
                                      color: AppColors.textDark),
                                ),
                                Container(
                                  width: 380,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        10), // Adjust the radius as needed
                                    border: Border.all(
                                        color: AppColors.primaryColor),
                                  ),
                                  child: const TextField(
                                    cursorColor: AppColors.secondaryColor,
                                    decoration: InputDecoration(
                                      hintText: ' janedoe@gmail.com',
                                      border: InputBorder
                                          .none, // No underline border
                                      // You can also customize other properties like fillColor, filled, contentPadding, etc.
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Date of Birth',
                                  style: TextStyle(
                                      fontFamily: 'Gabriela',
                                      fontSize: 20,
                                      color: AppColors.textDark),
                                ),
                                Container(
                                  width: 380,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        10), // Adjust the radius as needed
                                    border: Border.all(
                                        color: AppColors.primaryColor),
                                  ),
                                  child: const TextField(
                                    cursorColor: AppColors.secondaryColor,
                                    decoration: InputDecoration(
                                      hintText: ' 29-06-00',
                                      border: InputBorder
                                          .none, // No underline border
                                      // You can also customize other properties like fillColor, filled, contentPadding, etc.
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            PrimaryElevatedButton(
                              text: 'Save Changes',
                              onPressed: () {},
                            )
                          ])))
            ])));
  }
}
