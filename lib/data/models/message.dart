// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:typed_data';

class Message {
  final String text;
  final String time;
  final MessageType type;

  const Message({
    required this.text,
    required this.time,
    required this.type,
  });

  Message copyWith({
    String? text,
    String? time,
    MessageType? type,
  }) {
    return Message(
      text: text ?? this.text,
      time: time ?? this.time,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap({required int roomId, required int senderId}) {
    return <String, dynamic>{
      'text': text,
      'time': time,
      'roomId': roomId,
      'senderId': senderId,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      text: map['text'] as String,
      time: map['time'] as String,
      type: MessageType.source,
    );
  }

  Uint8List toJson({
    required int roomId,
    required int senderId,
  }) =>
      utf8.encode(json.encode(
        toMap(roomId: roomId, senderId: senderId),
      ));

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Message(text: $text, time: $time, type: $type)';

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.text == text && other.time == time && other.type == type;
  }

  @override
  int get hashCode => text.hashCode ^ time.hashCode ^ type.hashCode;
}

enum MessageType { source, reply }

const messages = [
  Message(text: 'Hello', time: '11:32', type: MessageType.source),
  Message(text: 'Hello', time: '11:32', type: MessageType.reply),
  Message(text: 'Howwww aare u?', time: '11:33', type: MessageType.source),
  Message(text: 'Fineeeeee', time: '11:34', type: MessageType.reply),
  Message(text: 'and u???', time: '11:34', type: MessageType.reply),
  Message(text: 'Me2)', time: '11:34', type: MessageType.source),
  Message(text: 'Very well', time: '11:35', type: MessageType.reply),
  Message(text: 'Very well', time: '11:35', type: MessageType.reply),
  Message(text: 'Very well', time: '11:35', type: MessageType.reply),
  Message(text: 'Very well', time: '11:35', type: MessageType.reply),
  Message(text: 'Very well', time: '11:35', type: MessageType.reply),
  Message(text: 'Very well', time: '11:35', type: MessageType.reply),
  Message(text: 'Very well', time: '11:35', type: MessageType.reply),
  Message(text: 'Very well', time: '11:35', type: MessageType.reply),
  Message(text: 'Very well', time: '11:35', type: MessageType.reply),
];
