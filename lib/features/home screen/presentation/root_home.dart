import 'package:fintrack/features/authentication/presentation/profile_screen.dart';
import 'package:fintrack/features/home%20screen/presentation/home_screen.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RootHomeScreen extends StatefulWidget {
  const RootHomeScreen({super.key});

  @override
  State<RootHomeScreen> createState() => _RootHomeScreenState();
}

class _RootHomeScreenState extends State<RootHomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeScreen(), // Index 0
      Center(child: Text("Wallet & Transactions".hardcoded)), // Index 1
      Center(child: Text("Statistics & Reports".hardcoded)), // Index 2
      Center(child: Text("Statistics & Reports".hardcoded)), // Index 3
      const ProfileScreen(), // Index 4
    ];
    return Scaffold(
      body: SafeArea(child: pages[_currentIndex]),
      backgroundColor: AppColors.kBackgroundColor,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: AppColors.kPrimaryColor.withOpacity(0.2),
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() => _currentIndex = index);
          },
          backgroundColor: AppColors.kBackgroundColor,
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home_rounded,
                color: _currentIndex == 0 ? AppColors.kPrimaryColor : null,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.account_balance_wallet,
                color: _currentIndex == 1 ? AppColors.kPrimaryColor : null,
              ),
              label: 'Wallet',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.add_circle_rounded,
                color: _currentIndex == 2 ? AppColors.kPrimaryColor : null,
              ),
              label: 'Add',
            ),
            NavigationDestination(
              icon: Icon(
                FontAwesomeIcons.chartSimple,
                color: _currentIndex == 3 ? AppColors.kPrimaryColor : null,
              ),
              label: 'Stats',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person,
                color: _currentIndex == 4 ? AppColors.kPrimaryColor : null,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
