import 'package:gerenciamento_de_estado/builders/stream_notifier_builder.dart';
import 'package:gerenciamento_de_estado/controllers/stream_notifier_imp.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_de_estado/presention/controllers/theme_controller.dart';

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
          theme:
              themeController.isDarkTheme
                  ? ThemeData.dark()
                  : ThemeData.light(),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterNotifier = StreamNotifier(0);

  @override
  void initState() {
    themeController.addListener(callback);
    super.initState();
  }

  void callback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("ChangeNotifier")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Trocar tema do aplicativo"),
            Switch(
              value: themeController.isDarkTheme,
              onChanged: (value) {
                themeController.toggleTheme();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    themeController.removeListener(callback);
    super.dispose();
  }
}
