import 'package:azkar_app/azkar/azhar_list_view.dart';
import 'package:azkar_app/azkar/cubit/azkar_cubit.dart';
import 'package:azkar_app/shard/components.dart';
import 'package:azkar_app/them/cubit.dart';
import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'azkar/cubit/azkar_state.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return          BlocProvider(
      create: (context) => AzkarCubit()..loadAzkarAndTsabeeh(),
      child: SafeArea(
            child: Scaffold(
               body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  Center(
                      child: Image(
                    image:  const AssetImage('assets/images/bismillah.png' ),
                    width: Adaptive.w(60),
                  )),
                  const SizedBox(
                    height: 30,
                  ),
                  Directionality(
                    // add this
                    textDirection: TextDirection.rtl, // set this property
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.read<AzkarCubit>().total()> 0 ? 'عدد التسبيحات في هذه الجلسه :': "هل سبحت اليوم ؟",
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),


                                  Visibility(
                                    visible:  context.read<AzkarCubit>().total()> 0 ,
                                    child: Text(
                                      '${context.read<AzkarCubit>().total()}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                    ),
                                  ),

                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/images/dua-hands.png',
                              color:  Theme.of(context).brightness == Brightness.light? Colors.black :Colors.white,
                              width: 50,
                              height: 50,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  homeItem(context, 'اذكار', const AzkarList()),


                           ListTile(
                           title: const Text('Dark Theme'),
                           contentPadding: const EdgeInsets.only(left: 16.0),
                           trailing: Transform.scale(
                             scale: 0.4,
                             child: DayNightSwitch(
                               value: Theme.of(context).brightness == Brightness.light,
                               onChanged: (val) {

                                  context.read<ThemCubit>().toggleThem();
                               },
                             ),
                           ),
                         )


                  // )

                ],
              ),
            ),
          ),
    );


  }

  Widget homeItem(context, text, screen) {
    return InkWell(
      onTap: () {

       navigateTo(context, screen);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              padding: EdgeInsets.zero,
              width: Adaptive.w(76),
              height: Adaptive.h(8),
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: HexColor('ffca85'),
              ),
            ),
            defaultText(
                text: text,
                fontsize: 33,
                textAlign: TextAlign.center,
                textColor: Colors.black)
          ],
        ),
      ),
    );
  }
}
