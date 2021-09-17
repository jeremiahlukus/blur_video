import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoPlayerItem extends StatefulWidget {
  // This will contain the URL/asset path which we want to play
  final String videoUrl;
  final bool looping;
  final height;
  final bool autoPlay;

  VideoPlayerItem({
    @required this.videoUrl,
    this.height,
    this.looping,
    this.autoPlay = true,
    Key key,
  }) : super(key: key);

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration = BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoPlay: true,
    );
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl,
      cacheConfiguration: BetterPlayerCacheConfiguration(useCache: true),
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool videoStatus = Provider.of<VideoPlayerProvider>(context, listen: true).getVideoStatus;
    // pauseVideo(videoStatus);
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BetterPlayer(controller: _betterPlayerController),
    );
  }
}
