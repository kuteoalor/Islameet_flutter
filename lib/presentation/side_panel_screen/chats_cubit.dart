import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islameet/data/models/chat_model.dart';
import 'package:islameet/presentation/side_panel_screen/chats_state.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsState(chats: []));

  void fetchChats(int senderId) async {
    //TODO: fetch chats
    // final chats = [
    //   ChatModel(
    //     id: 1,
    //     companionId: 1,
    //     companionName: 'Michael',
    //     lastMessageText: 'Very well',
    //   ),
    //   ChatModel(
    //     id: 2,
    //     companionId: 2,
    //     companionName: 'Lolita',
    //     lastMessageText: 'Oh, Gumbold..',
    //   ),
    // ];

    final queryParams = {'id': '$senderId'};
    final response = await http.get(
      Uri.http('localhost:6100', '/chat', queryParams),
      headers: {
        'content-type': 'application/json; charset=utf-8',
      },
    );
    final body = json.decode(response.body) as Map<String, dynamic>;
    final chatsContents = body['data'] as List<dynamic>;
    print(chatsContents[0]);

    if (chatsContents.isEmpty) {
      emit(ChatsState(chats: []));
    } else {
      final chats = chatsContents.map((content) {
        final user1Id = content['user1Id'] as int;
        final user2Id = content['user2Id'] as int;
        return ChatModel(
            companionName: content['companionName'],
            lastMessageText: content['lastMessage'] ?? '',
            id: content['id'],
            companionId: user1Id == senderId ? user2Id : user1Id);
      }).toList();
      emit(ChatsState(chats: chats));
    }
  }
}
