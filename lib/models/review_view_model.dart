import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:review/models/review_model.dart';

class ReviewProvider with ChangeNotifier {
  late CollectionReference reviewReference;
  List<Review> reviews = [];

  ReviewProvider({reference}) {
    reviewReference =
        reference ?? FirebaseFirestore.instance.collection('review');
  }

  Future<void> fetchReviews() async {
    reviews = await reviewReference.get().then(
      (QuerySnapshot results) {
        return results.docs.map((DocumentSnapshot document) {
          return Review.fromSnapshot(document);
        }).toList();
      },
    );
    notifyListeners();
  }

  
}
