import 'package:chat_bot/components/user_tile.dart';
import 'package:chat_bot/main.dart';
import 'package:chat_bot/services/auth/auth_service.dart';
import 'package:chat_bot/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class BlockedUsersPage extends StatelessWidget {
  BlockedUsersPage({super.key});

  // chat && auth service
  final ChatService chatService = ChatService();
  final AuthService authService = AuthService();

  /// Show confirm unblock box
  void _showUnblockBox(BuildContext context, String userId){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Unblock User'),
        content: Text("Are you sure you want to unblock this user?"),
        actions: [
          // cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),

          // unblocked button
          TextButton(
            onPressed: () {
              chatService.unblockUser(userId);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('User unblocked!'))
              );
            },
            child: Text('Unblock'),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    // get current users id
    String userId = authService.getCurrentUser()!.uid;

    // UI
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOCKED USERS'),
        actions: [],
      ),

      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: chatService.getBlockedUsersStream(userId),
        builder: (context, snapshot){
          // errors..
          if(snapshot.hasError){
            return Center(
              child: Text('Error loading..'),
            );
          }

          // loading
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final blockedUsers = snapshot.data ?? [];

          // no users
          if(blockedUsers.isEmpty){
            return Center(
              child: Text('No blocked users'),
            );
          }

          ///Load complete
          return ListView.builder(
            itemCount: blockedUsers.length,
            itemBuilder: (context, index){
              final user = blockedUsers[index];
              return UserTile(
                text: user["email"],
                onTap: () => _showUnblockBox(context, user['uid']),
              );
            },
          );
        },
      ),
    );
  }
}


