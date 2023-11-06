import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBackground extends StatefulWidget {
  const VideoBackground({super.key, required this.lucky});
  final bool lucky;

  @override
  State<VideoBackground> createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  final VideoPlayerController _controller = VideoPlayerController.asset('video/rick_roll.mp4');
  

  @override
  void initState() {
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.lucky) {
      _controller.play();
      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: VideoPlayer(_controller)
      );
    }

    _controller.seekTo(Duration.zero);
    _controller.pause();
    return Container();
  }
}