import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';
import 'package:tunctexting/common/enums/message_enum.dart';
import 'package:tunctexting/screens/chat/widgets/display_card.dart';
import 'package:tunctexting/screens/chat/widgets/translation_button.dart';
import 'package:tunctexting/utils/utils.dart';

class SenderMessageCardWithTranslation extends StatelessWidget {
  const SenderMessageCardWithTranslation({
    Key? key,
    required this.message,
    required this.date,
    required this.type,
    required this.repliedText,
    required this.username,
    required this.repliedMessageType,
    required this.onRightSwipe,
  }) : super(key: key);
  final String message;
  final String date;
  final MessageEnum type;
  final VoidCallback onRightSwipe;
  final String repliedText;
  final String username;
  final MessageEnum repliedMessageType;

  @override
  Widget build(BuildContext context) {
    final isReplying = repliedText.isNotEmpty;
    return SwipeTo(
      onRightSwipe: (v) => onRightSwipe,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: textColor,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Stack(
              children: [
                Padding(
                  padding: type == MessageEnum.text
                      ? const EdgeInsets.only(
                          left: 10, right: 30, top: 5, bottom: 25)
                      : const EdgeInsets.only(
                          left: 5, right: 5, top: 5, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isReplying) ...[
                        Text(
                          username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: backgroundColor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DisplayCard(
                            message: repliedText,
                            type: repliedMessageType,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                      DisplayCard(message: message, type: type),
                      if (type == MessageEnum.text)
                        TranslationButton(originalText: message),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 2,
                  right: 10,
                  child: Text(
                    date,
                    style: const TextStyle(
                      fontSize: 11,
                      color: backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
