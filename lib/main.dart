import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palindrome Checker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const PalindromePage(),
    );
  }
}

class PalindromePage extends StatefulWidget {
  const PalindromePage({super.key});

  @override
  State<PalindromePage> createState() => PalindromePageState();
}

class PalindromePageState extends State<PalindromePage> {
  String inputText = '';
  String result = '';

  void checkPalindrome() {
    String modText =
        inputText.toUpperCase().replaceAll(" ", "").replaceAll("\n", "");
    setState(() {
      if (modText.isEmpty) {
        result = 'Не введено значимих символів';
      } else if (modText == modText.split('').reversed.join()) {
        result = 'Цей вираз є паліндромом!';
      } else {
        result = 'Цей вираз не є паліндромом.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            transform: GradientRotation(1.2),
            colors: <Color>[
              // Colors.blue,
              Colors.blueAccent,
              Colors.yellowAccent,
              // Colors.yellow
            ]),
      ),
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 100,
          title: Row(
            children: [
              Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
                height: 50,
              ),
              const Text(
                ' Palindrome Checker',
                style: TextStyle(fontSize: 25, shadows: [
                  Shadow(
                      color: Colors.black, offset: Offset.zero, blurRadius: 7)
                ]),
              ),
            ],
          ),
        ),

        body: SingleChildScrollView(
          reverse: true,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 150),
                TextField(
                  style: const TextStyle(fontSize: 20, height: 1.5),
                  minLines: 2,
                  maxLines: 15,
                  onChanged: (text) {
                    setState(() {
                      inputText = text;
                      result = '';
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: 'Введіть вираз для перевірки',
                      filled: true,
                      fillColor: Color.fromARGB(100, 255, 255, 255)),
                ),
                const SizedBox(height: 16.0),
                Tooltip(
                  triggerMode: TooltipTriggerMode.tap,
                  message:
                      inputText.isEmpty ? 'Спочатку потрібно щось ввести' : '',
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.yellowAccent,
                  ),
                  height: 50,
                  padding: const EdgeInsets.all(8.0),
                  preferBelow: false,
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                  showDuration: const Duration(seconds: 1),
                  // waitDuration: const Duration(seconds: 1),

                  child: ElevatedButton(
                    onPressed: inputText.isNotEmpty ? checkPalindrome : null,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(10, 50)),
                    child: const Text(
                      'Перевірити',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(result,
                    style: const TextStyle(
                        fontSize: 23.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
                // const SizedBox(height: 16.0),
                // SizedBox(
                //   height: 150,
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(25),
                //       gradient: const LinearGradient(
                //           begin: Alignment.centerLeft,
                //           end: Alignment.centerRight,
                //           // tileMode: TileMode.mirror,
                //           transform: GradientRotation(1.2),
                //           colors: <Color>[
                //             Colors.blue,
                //             Colors.blueAccent,
                //             Colors.yellowAccent,
                //             Colors.yellow
                //           ]),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
