import 'package:chat_application/src/features/friend_management/presentation/presenter/add_friend_viewmodel.dart';
import 'package:chat_application/src/features/friend_management/domain/model/user_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

late final StateNotifierProvider<AddFriendViewModel, UserInfo>
    addFriendProvider;
