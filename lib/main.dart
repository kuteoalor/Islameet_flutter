import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islameet/presentation/chat_screen/chat_cubit.dart';
import 'package:islameet/presentation/main_page/main_page.dart';
import 'package:islameet/presentation/main_page/main_page_cubit.dart';
import 'package:islameet/presentation/side_panel_screen/chats_cubit.dart';
import 'package:islameet/presentation/welcome_page/auth_cubit.dart';
import 'package:islameet/presentation/welcome_page/welcome_page.dart';
import 'package:islameet/presentation/widgets/welcome_cards/account_creation/select_photo_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatCubit>(create: (_) => ChatCubit()),
        BlocProvider<ChatsCubit>(create: (_) => ChatsCubit()),
        BlocProvider<AuthCubit>(create: (_) => AuthCubit()),
        BlocProvider<MainPageCubit>(create: (_) => MainPageCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme: GoogleFonts.montserratTextTheme(),
          useMaterial3: true,
        ),
        home: const WelcomePage(),
        //home: const MainPage(),
      ),
    );
  }
}
