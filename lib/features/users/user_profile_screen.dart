import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/users/widgets/persistent_tab_bar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text("Sangmin"),
                actions: [
                  IconButton(
                    onPressed: _onGearPressed,
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                    ),
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: Sizes.size40,
                      backgroundColor: Colors.teal,
                      foregroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/3612017"),
                      child: Text("상민"),
                    ),
                    Gaps.v3,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "@Sangmin",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gaps.h3,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: Sizes.size16,
                          color: Colors.blue.shade400,
                        ),
                        Gaps.v10,
                      ],
                    ),
                    Gaps.v20,
                    SizedBox(
                      height: Sizes.size40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "37",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size18,
                                ),
                              ),
                              Gaps.v3,
                              Text(
                                "Following",
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                              )
                            ],
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                            indent: 7,
                            endIndent: 7,
                          ),
                          Column(
                            children: [
                              const Text(
                                "10M",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size18,
                                ),
                              ),
                              Gaps.v3,
                              Text(
                                "Follower",
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                              )
                            ],
                          ),
                          VerticalDivider(
                            width: Sizes.size32,
                            thickness: Sizes.size1,
                            color: Colors.grey.shade400,
                            indent: 7,
                            endIndent: 7,
                          ),
                          Column(
                            children: [
                              const Text(
                                "194.3M",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.size18,
                                ),
                              ),
                              Gaps.v3,
                              Text(
                                "Likes",
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Gaps.v10,
                    Row(
                      children: [
                        Expanded(
                          child: FractionallySizedBox(
                            widthFactor: 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size12,
                                    horizontal: Sizes.size20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        Sizes.size4,
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "Fllowers",
                                    style: TextStyle(
                                      fontSize: Sizes.size14,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Gaps.h5,
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size12,
                                    horizontal: Sizes.size12,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: Sizes.size1,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  child: const FaIcon(
                                    FontAwesomeIcons.youtube,
                                    size: Sizes.size14,
                                  ),
                                ),
                                Gaps.h5,
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size12,
                                    horizontal: Sizes.size12,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: Sizes.size1,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  child: const FaIcon(
                                    FontAwesomeIcons.angleDown,
                                    size: Sizes.size14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v10,
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Sizes.size8,
                        horizontal: Sizes.size32,
                      ),
                      child: Text(
                        "All highlights and where to watch live matches on FIFA+ I wonder how it would loook",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v10,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: Sizes.size14,
                        ),
                        Gaps.h3,
                        Text(
                          "https://nomadcoder.co",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                padding: EdgeInsets.zero,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: Sizes.size2,
                  crossAxisSpacing: Sizes.size2,
                  childAspectRatio: 9 / 12,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 9 / 12,
                      child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/beautiful_image.jpg",
                          image:
                              "https://images.pexels.com/photos/326055/pexels-photo-326055.jpeg?cs=srgb&dl=pexels-pixabay-326055.jpg&fm=jpg"),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text('Page two'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
