import 'package:flutter/material.dart';

class SelectedCount extends StatelessWidget {
  const SelectedCount({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('선택된 친구 : 1명'),
      ),
    );
  }
}
