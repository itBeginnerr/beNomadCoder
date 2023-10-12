import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/widgets/video_button.dart';
import 'package:tiktok_clone/features/videos/widgets/video_comments.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

final class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  bool seemoreisClicked = false;
  late final VideoPlayerController _videoPlayerController;

  final Duration _animationDuration = const Duration(milliseconds: 200);

  late final AnimationController _animationController;

  void _seemoreClicked() {
    seemoreisClicked = !seemoreisClicked;
    setState(() {});
  }

  bool _isPaused = false;

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    _videoPlayerController =
        VideoPlayerController.asset("assets/videos/video2.mp4");
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);

    _videoPlayerController.addListener(_onVideoChange);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();

    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 && !_videoPlayerController.value.isPlaying) {
      if (info.visibleFraction == 1 &&
          !_isPaused &&
          !_videoPlayerController.value.isPlaying) {
        _videoPlayerController.play();
      }
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _onCommentsTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Sizes.size10,
        ),
      ),
      context: context,
      builder: (context) => const VideoComment(),
    );
    _onTogglePause();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("{widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    opacity: _isPaused ? 1 : 0,
                    duration: _animationDuration,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size40,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "@상민",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gaps.v10,
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: const BoxDecoration(),
                  child: Text(
                    "This is actually the ss ss ss placesssssssThis is actually the ss ss ss placesssssssThis is actually the ss ss ss placesssssss",
                    maxLines: seemoreisClicked ? 100 : 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: MediaQuery.of(context).size.width * 0.55,
            child: GestureDetector(
              onTap: _seemoreClicked,
              child: Text(
                seemoreisClicked ? "Less" : "See more",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  radius: 25,
                  child: Text("상민"),
                ),
                Gaps.v20,
                const videoButton(
                  icon: FontAwesomeIcons.solidHeart,
                  text: "2.9M",
                ),
                Gaps.v20,
                GestureDetector(
                  onTap: () => _onCommentsTap(context),
                  child: const videoButton(
                    icon: FontAwesomeIcons.solidComment,
                    text: "33K",
                  ),
                ),
                Gaps.v20,
                const videoButton(
                  icon: FontAwesomeIcons.share,
                  text: "share",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
