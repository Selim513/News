import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_sport_app/core/cubit/cubit.dart';
import 'package:news_sport_app/core/theme/theme.dart';
import 'package:news_sport_app/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("user");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const Splashscreen(),
      ),
    );
  }
}
