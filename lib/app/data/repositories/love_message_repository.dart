import 'package:valentines_day/app/data/interfaces/love_message_datasource_interface.dart';
import 'package:valentines_day/app/data/interfaces/love_message_repositoryinterface.dart';
import 'package:valentines_day/app/data/models/love_message_model.dart';

class LoveMessageRepository implements ILoveMessageRepository {
  final ILoveMessageDatasource datasource;

  LoveMessageRepository({required this.datasource});

  @override
  Future<List<LoveMessageModel>> getLoveMessages() async {
    var response = await datasource.getLoveMessages();
    return response
        .map((message) => LoveMessageModel.fromMap(message))
        .toList();
  }
}
