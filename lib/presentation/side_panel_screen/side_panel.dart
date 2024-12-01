import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islameet/data/models/chat_model.dart';
import 'package:islameet/presentation/main_page/main_page_cubit.dart';
import 'package:islameet/presentation/main_page/main_page_state.dart';
import 'package:islameet/presentation/side_panel_screen/chats_cubit.dart';
import 'package:islameet/presentation/side_panel_screen/chats_state.dart';
import 'package:islameet/presentation/welcome_page/auth_cubit.dart';

class SidePanel extends StatefulWidget {
  const SidePanel({
    super.key,
  });

  @override
  State<SidePanel> createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ChatsCubit>(context).fetchChats(
      BlocProvider.of<AuthCubit>(context).getId(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.8),
          ),
          width: MediaQuery.of(context).size.width * 0.3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      maxRadius: 25,
                      child: Icon(
                        Icons.pets,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Мой профиль',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(112, 21, 202, 1),
                        Color.fromRGBO(207, 98, 234, 1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFBF8733),
                                Color(0xFFBF8733),
                                Color(0xFFC2C17A),
                                Color(0xFFBF8733),
                                Color(0xFFB48148),
                                Color(0xFFD9B767),
                              ],
                              stops: [0, 0.09, 0.37, 0.64, 0.79, 1],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            maxRadius: 40,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.casino,
                              size: 55,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Находи новые мэтчи',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Начни свайпать, чтобы\nпознакомиться!',
                              style: TextStyle(
                                height: 1.1,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Сообщения',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: state.chats.length,
                    itemBuilder: (_, index) => ChatCard(
                      chatModel: state.chats[index],
                    ),
                    separatorBuilder: (_, __) => const SizedBox(
                      height: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ChatCard extends StatefulWidget {
  final ChatModel chatModel;
  const ChatCard({
    required this.chatModel,
    super.key,
  });

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  bool isSelected = false;
  Color color = Color.fromRGBO(0, 0, 0, 0.5);
  @override
  Widget build(BuildContext context) {
    return BlocListener<MainPageCubit, MainPageState>(
        listener: (context, state) {
          setState(() {
            isSelected =
                state.selectedChatModel.id.compareTo(widget.chatModel.id) == 0;
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(
                  () {
                    isSelected = true;
                  },
                );
                BlocProvider.of<MainPageCubit>(context)
                    .chatSelected(widget.chatModel);
              },
              //hoverColor: Colors.red,
              //focusColor: Colors.blue,
              splashColor: Color.fromRGBO(56, 36, 61, 0.8),
              //highlightColor: Colors.purple,
              child: Container(
                color: isSelected ? Color.fromRGBO(56, 36, 61, 0.8) : color,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        maxRadius: 38,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.chatModel.companionName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              widget.chatModel.lastMessageText,
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 18, right: 14),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: [
                              Text(
                                widget.chatModel.lastMessageTime,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
