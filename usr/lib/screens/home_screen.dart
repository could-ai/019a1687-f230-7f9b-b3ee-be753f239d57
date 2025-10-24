import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/user_model.dart';
import 'package:couldai_user_app/widgets/profile_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<User> _users = [
    User(id: "1", name: "Alice", age: 25, imageUrl: "https://randomuser.me/api/portraits/women/1.jpg"),
    User(id: "2", name: "Bob", age: 28, imageUrl: "https://randomuser.me/api/portraits/men/2.jpg"),
    User(id: "3", name: "Clara", age: 22, imageUrl: "https://randomuser.me/api/portraits/women/3.jpg"),
    User(id: "4", name: "David", age: 30, imageUrl: "https://randomuser.me/api/portraits/men/4.jpg"),
  ];

  int _currentUserIndex = 0;

  void _nextUser() {
    setState(() {
      if (_currentUserIndex < _users.length - 1) {
        _currentUserIndex++;
      } else {
        // End of list
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover"),
      ),
      body: _currentUserIndex < _users.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ProfileCard(user: _users[_currentUserIndex]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        onPressed: _nextUser,
                        backgroundColor: Colors.red,
                        child: const Icon(Icons.close),
                      ),
                      FloatingActionButton(
                        onPressed: _nextUser,
                        backgroundColor: Colors.green,
                        child: const Icon(Icons.favorite),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(
              child: Text("No more profiles"),
            ),
    );
  }
}
