import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
 import 'package:we_slide/we_slide.dart';

import 'constants.dart';

void navigateTo(context, nextPage) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => nextPage,
      ),
    );

Widget defaultText(
        {required String text,
        double? fontsize,
        double? letterSpacing,
        var txtDirection,
        FontWeight? fontWeight,
        isUpperCase = false,
        textColor,
        double? textHeight,
        linesMax,
        TextOverflow? textOverflow,
        FontStyle? fontStyle,
        TextStyle? hintStyle,
        TextAlign? textAlign}) =>
    Text(
      isUpperCase ? text.toUpperCase() : text,
      textDirection: txtDirection,
      maxLines: linesMax,
      overflow: textOverflow,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fontsize,
          color: textColor,
          height: textHeight,
          fontStyle: fontStyle,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing),
    );

Widget myDivider() => Container(
      width: double.infinity,
      color: Colors.grey,
      height: 1,
    );

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
            decoration:   BoxDecoration(
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

AppBar defaultAppBar(
        {required String text,
        double fontSize = 30,
        List<Widget>? actions,
        Widget? leading}) =>
    AppBar(
      title: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
      actions: actions,
      centerTitle: true,
      leading: leading,
    );

Future awesomeDialog(context, title, text,
        {dialogType = DialogType.question}) =>
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      dialogType: dialogType,
      isDense: true,
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      dialogBackgroundColor: HexColor('22211f'),
      borderSide: const BorderSide(color: Colors.black, width: 4),
      width: 90.w,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
                child: defaultText(
                    text: title,
                    fontsize: 36,
                    textColor: Colors.white,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 1.h,
            ),
            defaultText(text: 'التفسير', fontsize: 24, textColor: Colors.white),
            myDivider(),
            defaultText(
                text: text,
                fontsize: 20,
                txtDirection: TextDirection.rtl,
                textColor: Colors.white),
          ],
        ),
      ),
    ).show();

AwesomeDialog onScreenOpen(context) => AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.scale,
      dialogBackgroundColor: HexColor('22211f'),
      title: 'اضغط للتفسير',
      titleTextStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Tajawal'),
      btnOkText: 'حسنا',
      btnOk: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: defaultColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: defaultText(text: 'حسنا', fontsize: 20, textColor: Colors.white),
      ),
    )..show();




Future<bool?> defaultFlutterToast({
  required String msg,
  Color textColor = Colors.white,
  Color backgroundColor = Colors.red,
  Toast toastLength = Toast.LENGTH_LONG,
}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toastLength,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: 16.0);



