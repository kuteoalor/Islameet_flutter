import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islameet/data/models/message.dart';
import 'package:islameet/presentation/chat_screen/chat_state.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/html.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

const wsUrl = 'ws://127.0.0.1:6100/connect';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState(messages: []));
  late final WebSocketChannel channel;

  void connect(int senderId) async {
    print(1);

    print(2);
    emit(ChatState(messages: state.messages, userId: senderId));
    print(3);
    channel = WebSocketChannel.connect(Uri.parse(wsUrl));
    print(4);
    await channel.ready;
    print(5);
    final handshake = utf8.encode(
      json.encode({'handshake': senderId}),
    );
    print(6);
    channel.sink.add(handshake);
    print(7);
    channel.stream.listen(recieveMessage);
    print(8);
  }

  void recieveMessage(dynamic message) {
    print('RECIEVED');
    final data = json.decode(utf8.decode(message));
    final text = data['text'] as String;
    final time = data['time'] as String;
    final msg = Message(text: text, time: time, type: MessageType.source);
    final messages = List<Message>.from(state.messages);
    messages.add(msg);
    emit(ChatState(messages: messages, userId: state.userId));
  }

  void fetchMessages(int id) async {
    //fetch based on companion's id
    emit(ChatState(messages: [], userId: state.userId));
    //emit(ChatState(messages: messages, userId: state.userId));
  }

  void sendMessage(
    String text,
    int roomId,
    int senderId,
  ) {
    final message = Message(
      text: text,
      time: '${DateTime.now().hour}:${DateTime.now().minute}',
      type: MessageType.reply,
    );
    final messages = List<Message>.from(state.messages);
    messages.add(message);

    channel.sink.add(message.toJson(roomId: roomId, senderId: senderId));
    emit(ChatState(messages: messages, userId: state.userId));
    //put message in DB
  }
}
