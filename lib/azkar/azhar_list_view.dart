import 'package:azkar_app/azkar/azkar_screen.dart';
import 'package:azkar_app/shard/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
 import 'package:responsive_sizer/responsive_sizer.dart';

import 'cubit/azkar_cubit.dart';
import 'cubit/azkar_state.dart';
import '../shard/constants.dart';

 
class AzkarList extends StatefulWidget {
  const AzkarList({super.key});

  @override
  State<AzkarList> createState() => _AzkarListState();
}

class _AzkarListState extends State<AzkarList> {
  @override
  Widget build(BuildContext context) {
    return    SafeArea(
      child: Scaffold(
         body:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 45,),
            Center(
                child: Image(
                  image: const AssetImage('assets/images/bismillah.png'),
                  width: Adaptive.w(60),
                )),
            Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Adaptive.w(3.2), vertical: Adaptive.w(3.2)),
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildAzkarItem(azkarList[index], index, context),
                      separatorBuilder: (context, index) => SizedBox(
                        width: Adaptive.w(4),
                      ),
                      itemCount: azkarList.length),
                )),
          ],
        ),
      ),
    );

  }

  Widget buildAzkarItem(azkarList, index, context) => InkWell(
        onTap: () {
          navigateTo(context, AzkarScreen(index: index , title:  azkarList.text,));
        },
        child: Container(
          decoration:const BoxDecoration(
            borderRadius:  BorderRadius.all(Radius.circular(20)),

          ),
          margin: const EdgeInsets.only(bottom: 15),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),

                  child: Image(
                    image: AssetImage(azkarList.img),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: Adaptive.h(13),
                  )),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.7),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                   ),
                  width: double.infinity,
                  child: defaultText(
                      text: azkarList.text,
                      textColor: Colors.white,
                      fontsize: 17,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      );
}
