import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:review/dialog/reflection_dialog.dart';
import 'package:review/models/review_model.dart';
import 'package:review/models/review_view_model.dart';

class ReflectionListScreen extends StatelessWidget {
  const ReflectionListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider>(context);
    return StreamBuilder(
        stream: reviewProvider.getReviews(),
        builder: (context, AsyncSnapshot<List<Review>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Align(child: new CircularProgressIndicator()),
            );
          } else {
            reviewProvider.toReflections(snapshot.data);
            return Scaffold(
              appBar: AppBar(
                title: Text("반영할 리뷰"),
                centerTitle: true,
              ),
              body: Center(
                child: Container(
                  width: 500,
                  child: ListView.builder(
                    itemCount: reviewProvider.reflections.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () => reflectionDialog(
                            context, reviewProvider.reflections[index]),
                        title: Text(
                          reviewProvider.reflections[index].title,
                          textAlign: TextAlign.center,
                        ),
                        trailing: Text(reviewProvider.reflections[index].state),
                      );
                    },
                  ),
                ),
              ),
            );
          }
        });
  }
}
