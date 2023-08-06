import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: TextButton(
          onPressed: () => _onShowButtonPressed(context),
          child: const Text('Show dialog'),
        ),
      ),
    );
  }

  void _onShowButtonPressed(BuildContext context) async {
    // Simulates an asynchronous operation, like a network call.
    await Future.value();

    // Lint annotates the following line with `use_build_context_synchronously`.
    if (!context.mounted) return;
    showDialog(
      context: context,
      builder: (context) => const SimpleDialog(),
    );

    // Simulates another asynchronous operation.
    await Future.value();

    // No lint error is added on the following line.
    if (context.mounted) {
      showDialog(
        context: context,
        builder: (context) => const SimpleDialog(),
      );
    }
  }
}
