import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Translator extends StatefulWidget {
  const Translator({Key? key,}) : super(key: key);

  @override
  State<Translator> createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {

  String translate = 'Translation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: const Icon(
          Icons.translate_rounded,
          color: Colors.white,
        ),
        title: const Text(
          'Translation',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Card(
        margin: const EdgeInsets.all(12),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'English',
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold
              ),
              decoration: const InputDecoration(
                hintText: 'Enter Text',
              ),
              onChanged: (text) async {
                final translation = await text.translate(
                  from: 'en',
                  to: 'ur',
                );
                setState(() {
                  translate = translation.text;
                });
              },
            ),
            const Divider(
              height: 32,
            ),
            Text(
              translate,
              style: const TextStyle(
                fontSize: 35,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}