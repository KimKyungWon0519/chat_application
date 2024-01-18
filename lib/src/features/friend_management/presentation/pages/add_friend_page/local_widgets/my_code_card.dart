import 'package:flutter/material.dart';

class MyCodeCard extends StatelessWidget {
  const MyCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      margin: EdgeInsets.zero,
      child: ListTile(
        title: Text('내 코드'),
        trailing: Text('AQERFD'),
      ),
    );
  }
}
