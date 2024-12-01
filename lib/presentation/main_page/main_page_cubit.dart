import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islameet/data/models/chat_model.dart';
import 'package:islameet/presentation/main_page/main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit()
      : super(MainPageState(
            isPicking: true, selectedChatModel: ChatModel.empty()));

  void chatSelected(ChatModel chatModel) async {
    emit(MainPageState(isPicking: false, selectedChatModel: ChatModel.empty()));
    //await Future.delayed(const Duration(milliseconds: 200));
    emit(MainPageState(isPicking: false, selectedChatModel: chatModel));
  }

  void picksSelected() {
    emit(MainPageState(isPicking: true, selectedChatModel: ChatModel.empty()));
  }
}
