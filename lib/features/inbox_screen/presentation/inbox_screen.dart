import 'package:course_learning/core/helpers/snackbar_helper.dart';
import 'package:course_learning/features/inbox_screen/widget/card_inbox.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime targetTime = DateTime(2025, 11, 12, 7, 0);

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Padding(
        padding: EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Inbox",
                  style: AppStyles.bodyTextStyle.copyWith(fontSize: 30),
                ),
                GestureDetector(
                  onTap: () {
                    showCustomSnackbar(
                      context,
                      message: "Still Working on it",
                      isSuccess: false,
                    );
                  },
                  child: Icon(Icons.search, size: 25),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  shrinkWrap: false,
                  itemCount: 8,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        showCustomSnackbar(
                          context,
                          message: "Still Working on it",
                          isSuccess: false,
                        );
                      },
                      child: cardInbox(
                        "assets/images/person-${index + 1}.png",
                        "Ivani - ${index + 1}",
                        index + 1,
                        "Hello",
                        targetTime,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
