import 'package:flutter/material.dart';
import 'package:gerenciamento_de_estado/controllers/stream_notifier_imp.dart';
import 'package:gerenciamento_de_estado/main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterNotifier = StreamNotifier(0);

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("ValueNotifier")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Trocar tema do aplicativo usando ValueNotifier"),
            ListenableBuilder(
              listenable: themeController,
              builder: (context, child) {
                return Switch(
                  value: themeController.value,
                  onChanged: (value) {
                    themeController.toggleTheme();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
