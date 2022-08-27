import 'package:flutter/material.dart';
import 'package:la_vie/utils/screen.dart';

import '../../../utils/color.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
                padding: EdgeInsets.only(top: 34, bottom: 20),
                child: Text("Notification",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 19))),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            (8 / Screen.screenWidth) * Screen.screenWidth),
                    child: ListTile(
                        title: const Text(
                          "Joy Arnold left 6 comments on Your Post",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        subtitle: const Text(
                          "Yesterday at 11:42 PM",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                        leading: CircleAvatar(
                            child: Image.asset(
                          "assets/images/1.png",
                          color: Colors.white,
                        ))),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 2,
                    color: AppColors.customGrey,
                  );
                },
                itemCount: 15),
          )
        ],
      ),
    );
  }
}
