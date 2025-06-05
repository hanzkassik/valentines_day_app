import 'dart:convert';
import 'dart:io';

import 'package:valentines_day/app/data/exceptions/not_found_file_exception.dart';
import 'package:valentines_day/app/data/interfaces/love_message_datasource_interface.dart';
import 'package:valentines_day/app/data/models/love_message_model.dart';

class LoveMessageDatasource implements ILoveMessageDatasource {
  @override
  Future<List<Map<String, dynamic>>> getLoveMessages() async {
    File file = File('./db.json');
    if (!(await file.exists())) {
      file.writeAsString(jsonEncode(
          [LoveMessageModel(title: '', content: '', image: '').toMap()]));
      file.create();
      throw NotFoundFileException(
          message: 'Arquivo de mensagens não encontrado');
    }
    String content = await file.readAsString();
    if (content.isEmpty) {
      throw NotFoundFileException(message: 'Arquivo de mensagens vazio');
    }
    List<Map<String, dynamic>> messages =
        List<Map<String, dynamic>>.from(jsonDecode(content));
    return messages;
  }
}
