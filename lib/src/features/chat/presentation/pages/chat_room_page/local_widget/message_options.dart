import 'dart:math';

import 'package:flutter/material.dart';

PopupMenuItem _deleteMesageOption() {
  return PopupMenuItem(
    child: const Text('메시지 삭제'),
    onTap: () {},
  );
}

void showMessageOptionMenu(Offset touchOffset, BuildContext context) {
  double distance(double pos1, double pos2) {
    return sqrt(pow(pos1, 2) - pow(pos2, 2));
  }

  if (!context.mounted) return;

  Size size = MediaQuery.sizeOf(context);
  double left = distance(touchOffset.dx, 0),
      right = distance(touchOffset.dx, size.width);

  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(left, touchOffset.dy, right, 0),
    items: [_deleteMesageOption()],
  );
}
