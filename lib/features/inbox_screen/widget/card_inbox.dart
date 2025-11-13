import 'package:course_learning/utils/app_colors.dart';
import 'package:course_learning/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget cardInbox(
  String imageUser,
  String nameUser,
  int qtyChat,
  String lastChat,
  DateTime hours,
) {
  String formattedTime = DateFormat('hh:mm a').format(hours);
  return Container(
    padding: EdgeInsets.only(bottom: 5),
    margin: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 1, color: AppColors.greyColor)),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.mustardSoft,
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8),
            child: Image.asset(imageUser),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nameUser,
                    style: AppStyles.bodyTextStyle.copyWith(fontSize: 20),
                  ),
                  qtyChat == 0
                      ? SizedBox.shrink()
                      : Container(
                          height: 30,
                          width: 32,
                          // padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              qtyChat.toString(),
                              style: AppStyles.bodyTextStyle.copyWith(
                                fontSize: 14,
                                color: AppColors.lightText,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      lastChat,
                      style: AppStyles.bodyTextStyle.copyWith(fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    formattedTime,
                    style: AppStyles.bodyTextStyle.copyWith(
                      fontSize: 14,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
