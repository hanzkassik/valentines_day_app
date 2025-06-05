import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:valentines_day/app/data/interfaces/love_message_repositoryinterface.dart';
import 'package:valentines_day/app/data/models/love_message_model.dart';

enum HomeStatus { none, loading, success, error }

class HomeController extends GetxController {
  final ILoveMessageRepository _loveMessageRepository = Get.find();
  final audioPlayer = AudioPlayer();
  var status = HomeStatus.none.obs;
  var loveMessages = <LoveMessageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLoveMessages();
    playMusic();
  }

  Future<void> fetchLoveMessages() async {
    try {
      status.value = HomeStatus.loading;
      var messages = await _loveMessageRepository.getLoveMessages();
      loveMessages.assignAll(messages);
    } catch (e) {
      Get.snackbar('Erro', e.toString());
    } finally {
      status.value = HomeStatus.none;
    }
  }

  Future<void> playMusic() async {
    await audioPlayer.play(
      AssetSource('audio/music.mp3'),
      volume: 0.5,
    );
  }
}
