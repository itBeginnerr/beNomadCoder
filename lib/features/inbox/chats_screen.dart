import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox/chat_detail_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  final Duration _duration = const Duration(
    milliseconds: 500,
  );

  final List<int> _items = [];

  void _addItem() {
    if (_key.currentState != null) {
      _key.currentState!.insertItem(
        _items.length,
        duration: _duration,
      );
      _items.add(_items.length);
    }
  }

  void _deleteItem(int index) {
    if (_key.currentState != null) {
      _key.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: _makeTile(index),
        ),
        duration: _duration,
      );
    }
    _items.removeAt(index);
  }

  void _onChatTap() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ChatDetailScreen()));
  }

  Widget _makeTile(index) {
    return ListTile(
      onTap: _onChatTap,
      onLongPress: () => _deleteItem(index),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "Lynn $index",
            style: const TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "2:16 PM",
            style:
                TextStyle(fontSize: Sizes.size12, color: Colors.grey.shade500),
          )
        ],
      ),
      leading: const CircleAvatar(
        radius: 30,
        child: Text("상민"),
      ),
      subtitle: const Text("Hey guy~"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Direct messages"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const FaIcon(
              FontAwesomeIcons.plus,
            ),
          )
        ],
      ),
      body: AnimatedList(
        key: _key,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
            key: Key("$index"),
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              child: _makeTile(index),
            ),
          );
        },
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
      ),
    );
  }
}
