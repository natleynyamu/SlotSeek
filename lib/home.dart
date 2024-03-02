import 'package:flutter/material.dart';
import 'package:slot_seek/app_colors.dart';
import 'package:slot_seek/book_slot.dart';
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
            AppColors.primaryGradientEnd,
          ],
        ),
      ),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: Row(
              children: const [
                Expanded(
                  child: Text(
                    'Home',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.textLightorange),
                  ),
                ),
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
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                  if (index == 1) {
                    // Navigate to notifications page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotificationsPage()),
                    );
                  }
                  // Implement navigation logic based on index
                  if (index == 2) {
                    // Navigate to profile page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()),
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
          const Text(
            'Choose a Slot',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(
            width: 320,
            child: Text(
              'Visualize vacant parking slots on this Lot. Tap on a slot to book a slot',
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  for (var slot in ParkingData.lotA)
                    ParkingSpace(
                      slot: slot,
                      onTap: () {
                        _showSlotDetailsDialog(context, slot);
                      },
                    ),
                ],
              ),
              Column(
                children: [
                  for (var slot in ParkingData.lotB)
                    ParkingSpace(
                      slot: slot,
                      onTap: () {
                        _showSlotDetailsDialog(context, slot);
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

  void _showSlotDetailsDialog(BuildContext context, ParkingSlot slot) {
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
                AppColors.primaryGradientEnd,
              ],
            ),
          ),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Slot Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: CloseButton(
                    color: AppColors.primaryColor,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
               
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Row(
                  //   children: [
                  //     const Text('Parking Lot:'),
                  //     const SizedBox(width: 10),
                  //     Text(
                  //       slot.lotName,
                  //       style: TextStyle(
                  //         color: slot.status == ParkingStatus.available
                  //             ? AppColors
                  //                 .primaryLight // Use primary color for available slots
                  //             : AppColors.secondaryColor,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  //),
                  Row(
                    children: [
                      const Text('Slot:'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        slot.slotId,
                        style: TextStyle(
                          color: slot.status == ParkingStatus.available
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
                        slot.status == ParkingStatus.available
                            ? 'Available'
                            : 'Occupied',
                        style: TextStyle(
                          color: slot.status == ParkingStatus.available
                              ? AppColors
                                  .primaryLight // Use primary color for available slots
                              : AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  PrimaryElevatedButton(
                    onPressed: slot.status == ParkingStatus.available
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const BookSlotPage(),
                              ),
                            );
                          }
                        : null, // Disable button if not available
                    text: 'Book Slot',
                  ),
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
  final ParkingSlot slot;
  final VoidCallback onTap;

  const ParkingSpace({
    Key? key,
    required this.slot,
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
          color:
              slot.isOccupied ? AppColors.greyLight : AppColors.textLightblue,
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
                      slot.slotId,
                      style: TextStyle(
                        color: slot.isOccupied
                            ? AppColors.secondaryColor
                            : AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Icon(
                      slot.isOccupied ? Icons.lock : Icons.lock_open,
                      color: slot.isOccupied
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
                  slot.isOccupied ? 'Occupied' : 'Available',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: slot.isOccupied
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

class ParkingSlot {
 // final String lotName;
  final String slotId;
  final bool isOccupied;
  final ParkingStatus status;

  ParkingSlot({
   // required this.lotName,
    required this.slotId,
    required this.isOccupied,
    required this.status,
  });
}

class ParkingData {
  static final List<ParkingSlot> lotA = [
    ParkingSlot(
       // lotName: 'Lot A',
        slotId: '01',
        isOccupied: true,
        status: ParkingStatus.occupied),
    ParkingSlot(
       // lotName: 'Lot A',
        slotId: '02',
        isOccupied: false,
        status: ParkingStatus.available),
    ParkingSlot(
       
       // lotName: 'Lot A',
        slotId: '03',
        isOccupied: true,
        status: ParkingStatus.occupied),
    ParkingSlot(
       // lotName: 'Lot A',
        slotId: '04',
        isOccupied: false,
        status: ParkingStatus.available),
  ];

  static final List<ParkingSlot> lotB = [
    ParkingSlot(
        //lotName: 'Lot B',
        slotId: '05',
        isOccupied: false,
        status: ParkingStatus.available),
    ParkingSlot(
       // lotName: 'Lot B',
        slotId: '06',
        isOccupied: false,
        status: ParkingStatus.available),
    ParkingSlot(
        //lotName: 'Lot B',
        slotId: '07',
        isOccupied: true,
        status: ParkingStatus.occupied),
    ParkingSlot(
        //lotName: 'Lot B',
        slotId: '08',
        isOccupied: false,
        status: ParkingStatus.available),
  ];
}

enum ParkingStatus {
  available,
  occupied,
}
