class ChatModel {
  final int id;
  final int companionId;
  final String companionName;
  final String lastMessageText;
  final String lastMessageTime;
  //final String companionAvatarPath;

  ChatModel({
    required this.companionName,
    required this.lastMessageText,
    required this.id,
    required this.companionId,
    this.lastMessageTime = 'Вчера',
  });

  factory ChatModel.empty() {
    return ChatModel(
        companionName: '', lastMessageText: '', id: -1, companionId: -11);
  }
}
