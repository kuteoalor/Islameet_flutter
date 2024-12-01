import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islameet/presentation/chat_screen/chat_cubit.dart';

class ChatInputField extends StatelessWidget {
  ChatInputField({
    super.key,
    required this.scrollController,
    required this.senderId,
    required this.chatId,
  });
  final controller = TextEditingController();
  final ScrollController scrollController;
  final int senderId;
  final int chatId;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 5),
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            keyboardType: TextInputType.multiline,
            controller: controller,
            //maxLines: 5,
            //minLines: 1,
            onFieldSubmitted: (value) {
              if (controller.text != '') {
                BlocProvider.of<ChatCubit>(context)
                    .sendMessage(value, chatId, senderId);
              }
              controller.text = '';
              scrollController.animateTo(
                scrollController.position.maxScrollExtent * 2.5,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
              );
            },
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Type a message',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.attach_file),
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.emoji_emotions_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mic_none_outlined),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
