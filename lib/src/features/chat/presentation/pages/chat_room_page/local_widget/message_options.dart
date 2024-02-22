import 'dart:math';

import 'package:chat_application/src/features/chat/domain/model/message.dart';
import 'package:chat_application/src/features/chat/presentation/presenter/chat_viewmodel.dart';
import 'package:flutter/material.dart';

PopupMenuItem _deleteMesageOption(Message message, ChatViewModel viewModel) {
  return PopupMenuItem(
    child: const Text('메시지 삭제'),
    onTap: () {
      viewModel.deleteMessage(message);
    },
  );
}

void showMessageOptionMenu(
  Message message, {
  required Offset touchOffset,
  required BuildContext context,
  required ChatViewModel viewModel,
}) {
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
    items: [_deleteMesageOption(message, viewModel)],
  );
}
