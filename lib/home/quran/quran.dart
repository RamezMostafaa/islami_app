import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami2/home/quran/quran_item.dart';
import 'package:islami2/my_them.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class QuranTap extends StatelessWidget {
  List<String> suraNAmes = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Column(
      children: [
        Center(child: Image.asset("assets/images/quran.png")),
        Divider(
          color: provider.isDarkMode()
              ? MyTheme.yellowDarkColor
              : MyTheme.primaryLightColor,
          thickness: 3,
        ),
        Text(AppLocalizations.of(context)!.sura_name,
            style: provider.isDarkMode()
                ? Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white)
                : Theme.of(context).textTheme.titleMedium
            // MyTheme.yellowDarkColor:
            // MyTheme.primaryLightColor,
            //
            ),
        Divider(
          color: provider.isDarkMode()
              ? MyTheme.yellowDarkColor
              : MyTheme.primaryLightColor,
          thickness: 3,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                color: provider.isDarkMode()
                    ? MyTheme.yellowDarkColor
                    : MyTheme.primaryLightColor,
                thickness: 2,
              );
            },
            itemBuilder: (context, index) {
              return QuranItem(
                name: suraNAmes[index],
                index: index,
              );
            },
            itemCount: suraNAmes.length,
          ),
        )
      ],
    );
  }
}
