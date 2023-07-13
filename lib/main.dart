import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palindrome Checker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PalindromePage(),
    );
  }
}

class PalindromePage extends StatefulWidget {
  @override
  _PalindromePageState createState() => _PalindromePageState();
}

class _PalindromePageState extends State<PalindromePage> {
  String inputText1 = '';
  String inputText2 = '';
  String result1 = '';
  String result2 = '';

  bool isPalindrome(String word) {
    // List<String> characters = word.split('');
    // List<String> reversedCharacters = characters.reversed.toList();
    // return characters.join() == reversedCharacters.join();
    return word == word.split('').reversed.join();
  }

  void checkPalindrome1() {
    setState(() {
      if (isPalindrome(inputText1)) {
        result1 = 'Перевірене слово є паліндромом!';
      } else {
        result1 = 'Перевірене слово не є паліндромом.';
      }
    });
  }

  void checkPalindrome2(String text) {
    setState(() {
      if (isPalindrome(text)) {
        result2 = 'Це слово є паліндромом!';
      } else {
        result2 = 'Це слово не є паліндромом.';
      }
    });
  }

  bool isOneWord(String text) {
    return RegExp(r"^[a-zA-Z]+$").hasMatch(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text('Palindrome Checker'),
      ),
      endDrawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 150),
              TextField(
                onChanged: (text) {
                  setState(() {
                    if (isOneWord(text)) {
                      inputText2 = text.toUpperCase();
                      checkPalindrome2(inputText2);
                    } else {
                      inputText2 = '';
                      result2 = '';
                    }
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Введіть слово',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                result2,
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 150),
              TextField(
                onChanged: (text) {
                  setState(() {
                    if (isOneWord(text)) {
                      inputText1 = text.toUpperCase();
                    } else {
                      inputText1 = '';
                    }
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Введіть слово',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: inputText1.isNotEmpty ? checkPalindrome1 : null,
                child: Text('Перевірити'),
              ),
              SizedBox(height: 16.0),
              Text(
                result1,
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.0),
              TextField(
                onChanged: (text) {
                  setState(() {
                    if (isOneWord(text)) {
                      inputText2 = text.toUpperCase();
                      checkPalindrome2(inputText2);
                    } else {
                      inputText2 = '';
                      result2 = 'Помилка введення';
                    }
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Введіть слово',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                result2,
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              // SizedBox(height: 1600),
            ],
          ),
        ),
      ),
    );
  }
}
