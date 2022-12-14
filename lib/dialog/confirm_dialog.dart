import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review/models/review_view_model.dart';

void confirmDialog(context, id) {
  final reviewProvider = Provider.of<ReviewProvider>(context, listen: false);
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      alignment: Alignment.topCenter,
      content: Text("삭제하시겠습니까?"),
      actions: [
        ElevatedButton(
            onPressed: () {
              reviewProvider.deleteReview(id);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text("삭제")),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("취소")),
      ],
    ),
  );
}
