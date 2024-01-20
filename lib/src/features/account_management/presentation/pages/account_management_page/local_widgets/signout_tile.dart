import 'package:chat_application/src/core/widgets/setting_tile.dart';
import 'package:flutter/material.dart';

class SignoutTile extends StatelessWidget {
  const SignoutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      name: '로그아웃',
      onTap: () {
        // TODO: 로그아웃 기능 추가
      },
    );
  }
}
