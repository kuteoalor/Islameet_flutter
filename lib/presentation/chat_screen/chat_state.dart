import 'package:islameet/data/models/message.dart';

class ChatState {
  final List<Message> messages;
  final int userId;

  ChatState({required this.messages, this.userId = -22});
}
