import 'package:valentines_day/app/data/models/love_message_model.dart';

abstract class ILoveMessageRepository {
  Future<List<LoveMessageModel>> getLoveMessages();
}
