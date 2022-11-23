import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class InfoProvider extends ChangeNotifier {
  final List<int> levelList = [0, 1, 2, 3, 4, 5];
  final List<String> categoryList = [
    "해시",
    "스택",
    "큐",
    "힙",
    "정렬",
    "완전 탐색",
    "그리디",
    "DP",
    "BFS/DFS",
    "이분 탐색",
    "그래프"
  ];
  List<String> userList = [];
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> getUserList() async {
    userList = await _db.collection("users").get().then((value) {
      return value.docs.map((e) => e['name'] as String).toList();
    });

  }
}
