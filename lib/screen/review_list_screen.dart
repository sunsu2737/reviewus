import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review/dialog/review_dialog.dart';
import 'package:review/models/review_view_model.dart';

class ReviewListScreen extends StatelessWidget {
  const ReviewListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("리뷰 목록"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 500,
          child: ListView.builder(
            itemCount: reviewProvider.reviews.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () =>
                    reviewDialog(context, reviewProvider.reviews[index]),
                title: Text(
                  reviewProvider.reviews[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Text(reviewProvider.reviews[index].state),
              );
            },
          ),
        ),
      ),
    );
  }
}
