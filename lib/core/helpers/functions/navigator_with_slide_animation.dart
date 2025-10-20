import 'package:flutter/material.dart';

navigatorWithSlideAnimation(
  BuildContext context,
  Widget widget,
  Offset offset,
) {
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // top  Offset(0, -1),
        // bottom Offset(0, 1),
        // left Offset(-1, 0)
        // right Offset(1, 0)

        Animation<Offset> slideAnimation =
            Tween<Offset>(begin: offset, end: Offset.zero).animate(
              CurvedAnimation(parent: animation, curve: Curves.bounceInOut),
            );
        return SlideTransition(position: slideAnimation, child: child);
      },
    ),
  );
}

navigatorWithSlideAnimationPushReplacement(
  BuildContext context,
  Widget widget,
  Offset offset,
) {
  Navigator.of(context).pushReplacement(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // top  Offset(0, -1),
        // bottom Offset(0, 1),
        // left Offset(-1, 0)
        // right Offset(1, 0)

        Animation<Offset> slideAnimation =
            Tween<Offset>(begin: offset, end: Offset.zero).animate(
              CurvedAnimation(parent: animation, curve: Curves.bounceInOut),
            );
        return SlideTransition(position: slideAnimation, child: child);
      },
    ),
  );
}
