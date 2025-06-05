import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:valentines_day/app/data/models/love_message_model.dart';

class CardHistory extends StatelessWidget {
  final LoveMessageModel loveMessageModel;
  const CardHistory({
    super.key,
    required this.loveMessageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            LayoutBuilder(builder: (context, constraints) {
              return SizedBox(
                height: 200,
                width: constraints.maxWidth,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image(
                    image: loveMessageModel.image != null
                        ? MemoryImage(base64Decode(loveMessageModel.image!))
                        : const AssetImage('assets/images/valentines-day.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(loveMessageModel.title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(loveMessageModel.content,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
