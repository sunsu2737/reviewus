import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:review/models/review_model.dart';
import 'package:review/storage/user_info.dart';

class ReviewProvider with ChangeNotifier {
  late CollectionReference reviewReference;
  List<Review> dashboard = [];
  List<Review> reviews = [];
  List<Review> watings = [];
  List<Review> reflections = [];
  FirebaseFirestore _db = FirebaseFirestore.instance;

  late String? id;
  late String title;
  late String presenter;
  late int level = 0;
  late String category = "해시";
  late String challengeUrl;
  late String firstInspector = "";
  late String firstInspectUrl;
  late String secondInspector = "없음";
  late String secondInspectUrl;

  Stream<List<Review>> getReviews() {
    return _db.collection("review").snapshots().map((snapShot) =>
        snapShot.docs.map((e) => Review.fromSnapshot(e)).toList());
  }

  void deleteReview(String id) {
    _db.collection('review').doc(id).delete();
    // dashboard.removeWhere((element) => element.id == id);
    // reviews.removeWhere((element) => element.id == id);
    // watings.removeWhere((element) => element.id == id);
    // reflections.removeWhere((element) => element.id == id);
  }

  void completeReview(Review review) {
    if (review.state == "1차 리뷰 중") {
      _db.collection('review').doc(review.id).update({"state": "1차 반영 중"});
    } else if (review.state == "1차 반영 중") {
      if (review.secondInspector == "없음") {
        _db.collection('review').doc(review.id).update({"state": "완료"});
      } else {
        _db.collection('review').doc(review.id).update({"state": "2차 리뷰 중"});
      }
    } else if (review.state == "2차 리뷰 중") {
      _db.collection('review').doc(review.id).update({"state": "2차 반영 중"});
    } else if (review.state == "2차 반영 중") {
      _db.collection('review').doc(review.id).update({"state": "완료"});
    }
  }

  void toDashboard(
      {required List<Review> data,
      String sstate = "전체",
      String spresenter = "전체",
      String slevel = "전체",
      String scategory = "전체",
      String sfirst = "전체",
      String ssecond = "전체"}) {
    // print([sstate , slevel, scategory, sfirst, ssecond, spresenter]);
    dashboard = data.where((element) {
      return (sstate == "전체" || element.state == sstate) &&
          (spresenter == "전체" || element.presenter == spresenter) &&
          (slevel == "전체" || element.level.toString() == slevel) &&
          (scategory == "전체" || element.category == scategory) &&
          (sfirst == "전체" || element.firstInspector == sfirst) &&
          (ssecond == "전체" || element.secondInspector == ssecond);
    }).toList();
    // print(dashboard.map(
    //   (e) => e.title,
    // ));
    notifyListeners();
  }

  void toWaitings(data) {
    List<Review> temp = [];
    for (Review d in data) {
      print(d.presenter);
      print(userName);
      if ((d.state == "1차 리뷰 중" || d.state == "2차 리뷰 중") &&
          d.presenter + "@grepp.co" == userName) {
        temp.add(d);
      }
    }
    watings = temp;
    notifyListeners();
  }

  void toReflections(data) {
    List<Review> temp = [];
    for (Review d in data) {
      print(d.presenter);
      print(userName);
      if ((d.state == "1차 반영 중" || d.state == "2차 반영 중") &&
          d.presenter + "@grepp.co" == userName) {
        temp.add(d);
      }
    }
    reflections = temp;
    notifyListeners();
  }

  void toReviews(data) {
    List<Review> temp = [];
    for (Review d in data) {
      if ((d.state == "1차 리뷰 중" &&
              d.firstInspector + "@grepp.co" == userName) ||
          (d.state == "2차 리뷰 중" &&
              d.secondInspector + "@grepp.co" == userName)) {
        temp.add(d);
      }
    }
    reviews = temp;
    notifyListeners();
  }

  Future<void> addReview(Review review) async {
    await _db.collection('review').add(review.toSnapshot());
  }

  void setTitle(data) {
    title = data;
    notifyListeners();
  }

  void setPresenter(data) {
    presenter = data;
    notifyListeners();
  }

  void setLevel(data) {
    level = data;
    notifyListeners();
  }

  void setCategory(data) {
    category = data;
    notifyListeners();
  }

  void setChallengeUrl(data) {
    challengeUrl = data;
    notifyListeners();
  }

  void setFirstinspector(data) {
    firstInspector = data;
    notifyListeners();
  }

  void setFirstinspectUrl(data) {
    firstInspectUrl = data;
    notifyListeners();
  }

  void setSecondinspector(data) {
    secondInspector = data;
    notifyListeners();
  }

  void setSecondinspectUrl(data) {
    secondInspectUrl = data;
    notifyListeners();
  }
}
