import 'package:flutter/material.dart';

import 'flavor_config.dart';

void mainCommon(FlavorConfig config) {
  runApp(MyApp(config: config));
}

class MyApp extends StatefulWidget {
  const MyApp({
    required this.config,
    super.key,
  });

  final FlavorConfig config;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialApp(
      theme: widget.config.theme!,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: theme.primaryColor,
          title: Text(widget.config.title!),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.config.icon!,
                color: theme.primaryColor,
                size: 200,
              ),
              const SizedBox(height: 50),
              const Text(
                'Você apertou o botão tantas vezes:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                '$_counter',
                style: TextStyle(
                  color: theme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.primaryColor,
          onPressed: _incrementCounter,
          tooltip: 'Incrementar',
          child: const Icon(
            Icons.add_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
