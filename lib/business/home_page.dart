import 'package:TikBili/business/video/video_container_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return const VideoContainerPage();
        });
    // return VideoPlayerScreen();
  }
}
