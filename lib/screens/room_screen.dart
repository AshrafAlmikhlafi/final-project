import 'dart:math';

import 'package:club_house_ui/models/room.dart';
import 'package:club_house_ui/widgets/room_user_profile.dart';
import 'package:club_house_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../data.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 130,
        leading: TextButton.icon(
          style: TextButton.styleFrom(primary: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(context);
          },
          icon: const Icon(
            CupertinoIcons.back,
          ),
          label: const Text(
            'go back',
          ),
        ),
        actions: [
          IconButton(
            color: kIconColor,
            iconSize: 30,
            icon: const Icon(CupertinoIcons.doc),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: UserProfileImage(
              imageUrl: currentUser.imageURL,
              size: 45,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            room.club,
                            style:
                                Theme.of(context).textTheme.overline!.copyWith(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.0,
                                    ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Icon(
                            CupertinoIcons.home,
                            color: Colors.teal,
                          ),
                        ],
                      ),
                      Icon(CupertinoIcons.ellipsis),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    room.name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                  ),
                ],
              ),
            ),
            //speakers
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 0,
                children: room.speakers
                    .map((e) => RoomUserProfile(
                          name: e.firstName,
                          imageUrl: e.imageURL,
                          size: 66,
                          isNew: Random().nextBool(),
                          isMuted: Random().nextBool(),
                        ))
                    .toList(growable: true),
              ),
            ),
            //Followed By Speakers
            SliverToBoxAdapter(
              child: Text(
                'Followed By Speakers',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
              ),
            ),
            //Followed By Speakers
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.7,
                children: room.followedBySpeakers
                    .map((e) => RoomUserProfile(
                          name: e.firstName,
                          imageUrl: e.imageURL,
                          size: 66,
                          isNew: Random().nextBool(),
                        ))
                    .toList(growable: true),
              ),
            ),
            //others
            SliverToBoxAdapter(
              child: Text(
                'Followed By Others',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
              ),
            ),
            //others
            SliverPadding(
              padding: const EdgeInsets.all(10),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.7,
                children: room.others
                    .map((e) => RoomUserProfile(
                          name: e.firstName,
                          imageUrl: e.imageURL,
                          size: 66,
                          isNew: Random().nextBool(),
                        ))
                    .toList(growable: true),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                '✌🏽 Leave quietly',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(12),
                backgroundColor: Colors.grey[300],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      CupertinoIcons.add,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      CupertinoIcons.hand_raised,
                      size: 30,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
