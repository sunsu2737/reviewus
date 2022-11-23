import 'package:cloud_firestore/cloud_firestore.dart';

class Review {
  late String? id;
  late String title;
  late String presenter;
  late int level;
  late String category;
  late String challengeUrl;
  late String firstInspector;
  late String firstInspectUrl;
  late String secondInspector;
  late String secondInspectUrl;
  String state = "1차 리뷰 중";

  Review({
    required this.title,
    required this.presenter,
    required this.level,
    required this.category,
    required this.challengeUrl,
    required this.firstInspector,
    required this.firstInspectUrl,
    required this.secondInspector,
    required this.secondInspectUrl,
  });

  Review.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    id = snapshot.id;
    title = data['title'];
    presenter = data['presenter'];
    level = data['level'];
    category = data['category'];
    challengeUrl = data['challengeUrl'];
    firstInspector = data['firstInspector'];
    firstInspectUrl = data['firstInspectUrl'];
    secondInspector = data['secondInspector'];
    secondInspectUrl = data['secondInspectUrl'];
    state = data['state'];
  }

  Map<String, dynamic> toSnapshot() {
    return {
      'title': title,
      'presenter': presenter,
      'level': level,
      'category': category,
      'challengeUrl': challengeUrl,
      'firstInspector': firstInspector,
      'firstInspectUrl': firstInspectUrl,
      'secondInspector': secondInspector,
      'secondInspectUrl': secondInspectUrl,
      'state': state
    };
  }
}
