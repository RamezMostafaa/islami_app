import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami2/home/hadeth/hadeth.dart';
import 'package:islami2/home/quran/quran.dart';
import 'package:islami2/home/radio/radio.dart';
import 'package:islami2/home/sebha/sebha.dart';
import 'package:islami2/home/settings/settings.dart';
import 'package:islami2/my_them.dart';
import 'package:islami2/provider/app_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Stack(
      children: [
        provider.isDarkMode()
            ? Image.asset("assets/images/bg1.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill)
            : Image.asset("assets/images/bg3.png",
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.app_title,
                style: provider.isDarkMode()
                    ? Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: MyTheme.primaryLightColor)
                    : Theme.of(context).textTheme.titleMedium

                // Theme.of(context).textTheme.titleLarge,
                ),
          ),
          bottomNavigationBar: Theme(
            data:
                //       provider.isDarkMode()?
                // Theme.of(context).textTheme.titleLarge?.copyWith(
                // color: MyTheme.primaryLightColor):
                // Theme.of(context).textTheme.titleMediu

                Theme.of(context).copyWith(
                    canvasColor: provider.isDarkMode()
                        ? MyTheme.primaryDarkColor
                        : MyTheme.primaryLightColor),
            child: BottomNavigationBar(
              unselectedItemColor:
                  provider.isDarkMode() ? Colors.white : Colors.white,
              selectedItemColor: provider.isDarkMode()
                  ? MyTheme.yellowDarkColor
                  : MyTheme.blackColor,
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon:
                        ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                    label: AppLocalizations.of(context)!.hadeth),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),
          body: taps[selectedIndex],
        )
      ],
    );
  }

  List<Widget> taps = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTap(),
    SettingsTap(),
  ];
}
