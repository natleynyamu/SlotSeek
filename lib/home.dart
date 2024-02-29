import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/custom_widgets.dart';
import 'package:slot_seek/notifications.dart';
import 'package:slot_seek/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            title: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textLightorange),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  color: AppColors.textLightorange,
                ),
              ],
            ),
            backgroundColor: AppColors.primaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
          ),
        ),
        body: const ParkingLot(),
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
                currentIndex: 0,
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
                      MaterialPageRoute(builder: (context) =>const  ProfilePage()),
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


class ParkingLot extends StatelessWidget {
  const ParkingLot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text(
                    'Lot A',
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ParkingSpace(
                    status: ParkingStatus.occupied,
                    isOccupied: true,
                    slotId: 'A1',
                    onTap: () {
                      _showSlotDetailsDialog(
                          context, 'Lot A', 'A1', ParkingStatus.occupied);
                    },
                  ),
                  ParkingSpace(
                    status: ParkingStatus.occupied,
                    isOccupied: false,
                    slotId: 'A2',
                    onTap: () {
                      _showSlotDetailsDialog(
                          context, 'Lot A', 'A2', ParkingStatus.available);
                    },
                  ),
                  ParkingSpace(
                    status: ParkingStatus.occupied,
                    isOccupied: true,
                    slotId: 'A3',
                    onTap: () {
                      _showSlotDetailsDialog(
                          context, 'Lot A', 'A3', ParkingStatus.occupied);
                    },
                  ),
                  ParkingSpace(
                    status: ParkingStatus.occupied,
                    isOccupied: false,
                    slotId: 'A4',
                    onTap: () {
                      _showSlotDetailsDialog(
                          context, 'Lot A', 'A4', ParkingStatus.available);
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Lot B',
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  ParkingSpace(
                    status: ParkingStatus.occupied,
                    isOccupied: false,
                    slotId: 'B1',
                    onTap: () {
                      _showSlotDetailsDialog(
                          context, 'Lot B', 'B1', ParkingStatus.available);
                    },
                  ),
                  ParkingSpace(
                    status: ParkingStatus.occupied,
                    isOccupied: false,
                    slotId: 'B2',
                    onTap: () {
                      _showSlotDetailsDialog(
                          context, 'Lot B', 'B2', ParkingStatus.available);
                    },
                  ),
                  ParkingSpace(
                    status: ParkingStatus.occupied,
                    isOccupied: true,
                    slotId: 'B3',
                    onTap: () {
                      _showSlotDetailsDialog(
                          context, 'Lot B', 'B3', ParkingStatus.occupied);
                    },
                  ),
                  ParkingSpace(
                    status: ParkingStatus.occupied,
                    isOccupied: false,
                    slotId: 'B4',
                    onTap: () {
                      _showSlotDetailsDialog(
                          context, 'Lot B', 'B4', ParkingStatus.available);
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.arrow_upward,
                color: AppColors.greyDark,
                size: 24,
              ),
              SizedBox(height: 5),
              Text(
                'Entry',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.greyDark,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showSlotDetailsDialog(BuildContext context, String lotName,
      String slotId, ParkingStatus status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const RadialGradient(
              center: Alignment(0.30, 0.86),
              radius: 0.06,
              colors: [
                AppColors.primaryGradientStart,
                AppColors.primaryGradientEnd
              ],
            ),
          ),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Slot Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CloseButton(
                    color: AppColors.primaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text('Parking Lot:'),
                      const SizedBox(width: 10),
                      Text(
                        lotName,
                        style: TextStyle(
                          color: status == ParkingStatus.available
                              ? AppColors
                                  .primaryLight // Use primary color for available slots
                              : AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text('Slot:'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        slotId,
                        style: TextStyle(
                          color: status == ParkingStatus.available
                              ? AppColors
                                  .primaryLight // Use primary color for available slots
                              : AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text('Status:'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        status == ParkingStatus.available
                            ? 'Available'
                            : 'Occupied',
                        style: TextStyle(
                          color: status == ParkingStatus.available
                              ? AppColors
                                  .primaryLight // Use primary color for available slots
                              : AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  PrimaryElevatedButton(
                    onPressed: status == ParkingStatus.available
                        ? () {}
                        : null, // Disable button if not available

                    text: 'Book Slot',
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ParkingSpace extends StatelessWidget {
  final bool isOccupied;
  final ParkingStatus status;
  final String slotId; // Add slotId parameter
  final VoidCallback onTap;

  const ParkingSpace({
    Key? key,
    required this.isOccupied,
    required this.status,
    required this.slotId, // Update constructor
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 80,
        decoration: BoxDecoration(
          color: isOccupied ? AppColors.greyLight : AppColors.textLightblue,
          border: Border.all(
            color: AppColors.greyMedium,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      slotId, // Display slotId

                      style: TextStyle(
                        color: isOccupied
                            ? AppColors.secondaryColor
                            : AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Icon(
                      isOccupied ? Icons.lock : Icons.lock_open,
                      color: isOccupied
                          ? AppColors.secondaryColor
                          : AppColors.primaryColor,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  isOccupied ? 'Occupied' : 'Available',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isOccupied
                        ? AppColors.secondaryColor
                        : AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum ParkingStatus {
  available,
  occupied,
}
