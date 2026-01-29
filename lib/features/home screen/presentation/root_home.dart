import 'package:fintrack/features/authentication/presentation/profile_screen.dart';
import 'package:fintrack/features/home%20screen/presentation/home_screen.dart';
import 'package:fintrack/routing/app_route_enum.dart';
import 'package:fintrack/theming/app_colors.dart';
import 'package:fintrack/utils/get_hardcode.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

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
      const ProfileScreen(), // Index 3
    ];
    return Scaffold(
      floatingActionButtonLocation: const CustomFabLocation(20),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(AppRoutes.addTransaction.path),
        foregroundColor: AppColors.kTitleColor,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      body: SafeArea(child: pages[_currentIndex]),
      backgroundColor: AppColors.kBackgroundColor,
      bottomNavigationBar: FABBottomAppBar(
        backgroundColor: AppColors.kBackgroundColor,
        onTabSelected: (index) {
          setState(() => _currentIndex = index);
        },
        color: AppColors.kSubtitleColor,
        selectedColor: AppColors.kPrimaryColor,
        items: [
          FABBottomAppBarItem(
            text: 'Home',
            iconData: Icons.home_rounded,
          ),
          FABBottomAppBarItem(
            text: 'Wallet',
            iconData: Icons.account_balance_wallet,
          ),
          FABBottomAppBarItem(
            text: 'Stats',
            iconData: FontAwesomeIcons.chartSimple,
          ),
          FABBottomAppBarItem(
            text: 'Profile',
            iconData: Icons.person,
          ),
        ],
      ),
    );
  }
}

class FABBottomAppBarItem {
  FABBottomAppBarItem({required this.iconData, required this.text});
  IconData iconData;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    super.key,
    required this.items,
    this.centerItemText,
    this.height = 60.0,
    this.iconSize = 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    required this.onTabSelected,
  }) {
    assert(items.length == 2 || items.length == 4);
  }
  final List<FABBottomAppBarItem> items;
  final String? centerItemText;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      color: widget.backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: widget.iconSize),
          Text(
            widget.centerItemText ?? '',
            style: TextStyle(color: widget.color),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color? color = _selectedIndex == index
        ? widget.selectedColor
        : widget.color;
    return Expanded(
      child: InkWell(
        onTap: () => onPressed(index),
        borderRadius: BorderRadius.circular(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(item.iconData, color: color, size: widget.iconSize),
            Text(
              item.text,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomFabLocation extends FloatingActionButtonLocation {
  final double offsetY;

  const CustomFabLocation([this.offsetY = 0]);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // 1. Calculate X (Centered Horizontally)
    final double fabX =
        (scaffoldGeometry.scaffoldSize.width -
            scaffoldGeometry.floatingActionButtonSize.width) /
        2.0;

    // 2. Calculate Y
    // contentBottom is the Y-coordinate where the body ends and the BottomAppBar begins.
    // We subtract half the FAB height to vertically center it on that line.
    final double standardY =
        scaffoldGeometry.contentBottom -
        (scaffoldGeometry.floatingActionButtonSize.height / 2.0);

    // 3. Add custom offset (positive pushes it down, negative pulls it up)
    return Offset(fabX, standardY + offsetY);
  }
}
