import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valentines_day/app/modules/home/controllers/home_controller.dart';
import 'package:valentines_day/app/modules/home/widgets/audio_player_widget.dart';
import 'package:valentines_day/app/modules/home/widgets/card_history.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 88, 78),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Nossa história',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              print(MediaQuery.of(context).size.height);
              if (controller.status.value == HomeStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return CarouselSlider(
                items: controller.loveMessages.map((e) {
                  return CardHistory(
                    loveMessageModel: e,
                  );
                }).toList(),
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    enableInfiniteScroll: false,
                    viewportFraction: 0.7,
                    height: 500),
              );
            }),
          ),
          AudioPlayerWidget(audioPlayer: controller.audioPlayer),
        ],
      ),
    );
  }
}
