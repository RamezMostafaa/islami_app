import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami2/my_them.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

// class SebhaTap extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//           children:
//       [
//         Image.asset("assets/images/headofsebha.png"),
//         Image.asset("assets/images/sebha.png"),
//         SizedBox(
//           height: 20,
//         ),
//         Text(AppLocalizations.of(context)!.tasbe7,
//             style: TextStyle(fontSize: 28)),
//         Container(
//           decoration: BoxDecoration(
//             color: MyTheme.primaryLightColor,
//             borderRadius: BorderRadius.circular(18),
//           ),
//             child: Row(f
//               children: [
//                 Text(AppLocalizations.of(context)!.sobhanallah,
//                     style: Theme.of(context).textTheme.titleSmall,
//                 ),
//
//               ],
//             ),
//           ),
//         ]
//
//       ),
//     );
//   }
// }
class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTap> {
  int index = 0;

  late List<String> sebha = [
    AppLocalizations.of(context)!.sobhanallah,
    AppLocalizations.of(context)!.sobhanallah,
    AppLocalizations.of(context)!.elhamdullah,
    AppLocalizations.of(context)!.estghfarallah,
    AppLocalizations.of(context)!.allahakber,
    AppLocalizations.of(context)!.lailahaillallah,
    AppLocalizations.of(context)!.sobhanallah,
  ];
  int counter = 0;

  double angle = 0.0;

  // void add (){

  // value += 1 ;
  //     if (value == 33 ){
  //       text = AppLocalizations.of(context)!.elhamdullah;
  //   }
  //     else if (value == 33) {
  //       text = AppLocalizations.of(context)!.estghfarallah;
  //     }else if (value == 33){
  //       text =AppLocalizations.of(context)!.allahakber;
  //     }else if (value == 33){
  //       text =AppLocalizations.of(context)!.lailahaillallah ;
  // }

  // }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return Column(children: [
      Container(
          width: 50,
          margin: EdgeInsets.only(
            left: 70,
          ),
          child: Image.asset("assets/images/headofsebha.png")),
      Center(
          child: InkWell(
              onTap: () {
                angle += (3.7 * 3.141592653589793) / 180;
                setState(() {
                  counter++;
                  if (counter > 33) {
                    counter = 0;
                    index++;
                    if (index == sebha.length) {
                      index = 0;
                    }
                  }
                });
                // add();
              },
              child: Transform.rotate(
                  angle: angle,
                  child: Container(
                      margin: EdgeInsets.only(top: 0.2),
                      child: Image.asset("assets/images/sebha.png"))))),
      SizedBox(
        height: 45,
      ),
      Text(AppLocalizations.of(context)!.tasbe7,
          style: provider.isDarkMode()
              ? Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white)
              : Theme.of(context).textTheme.titleLarge
          // MyTheme.yellowDarkColor:
          ),
      SizedBox(
        height: 40,
      ),
      Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
          color: provider.isDarkMode()
              ? MyTheme.primaryDarkColor
              : MyTheme.primaryLightColor,
        ),
        child: Center(
            child: Text(
          '$counter',
          style: provider.isDarkMode()
              ? Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white)
              : Theme.of(context).textTheme.titleLarge,
        )),
      ),
      SizedBox(
        height: 40,
      ),
      Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
            child: Text("${sebha[index]}",
                style: provider.isDarkMode()
                    ? Theme.of(context).textTheme.titleMedium
                    : Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Colors.white))),
      ),
    ]);
  }
}
