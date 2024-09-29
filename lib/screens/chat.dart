import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/widgets/chat_message.dart';
import 'package:my_app/widgets/new_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter chat"),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(
                Icons.exit_to_app,
                color: Theme.of(context).colorScheme.primary,
              ))
        ],
      ),
      body: const Center(
        child: Column(
          children: [
            Expanded(child: ChatMessages()),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
