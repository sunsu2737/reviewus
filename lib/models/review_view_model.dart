import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:review/models/review_model.dart';

class ReviewProvider with ChangeNotifier {
  late CollectionReference reviewReference;
  List<Review> dashboard = [];
  List<Review> reviews = [];
  List<Review> watings = [];
  List<Review> reflections = [];
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Review>> getReviews() {
    return _db.collection("review").snapshots().map((snapShot) =>
        snapShot.docs.map((e) => Review.fromSnapshot(e)).toList());
  }

  void toDashboard(data) {
    dashboard = data;
    notifyListeners();
  }
}
