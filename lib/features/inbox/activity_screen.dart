import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  bool _showBarrier = false;

  final List<Map<String, dynamic>> _tabs = [
    {
      "title": "All activity",
      "icon": FontAwesomeIcons.solidMessage,
    },
    {
      "title": "Likes",
      "icon": FontAwesomeIcons.solidHeart,
    },
    {
      "title": "Comments",
      "icon": FontAwesomeIcons.solidComment,
    },
    {
      "title": "Followers",
      "icon": FontAwesomeIcons.solidUser,
    },
    {
      "title": "From TikTok",
      "icon": FontAwesomeIcons.tiktok,
    },
  ];

  final List<String> _notifications = List.generate(20, (index) => "${index}h");

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 100,
    ),
  );

  late final Animation<Color?> _barrierAnimation = ColorTween(
    begin: Colors.transparent,
    end: Colors.black38,
  ).animate(_animationController);

  late final Animation<double> _arrowAnimation =
      Tween(begin: 0.0, end: 0.5).animate(_animationController);

  late final Animation<Offset> _panelAnimation = Tween(
    begin: const Offset(0, -1),
    end: Offset.zero,
  ).animate(_animationController);

  void _onDismissed(notification) {
    _notifications.remove(notification);
    setState(() {});
  }

  void _toggleAnimation() async {
    if (_animationController.isCompleted) {
      await _animationController.reverse();
    } else {
      _animationController.forward();
    }

    setState(() {
      _showBarrier = !_showBarrier;
    });
  }

  void _onTapScaffold() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapScaffold,
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: _toggleAnimation,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("All activity"),
                Gaps.h4,
                RotationTransition(
                  turns: _arrowAnimation,
                  child: const FaIcon(
                    FontAwesomeIcons.chevronDown,
                    size: Sizes.size14,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            ListView(
              children: [
                Gaps.v14,
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizes.size20,
                  ),
                  child: Text("New"),
                ),
                Gaps.v14,
                for (var notifiaction in _notifications)
                  Dismissible(
                    onDismissed: (direction) => _onDismissed(notifiaction),
                    key: Key(notifiaction),
                    background: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.green,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          left: Sizes.size14,
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.checkDouble,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    secondaryBackground: Container(
                      alignment: Alignment.centerRight,
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.only(
                          right: Sizes.size14,
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.trashCan,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: ListTile(
                      minVerticalPadding: Sizes.size14,
                      title: RichText(
                        text: TextSpan(
                          text: "Account Updates:  ",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(
                              text: " Upload longer videos ",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: " $notifiaction",
                              style: TextStyle(
                                color: Colors.grey.shade400,
                              ),
                            )
                          ],
                        ),
                      ),
                      trailing: const FaIcon(
                        FontAwesomeIcons.chevronRight,
                        size: Sizes.size14,
                      ),
                      leading: Container(
                        width: Sizes.size52,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: Sizes.size1,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.bell,
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
            if (_showBarrier)
              AnimatedModalBarrier(
                color: _barrierAnimation,
                onDismiss: _toggleAnimation,
              ),
            SlideTransition(
              position: _panelAnimation,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      Sizes.size5,
                    ),
                    bottomRight: Radius.circular(
                      Sizes.size5,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var tab in _tabs)
                      ListTile(
                        title: Row(
                          children: [
                            FaIcon(
                              tab["icon"],
                              color: Colors.black,
                              size: Sizes.size16,
                            ),
                            Gaps.h20,
                            Text(
                              tab['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
