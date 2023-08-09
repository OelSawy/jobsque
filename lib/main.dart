import 'package:flutter/material.dart';
import 'package:jobsque/core/colours.dart';
import 'package:jobsque/screens/home/items/profile/provider/profile_provider.dart';
import 'package:jobsque/screens/home/provider/home_provider.dart';
import 'package:jobsque/screens/job_details_and_application/provider/job_details_provider.dart';
import 'package:jobsque/screens/on_board/provider/on_board_provider.dart';
import 'package:jobsque/screens/splash/provider/splash_provider.dart';
import 'package:jobsque/screens/user_handling/create_account/provider/create_account_provider.dart';
import 'package:jobsque/screens/user_handling/login/provider/login_provider.dart';
import 'package:jobsque/screens/user_handling/reset_password/provider/reset_password_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sizer/sizer.dart';
import 'core/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
          providers: [
            ChangeNotifierProvider<SplashProvider>(
                create: (context) => SplashProvider()),
            ChangeNotifierProvider<OnBoardProvider>(
              create: (context) => OnBoardProvider(),
            ),
            ChangeNotifierProvider<CreateAccountProvider>(
              create: (context) => CreateAccountProvider(),
            ),
            ChangeNotifierProvider<LoginProvider>(
              create: (context) => LoginProvider(),
            ),
            ChangeNotifierProvider<ResetPasswordProvider>(
              create: (context) => ResetPasswordProvider(),
            ),
            ChangeNotifierProvider<HomeProvider>(
              create: (context) => HomeProvider()..init(),
            ),
            ChangeNotifierProvider<JobDetailsProvider>(
              create: (context) => JobDetailsProvider(),
            ),
            ChangeNotifierProvider<ProfileProvider>(
              create: (context) => ProfileProvider(),
            )
          ],
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: MaterialApp(
                title: "JOBSQUE",
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                theme: ThemeData().copyWith(
                  colorScheme: ThemeData().colorScheme.copyWith(
                        primary: AppColours.primary500,
                      ),
                )),
          ));
    });
  }
}
