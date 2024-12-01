import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islameet/presentation/chat_screen/chat_screen.dart';
import 'package:islameet/presentation/main_page/main_page_cubit.dart';
import 'package:islameet/presentation/main_page/main_page_state.dart';
import 'package:islameet/presentation/pick_screen/pick_screen.dart';
import 'package:islameet/presentation/side_panel_screen/side_panel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    //fetch all user's chats (chatModel: id, companionId) это надо делать в файле боковой панели
    //connect socket??
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: Image(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          BlocBuilder<MainPageCubit, MainPageState>(
            builder: (context, state) {
              return Row(
                children: [
                  const SidePanel(),
                  state.isPicking
                      ? const PickScreen()
                      : ChatScreen(
                          chatModel: state.selectedChatModel,
                        ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
