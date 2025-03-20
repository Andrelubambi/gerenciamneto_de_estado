import 'package:gerenciamento_de_estado/builders/stream_notifier_builder.dart';
import 'package:gerenciamento_de_estado/controllers/stream_notifier_imp.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_de_estado/presention/controllers/theme_controller.dart';
import 'package:gerenciamento_de_estado/presention/pages/my_home_page.dart';

void main() => runApp(const MyApp());

final themeController = ThemeController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeController.value ? ThemeData.dark() : ThemeData.light(),
          home: const MyHomePage(),
        );
      },
    );
  }
}
