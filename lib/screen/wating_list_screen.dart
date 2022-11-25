import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:review/dialog/wating_dialog.dart';
import 'package:review/models/review_view_model.dart';

class WatingListScreen extends StatelessWidget {
  const WatingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reviewProvider = Provider.of<ReviewProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("요청한 리뷰"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 500,
          child: ListView.builder(
            itemCount: reviewProvider.watings.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () =>
                    watingDialog(context, reviewProvider.watings[index]),
                title: Text(
                  reviewProvider.watings[index].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
