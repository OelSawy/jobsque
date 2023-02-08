import 'package:flutter/material.dart';
import 'package:jobsque/screens/on_board/provider/on_board_provider.dart';
import 'package:jobsque/screens/splash/provider/splash_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider<SplashProvider>(
                create: (context) => SplashProvider()),
            ChangeNotifierProvider<OnBoardProvider>(
              create: (context) => OnBoardProvider(),
            )
          ],
          child: const MaterialApp(
            title: "JOBSQUE",
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            /* theme: ThemeData(
              textTheme: GoogleFonts.sourceSansProTextTheme(
                Theme.of(context).textTheme,
              ),
              brightness: Brightness.light,
              /* light theme settings */
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              /* dark theme settings */
            ),
            themeMode: ThemeMode.system, */
          )),
    );
  }
}
