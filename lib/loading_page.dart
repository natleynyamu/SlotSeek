import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'onboarding.dart'; // Import your onboarding screen file

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background picture
          Image.asset(
            'assets/images/luxurious-car.jpg', 
            fit: BoxFit.cover,
          ),
          // Loading indicator centered on the screen
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // Text slightly below the center of the screen
                SizedBox(
                    height: 300), // Adjust the height for vertical positioning
                Text(
                  'Slot Seek',
                  style:
                      TextStyle(fontSize: 64, color: AppColors.textLightblue),
                ),
                SizedBox(height: 10), // Add space between the texts
                Text(
                  'Your Slot, Found Fast',
                  style:
                      TextStyle(fontSize: 20, color: AppColors.textLightblue),
                ),
              ],
            ),
          ),
          // Loading indicator
          Positioned(
            bottom: 30, // Adjust bottom position
            right: 20, // Adjust right position
            child: Row(
              children: const [
                Text(
                  'Loading', // Initial text
                  style:
                      TextStyle(fontSize: 32, color: AppColors.textLightblue),
                ),
                SizedBox(
                    width: 5), // Add some spacing between the text and dots
                // Three dots animation
                LoadingDots(),
              ],
            ),
          ),
          // Show the onboarding screen when loading is complete
          FutureBuilder(
            future: Future.delayed(const Duration(seconds: 2)), // Simulate loading delay
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // Loading is complete, show the onboarding screen
                return const OnboardingScreen(); // Replace OnboardingScreen() with your actual onboarding screen widget
              } else {
                // Show nothing while loading
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}

class LoadingDots extends StatefulWidget {
  const LoadingDots({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoadingDotsState createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        3,
        (index) {
          return Padding(
            padding: EdgeInsets.only(
                right: index != 2 ? 8 : 0), // Increase padding for bigger dots
            child: FadeTransition(
              opacity: _controller.drive(
                CurveTween(
                  curve: Interval(
                    (index + 1) / 3 * 2 / 3,
                    1.0,
                    curve: Curves.easeInOut,
                  ),
                ),
              ),
              child: const Text('.',
                  style: TextStyle(
                      color: AppColors.textLightblue,
                      fontSize: 24)), // Increase font size for bigger dots
            ),
          );
        },
      ),
    );
  }
}
