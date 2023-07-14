import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

 import 'cubit/azkar_cubit.dart';
import '../shard/components.dart';
import '../shard/constants.dart';


class AzkarScreen extends StatelessWidget {
  int index = 0;
  String title = "";
  List<String> azkar = [];

  AzkarScreen({super.key, required this.index , required this.title});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AzkarCubit>();
   List<String>  azkar  = cubit.loadAzharListOfCategory(index);


    return
        Scaffold(
        appBar: defaultAppBar(text: title),
        body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                // to remove the effect of the inkwell
                hoverColor: this.index == 5 ? null : Colors.transparent,
                highlightColor: this.index == 5 ? null : Colors.transparent,
                focusColor: this.index == 5 ? null : Colors.transparent,
                splashFactory: this.index == 5 ? null : NoSplash.splashFactory,
                onTap: () {

                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Adaptive.w(5), vertical: Adaptive.h(3)),
                  padding: EdgeInsets.symmetric(
                      horizontal: Adaptive.w(3), vertical: Adaptive.h(2)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                          color: defaultColor,
                          offset: const Offset(3, 3),
                          blurRadius: 7)
                    ],
                  ),
                  child: Column(
                    children: [
                      defaultText(
                          text: azkar[index],
                          textColor: Colors.black,
                          fontsize: 22,
                          fontWeight: FontWeight.bold,
                          txtDirection: TextDirection.rtl),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(
                                  text:  azkar[index]))
                                  .then((value) {
                                Fluttertoast.showToast(
                                    msg: "تم النسخ", fontSize: 16.sp);
                              });
                            },
                            icon: const Icon(Icons.copy),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          if (this.index == 3)



                                  Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        context.read<AzkarCubit>().clearTimes(index);
                                      },
                                      icon: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: defaultColor,
                                          child: const Icon(Icons.recycling)),
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    defaultText(
                                      text: "${ context.watch<AzkarCubit>().azkarTimes[index]}",
                                      fontsize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context.read<AzkarCubit>().incrementAzkarTimes(index);
                                      },
                                      icon: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: defaultColor,
                                          child: const Icon(Icons.add)),
                                      color: Colors.white,
                                    ),
                                  ],
                                ),


                          SizedBox(
                            width: 12.w,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: Adaptive.h(1),
            ),
            itemCount:   azkar.length),
      );




  }
}
