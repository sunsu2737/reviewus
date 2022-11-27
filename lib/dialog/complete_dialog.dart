import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review/models/review_model.dart';
import 'package:review/models/review_view_model.dart';

void completeDialog(context, Review review) {
  final reviewProvider = Provider.of<ReviewProvider>(context, listen: false);
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      alignment: Alignment.topCenter,
      content: Text("완료하시겠습니까?"),
      actions: [
        ElevatedButton(
            onPressed: () {
              reviewProvider.completeReview(review);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text("완료")),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("취소")),
      ],
    ),
  );
}
