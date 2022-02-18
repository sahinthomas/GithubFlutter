
import 'package:flutter/material.dart';


import 'package:github/Utils/AppPalette.dart';
class Dialogs {
  static Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,

        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.circular(15)
                  ),
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),



                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Wait",
                          style: TextStyle(color: AppPalette.secondaryColor),
                        )
                      ]),
                    )
                  ]));
        });
  }
}
