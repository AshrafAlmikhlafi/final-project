import 'package:club_house_ui/constants.dart';
import 'package:club_house_ui/data.dart';
import 'package:club_house_ui/widgets/room_card.dart';
import 'package:club_house_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          color: kIconColor,
          iconSize: 30,
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            color: kIconColor,
            iconSize: 26,
            icon: const Icon(
              CupertinoIcons.envelope_open,
            ),
            onPressed: () {},
          ),
          IconButton(
            color: kIconColor,
            iconSize: 30,
            icon: const Icon(CupertinoIcons.calendar),
            onPressed: () {},
          ),
          IconButton(
            color: kIconColor,
            iconSize: 30,
            icon: const Icon(CupertinoIcons.bell),
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
      body: Stack(alignment: Alignment.center, children: [
        ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100.0),
          children: [
            ...roomList.map((room) => RoomCard(room: room)),
          ],
        ),
        //the gradient
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                  Theme.of(context).scaffoldBackgroundColor,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        //the button
        Positioned(
          top: 600,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.add,
              size: 18,
              color: Colors.white,
            ),
            label: Text(
              'Start Room',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: kButtonColor,
              padding: EdgeInsets.all(
                15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
