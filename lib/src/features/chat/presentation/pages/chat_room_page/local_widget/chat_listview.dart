import 'dart:math';

import 'package:chat_application/src/features/chat/domain/model/chat.dart';
import 'package:chat_application/src/features/chat/domain/model/message.dart';
import 'package:chat_application/src/features/chat/presentation/presenter/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatListView extends ConsumerStatefulWidget {
  final String chatID;

  const ChatListView({
    super.key,
    required this.chatID,
  });

  @override
  ConsumerState<ChatListView> createState() => _ChatListViewState();
}

class _ChatListViewState extends ConsumerState<ChatListView> {
  late final ScrollController _scrollController;

  bool isEnd = true;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _scrollController.addListener(() {
      isEnd = _scrollController.offset ==
          _scrollController.position.maxScrollExtent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isEnd) {
          _initializeScrollPosition();
        }

        return StreamBuilder(
          stream: ref.read(chatProvider).getChats(widget.chatID),
          builder: (context, snapshot) {
            List<ChatData> datas = snapshot.data ?? [];

            if (isEnd && datas.isNotEmpty) {
              _initializeScrollPosition();
            }

            return SingleChildScrollView(
              controller: _scrollController,
              padding: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(context).bottom,
              ),
              child: Column(
                children: [
                  for (ChatData data in datas) _MesssageWithDate(data),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _initializeScrollPosition() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      isEnd = true;
    });
  }
}

class _MesssageWithDate extends StatelessWidget {
  final ChatData data;

  const _MesssageWithDate(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Date(data.date),
        for (Message message in data.message) _Message(message: message),
      ],
    );
  }
}

class _Date extends StatelessWidget {
  final String date;

  const _Date(this.date, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(date),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}

class _Message extends ConsumerWidget {
  final Message message;

  const _Message({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: ref.read(chatProvider).getUserNameSnapshot(message.uid),
      builder: (context, snapshot) {
        bool isMine = ref.read(chatProvider).isMyUid(message.uid);

        String data = snapshot.data ?? '';

        return Align(
          alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment:
                  isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(data),
                _ChatBubble(
                  message: message,
                  isMine: isMine,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final Message message;
  final bool isMine;

  const _ChatBubble({
    super.key,
    required this.message,
    required this.isMine,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: GestureDetector(
            onLongPressDown: isMine
                ? (details) =>
                    _showChatOptionMeun(details.globalPosition, context)
                : null,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  message.commnet,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ),
        ),
      ]..insert(
          isMine ? 0 : 1,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(message.time.substring(0, '00:00'.length)),
          ),
        ),
    );
  }

  void _showChatOptionMeun(Offset touchOffset, BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double left = _distance(touchOffset.dx, 0),
        right = _distance(touchOffset.dx, size.width);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(left, touchOffset.dy, right, 0),
      items: [
        const PopupMenuItem(
          child: Text(''),
        ),
      ],
    );
  }

  double _distance(double pos1, double pos2) {
    return sqrt(pow(pos1, 2) - pow(pos2, 2));
  }
}
