import 'package:flutter/material.dart';

navTo(Widget widget, BuildContext context, {bool popCurrent = false, Function? onPop}) {
  var push = popCurrent ? Navigator.pushReplacement : Navigator.push;
  push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  ).then((_) {
    if (onPop != null) {
      onPop();
    }
  });
}

navBack(BuildContext context) {
  Navigator.pop(context);
}
