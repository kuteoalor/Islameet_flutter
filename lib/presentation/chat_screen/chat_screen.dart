import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islameet/data/models/chat_model.dart';
import 'package:islameet/data/models/message.dart';
import 'package:islameet/presentation/chat_screen/chat_cubit.dart';
import 'package:islameet/presentation/chat_screen/chat_state.dart';
import 'package:islameet/presentation/welcome_page/auth_cubit.dart';
import 'package:islameet/presentation/widgets/chat_input_field.dart';
import 'package:islameet/presentation/widgets/message_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatScreen extends StatefulWidget {
  final ChatModel chatModel; //shouldn't be heres
  const ChatScreen({super.key, required this.chatModel});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChatCubit>(context).connect(
      BlocProvider.of<AuthCubit>(context).getId(),
    );
    // BlocProvider.of<ChatCubit>(context)
    //     .fetchMessages(widget.chatModel.companionId);
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ChatCubit>(context).fetchMessages(
        widget.chatModel.companionId); //temporary solution i hope
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leadingWidth: 130,
          leading: const Padding(
            padding: EdgeInsets.only(
              left: 10,
              top: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Michael',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  'был(а) в 13:40',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_horiz_outlined),
            ),
          ],
        ),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                    child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.messages.length,
                  controller: controller,
                  //reverse: true,
                  itemBuilder: (_, index) {
                    return MessageCard(
                      text: state.messages[index].text,
                      time: state.messages[index].time,
                      type: state.messages[index].type,
                    );
                  },
                )),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ChatInputField(
                    scrollController: controller,
                    chatId: widget.chatModel.id,
                    senderId: state.userId, //get it from somewhere
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
