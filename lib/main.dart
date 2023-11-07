import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _fontSize = 40;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 280, top: 10),
                child: SizedBox(
                  width: 100,
                  height: 40,
                  child: TextButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                      onPressed: () {
                        _controller.clear();
                      },
                      child: const Text(
                        "Clear",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 380,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Your text here",
                      ),
                      textInputAction: TextInputAction.done,
                      style: TextStyle(fontSize: _fontSize),
                      maxLines: null,
                    ),
                  ),
                ),
              ),
              Slider(
                value: _fontSize,
                min: 40,
                max: 200,
                onChanged: (newSize) {
                  setState(() {
                    _fontSize = newSize;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
