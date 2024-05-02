import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami2/home/settings/language_bottom_sheet.dart';
import 'package:islami2/home/settings/theme_bottom_sheet.dart';
import 'package:islami2/my_them.dart';
import 'package:islami2/provider/app_provider.dart';
import 'package:provider/provider.dart';

class SettingsTap extends StatefulWidget {
  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.settings,
              style: provider.isDarkMode()
                  ? Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: MyTheme.primaryLightColor)
                  : Theme.of(context).textTheme.titleLarge),
          SizedBox(
            height: 15,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: provider.isDarkMode()
                ? Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white)
                : Theme.of(context).textTheme.titleMedium,
          ),
          Icon(
            Icons.language,
            color: MyTheme.primaryLightColor,
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              decoration: BoxDecoration(
                color: MyTheme.primaryLightColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        provider.appLanguage == "en"
                            ? AppLocalizations.of(context)!.english
                            : AppLocalizations.of(context)!.arabic,
                        style: Theme.of(context).textTheme.titleSmall),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 35,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(AppLocalizations.of(context)!.theme,
              style: provider.isDarkMode()
                  ? Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white)
                  : Theme.of(context).textTheme.titleMedium),
          Icon(
            Icons.brightness_medium_sharp,
            color: MyTheme.primaryLightColor,
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              showThemBottomSheet();
            },
            child: Container(
              decoration: BoxDecoration(
                color: MyTheme.primaryLightColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        provider.isDarkMode()
                            ? AppLocalizations.of(context)!.darkmood
                            : AppLocalizations.of(context)!.lightmood,
                        style: Theme.of(context).textTheme.titleSmall),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 35,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottom(),
    );
  }

  void showThemBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ThemeBottom(),
    );
  }
}

// late List<String>sebha =[AppLocalizations.of(context)!.sobhanallah,
//   AppLocalizations.of(context)!.elhamdullah,AppLocalizations.of(context)!.estghfarallah,
//   AppLocalizations.of(context)!.allahakber,AppLocalizations.of(context)!.lailahaillallah];
// int counter=0 ;
//
//
// counter++;
//
// if (counter > 33) {
// counter = 0;
// value++;
// if (value == sebha.length) {
// value = 0;
// }
// }
