// import "package:another_flutter_splash_screen.dart";
import 'package:flutter/material.dart';
import 'package:islami2/home/home_screen.dart';
import 'package:islami2/home/quran/sura_details.dart';
import 'package:islami2/my_them.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami2/provider/app_provider.dart';
import 'package:provider/provider.dart';

import 'home/splash.dart';

// import 'dart:async';
void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routename,
      routes: {
        // SplashScreen.routename: (context) =>  SplashScreen(),
        HomeScreen.routename: (context) => HomeScreen(),
        SuraDetails.routeName: (context) => SuraDetails(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: MyTheme.lightMode,
      darkTheme: MyTheme.lightMode,
      themeMode: provider.appTheme,
      locale: Locale(provider.appLanguage),
    );
  }
}
// class SplashScreen extends StatefulWidget {
//   static const String routename = "SplashScreen";
//
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _splashScreenState();
// }
//
// class _splashScreenState extends State<SplashScreen> {
//   @override
//   void iniState(){
//     super.initState();
//     Timer (
//       Duration(
//         seconds: 3),(){
//         Navigator.push(context, MaterialPageRoute(
//             builder: (context)=>HomeScreen()),
//     );
//     } );
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Stack( fit: StackFit.expand,
//         children: [
//           Container(child:
//           Image.asset("assets/images/Group 8.png")),
//
//         ],
//       ),
//
//     );
//   }
// }
//
