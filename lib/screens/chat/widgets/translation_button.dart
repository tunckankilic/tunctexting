import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslationButton extends StatefulWidget {
  final String originalText;
  final String fromLanguage;
  final String toLanguage;

  const TranslationButton({
    Key? key,
    required this.originalText,
    this.fromLanguage = 'auto',
    this.toLanguage = 'en',
  }) : super(key: key);

  @override
  _TranslationButtonState createState() => _TranslationButtonState();
}

class _TranslationButtonState extends State<TranslationButton> {
  final translator = GoogleTranslator();
  String? translatedText;
  bool isTranslating = false;

  Future<void> translateText() async {
    setState(() {
      isTranslating = true;
    });
    try {
      var translation = await translator.translate(
        widget.originalText,
        from: widget.fromLanguage,
        to: widget.toLanguage,
      );
      setState(() {
        translatedText = translation.text;
        isTranslating = false;
      });
    } catch (e) {
      print('Çeviri hatası: $e');
      setState(() {
        translatedText = 'Çeviri yapılamadı';
        isTranslating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (translatedText == null)
          TextButton(
            onPressed: translateText,
            child: Text(isTranslating ? 'Çevriliyor...' : 'Çevir'),
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Çeviri:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(translatedText!),
            ],
          ),
      ],
    );
  }
}
