import 'package:flutter/material.dart';
import 'package:flutter_likeu/utils/app_colors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_likeu/views/main/main_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('users');
  WidgetsFlutterBinding.ensureInitialized(); // 1번코드
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Like You',
      theme: ThemeData(
          textTheme: const TextTheme(),
          scaffoldBackgroundColor: AppColors.backGroundColor,
          appBarTheme: const AppBarTheme(color: AppColors.primaryColor)),
      home: const MainView(),
    );
  }
}
