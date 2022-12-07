import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('images/one.mp4')..initialize().then((value) {
        setState(() {

        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

        body: Column(
          children: [

            Center(
              child:_controller.value.isInitialized
                  ? AspectRatio(
                child: VideoPlayer(_controller),aspectRatio: _controller.value.aspectRatio,)
                  : Container(
                child: Center(child: CircularProgressIndicator(),),
              ),
            ),
            VideoProgressIndicator(_controller, allowScrubbing: true),
            ElevatedButton(
                onPressed: () async{
                  Duration? pos=await _controller.position;
                  var value= pos! + Duration(seconds: 10);
                  _controller.seekTo(Duration(seconds:value.inSeconds ));
                },
                child:Icon(Icons.arrow_forward) ),
            ElevatedButton(
                onPressed: () async{
                  Duration? pos=await _controller.position;
                  var value= pos! - Duration(seconds: 10);
                  _controller.seekTo(Duration(seconds:value.inSeconds ));
                },
                child:Icon(Icons.arrow_back) ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
              _controller.setPlaybackSpeed(1);



            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),

    );
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


}