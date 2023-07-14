 import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:azkar_app/shard/my_bloc_observer.dart';
import 'package:azkar_app/shard/components.dart';
import 'package:azkar_app/startup_screen.dart';
import 'package:azkar_app/them/bloc/them_bloc.dart';
import 'package:azkar_app/them/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'azkar/azhar_list_view.dart';
import 'azkar/cubit/azkar_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) => AzkarCubit()..loadAzkarAndTsabeeh()),

        BlocProvider(create: (BuildContext con) {
          return ThemBloc();
        }),
        BlocProvider(create: (BuildContext con) {
          return ThemCubit();
        }),
      ],
      child:

      ResponsiveSizer(
        builder: (p0, p1, p2) {
          return
            BlocBuilder<ThemCubit ,ThemeData>(
              builder: (BuildContext context,  ThemeData state ) {
                return

            MaterialApp(
            theme:state ,
            debugShowCheckedModeBanner: false,
            home: (AnimatedSplashScreen(
                splash: splash(),
                centered: true,
                splashIconSize: 900,
                nextScreen: const StartUpScreen())),
                );});
        },
      )
    );
  }
}
 Widget splash() {
   return Container(
     width: double.infinity,
     decoration: const BoxDecoration(
       gradient: LinearGradient(colors: [Colors.white, Colors.white]),
     ),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         const Image(
           image: AssetImage('assets/images/bismillah.png'),
           width: 360,
         ),
         defaultText(
             text: 'Muslim',
             fontsize: 53,
             textColor: Colors.white,
             fontWeight: FontWeight.bold,
             letterSpacing: 1.7)
       ],
     ),
   );
   //Image.asset();
 }
