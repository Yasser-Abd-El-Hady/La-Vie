import 'package:flutter/material.dart';
import 'package:la_vie/provider/all_forums_provider.dart';
import 'package:la_vie/provider/forums.dart';
import 'package:la_vie/provider/my_forums_provider.dart';
import 'package:la_vie/utils/color.dart';
import 'package:la_vie/utils/constants.dart';
import 'package:la_vie/utils/my_icons_icons.dart';
import 'package:la_vie/utils/screen.dart';
import 'package:la_vie/views/components/forums.dart';
import 'package:la_vie/views/screens/forums_screens/craete_post_screen.dart';
import 'package:provider/provider.dart';

import '../../components/custom_text.dart';

class DiscussionForumsScreen extends StatelessWidget {
  const DiscussionForumsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Screen(context);
    final providerAll = Provider.of<AllForumsProvider>(context).allForums;
    final providerMy = Provider.of<MyForumsProvider>(context).myForums;
    dynamic provider = Provider.of<AllForumsProvider>(context).allForums;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Screen.screenWidth / (428 / 24),
              vertical: Screen.screenHeight / (926 / 50)),
          child: Column(
            children: [
              customText(
                text: "Discussion Forums",
                fontWeight: FontWeight.w700,
                fontSize: 21,
              ),
              Padding(
                padding: EdgeInsets.only(top: Screen.screenHeight / (926 / 30)),
                child: Material(
                  elevation: 0.5,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Align(
                      alignment: Alignment.center,
                      child: TextField(
                        decoration: InputDecoration(
                            icon:
                                Icon(Icons.search, color: AppColors.customGrey),
                            hintText: 'Search',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: Screen.screenHeight / (926 / 15),
                      bottom: Screen.screenHeight / (926 / 22)),
                  child: forumsType(type: "all", context: context)),
              Expanded(
                child: (Provider.of<ForumsType>(context, listen: false)
                                    .pageSelected ==
                                "all" &&
                            providerAll.isEmpty) ||
                        (Provider.of<ForumsType>(context, listen: false)
                                    .pageSelected !=
                                "all" &&
                            providerMy.isEmpty)
                    ? Center(
                        child: customText(
                            text: "No Posts Founded",
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            textAlign: TextAlign.center))
                    : ListView.builder(
                        itemCount:
                            Provider.of<ForumsType>(context, listen: false)
                                        .pageSelected ==
                                    "all"
                                ? providerAll.length
                                : providerMy.length,
                        itemBuilder: (context, index) {
                          Provider.of<ForumsType>(context, listen: false)
                                      .pageSelected ==
                                  "all"
                              ? provider = providerAll
                              : provider = providerMy;
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: Screen.screenHeight / (926 / 20)),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.4, color: AppColors.primary)),
                              child: SizedBox(
                                width: Screen.screenWidth / (428 / 380),
                                height: Screen.screenHeight / (926 / 420),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height:
                                            Screen.screenHeight / (926 / 300),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.2,
                                                color: AppColors.customGrey)),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: Screen.screenHeight /
                                                        (926 / 15),
                                                    left: Screen.screenWidth /
                                                        (428 / 14)),
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                        radius: 25,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                provider[index]
                                                                    .user!
                                                                    .imageUrl!)),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: Screen
                                                                  .screenWidth /
                                                              (428 / 12)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          customText(
                                                              text:
                                                                  "${provider[index].user!.firstName!} ${provider[index].user!.lastName!}",
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                          SizedBox(
                                                              height: Screen
                                                                      .screenHeight /
                                                                  (926 / 8)),
                                                          customText(
                                                              text:
                                                                  "a month ago",
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .customGrey)
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    top: Screen.screenHeight /
                                                        (926 / 10),
                                                    left: Screen.screenWidth /
                                                        (428 / 8)),
                                                child: SizedBox(
                                                  height: Screen.screenHeight /
                                                      (926 / 70),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      customText(
                                                          text: provider[index]
                                                              .title!,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: AppColors
                                                              .primary),
                                                      SizedBox(
                                                          height: Screen
                                                                  .screenHeight /
                                                              (926 / 3)),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 5),
                                                        child: customText(
                                                            text: provider[
                                                                    index]
                                                                .description!,
                                                            overflow:
                                                                TextOverflow
                                                                    .clip,
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: AppColors
                                                                .customGrey),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                  child: Image.network(
                                                url + provider[index].imageUrl!,
                                                fit: BoxFit.cover,
                                              ))
                                            ]),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top:
                                              Screen.screenHeight / (926 / 12)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Screen.screenWidth / (428 / 5)),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            children: [
                                              const Icon(MyIcons.like),
                                              SizedBox(
                                                  width: Screen.screenWidth /
                                                      (428 / 8)),
                                              customText(
                                                  text:
                                                      "${provider[index].forumLikes!.length} Likes",
                                                  color: AppColors.customGrey),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: Screen.screenWidth /
                                                          (428 / 40)),
                                                  child: customText(
                                                      text:
                                                          "${provider[index].forumComments!.length} Replies",
                                                      color:
                                                          AppColors.customGrey,
                                                      fontWeight:
                                                          FontWeight.w400))
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreatePostScreen()));
        },
        child: const Icon(Icons.add),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
