import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/features/Home/delegates/serach_community_delegates.dart';
import 'package:reddit_clone/features/Home/drawers/profile_drawer.dart';
import 'package:reddit_clone/features/auth/controller/auth_controller.dart';
import 'package:reddit_clone/models/hand_rise_model.dart';
import 'package:reddit_clone/models/userModel.dart';

import '../drawers/community_list_drawer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  displayCommunityDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  displayProfileDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              displayCommunityDrawer(context);
            },
            icon: const Icon(Icons.menu),
          ),
        ),
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: SearchCommunityDelegate(ref: ref));
            },
            icon: const Icon(Icons.search),
          ),
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                displayProfileDrawer(context);
              },
              icon: CircleAvatar(
                backgroundImage: NetworkImage(user.profilePic),
              ),
            ),
          ),
        ],
      ),
      drawer: const CommunityListDrawer(),
      endDrawer: const ProfileDrawer(),
      body: Column(
        children: [
          Center(
            child: TextButton(
                onPressed: () {
                  print("DateTime");
                  print(DateTime.now());
                  print("============");
                },
                child: const Text(
                  "DateTime",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  print("TimeStamp");
                  print(Timestamp.now().toDate());
                  print("============");
                },
                child: const Text(
                  "TimeStamp",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                )),
          ),
        ],
      ),
    );
  }
}
