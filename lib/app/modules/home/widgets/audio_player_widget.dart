// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerWidget extends StatefulWidget {
  final AudioPlayer audioPlayer;
  const AudioPlayerWidget({
    super.key,
    required this.audioPlayer,
  });

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  PlayerState? playerState;
  Duration? duration;
  Duration? position;
  double volume = 0.5;
  double? lastVole;
  bool volumeHover = false;
  StreamSubscription? durationSubscription;
  StreamSubscription? positionSubscription;
  StreamSubscription? playerCompletedSubscription;
  StreamSubscription? playerStateSubscription;

  @override
  void initState() {
    super.initState();
    durationSubscription = widget.audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });
    positionSubscription = widget.audioPlayer.onPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });
    playerCompletedSubscription =
        widget.audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        playerState = PlayerState.completed;
      });
      widget.audioPlayer.play(
        AssetSource('audio/music.mp3'),
      );
    });
    playerStateSubscription =
        widget.audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        playerState = state;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Text(duration != null
                  ? '${position?.inMinutes.toString().padLeft(2, '0')}:${((position?.inSeconds ?? 0) % 60).toString().padLeft(2, '0')}'
                  : '0:00'),
              Expanded(
                child: Slider(
                  value: ((position?.inMilliseconds ?? 0) > 0)
                      ? position!.inMilliseconds / duration!.inMilliseconds
                      : 0,
                  onChanged: (value) {
                    widget.audioPlayer.seek(
                      Duration(
                          milliseconds:
                              (value * duration!.inMilliseconds).toInt()),
                    );
                  },
                ),
              ),
              Text(duration != null
                  ? '${duration!.inMinutes.toString().padLeft(2, '0')}:${(duration!.inSeconds % 60).toString().padLeft(2, '0')}'
                  : '0:00'),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MouseRegion(
              onHover: (event) => volumeHover = true,
              onExit: (event) => volumeHover = false,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (lastVole == null) {
                        lastVole = volume;
                        volume = 0.0;
                      } else {
                        volume = lastVole!;
                        lastVole = null;
                      }
                      setState(() {
                        widget.audioPlayer.setVolume(volume);
                      });
                    },
                    icon: Icon(
                      (lastVole == null)
                          ? Icons.volume_up_outlined
                          : Icons.volume_off,
                      color: Colors.black45,
                    ),
                  ),
                  if (volumeHover)
                    Slider(
                      value: volume,
                      onChanged: (value) {
                        setState(() {
                          volume = value;
                        });
                        widget.audioPlayer.setVolume(value);
                      },
                    )
                ],
              ),
            ),
            IconButton(
              icon: Icon([
                PlayerState.paused,
                PlayerState.stopped,
                PlayerState.completed
              ].contains(widget.audioPlayer.state)
                  ? Icons.play_arrow
                  : Icons.pause),
              onPressed: () async {
                if (widget.audioPlayer.state == PlayerState.paused) {
                  widget.audioPlayer.resume();
                } else if (widget.audioPlayer.state == PlayerState.stopped ||
                    widget.audioPlayer.state == PlayerState.completed) {
                  widget.audioPlayer.play(
                    AssetSource('audio/die_with_a_smile.mp3'),
                  );
                } else {
                  widget.audioPlayer.pause();
                }
              },
            ),
            Container()
          ],
        ),
      ],
    );
  }
}
