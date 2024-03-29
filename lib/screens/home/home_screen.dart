import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/colours.dart';
import 'package:jobsque/services/messaging_services.dart';
import 'package:jobsque/screens/home/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _messagingService = MessagingService();

  @override
  void initState() {
    super.initState();
    _messagingService.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //! home body
      body: SafeArea(child: context.watch<HomeProvider>().chosenPage()),
      //! navigation bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 20.sp,
        selectedFontSize: 9.5.sp,
        unselectedFontSize: 9.5.sp,
        selectedIconTheme: IconThemeData(color: AppColours.primary500),
        selectedItemColor: AppColours.primary500,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedIconTheme: IconThemeData(color: AppColours.neutral400),
        unselectedItemColor: AppColours.neutral400,
        enableFeedback: false,
        backgroundColor: Colors.white,
        currentIndex: context.watch<HomeProvider>().state.navigationIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Iconsax.home4),
              activeIcon: Icon(Iconsax.home_15),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.message4),
              activeIcon: Icon(Iconsax.message5),
              label: "Messages"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.briefcase4),
              activeIcon: Icon(Iconsax.briefcase5),
              label: "Applied"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.archive_minus4),
              activeIcon: Icon(Iconsax.archive_15),
              label: "Saved"),
          BottomNavigationBarItem(
              icon: Icon(Iconsax.frame_1),
              activeIcon: Icon(Iconsax.frame5),
              label: "Profile")
        ],
        onTap: (value) {
          setState(() {
            context.read<HomeProvider>().onNavigationTap(value);
          });
        },
      ),
    );
  }
}
