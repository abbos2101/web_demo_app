import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'data_list.dart';
import 'model.dart';

class MainScreen extends StatefulWidget {
  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => screen());

  static Widget screen() => MainScreen();

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String title = "Flutter kursi";
  final YoutubePlayerController controller = YoutubePlayerController(
    params: YoutubePlayerParams(
      playlist: [
        "z5iw2SeFx2M",
        "eI43jkQkrvs",
        "kp14Y4uHpHs",
      ],
      autoPlay: true,
      strictRelatedVideos: false,
      showFullscreenButton: true,
      desktopMode: true,
    ),
  );

  @override
  void initState() {
    controller.listen((event) {
      if (event.metaData.title.isNotEmpty)
        title = "${event.metaData.title} by ${event.metaData.author}";
      else
        title = "Flutter kursi";
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$title")),
      body: YoutubePlayerIFrame(controller: controller),
    );
  }
}
