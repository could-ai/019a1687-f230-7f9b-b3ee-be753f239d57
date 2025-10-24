import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Matches"),
      ),
      body: ListView.builder(
        itemCount: 5, // Dummy data
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("https://randomuser.me/api/portraits/women/${index + 10}.jpg"),
            ),
            title: Text("Match ${index + 1}"),
            subtitle: const Text("Say hi!"),
            onTap: () {
              // Navigate to chat screen
            },
          );
        },
      ),
    );
  }
}
