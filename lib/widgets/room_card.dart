import 'package:club_house_ui/models/room.dart';
import 'package:club_house_ui/screens/room_screen.dart';
import 'package:club_house_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => RoomScreen(room: room),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //room club title
                Row(
                  children: [
                    Text(
                      room.club.toUpperCase(),
                      style: Theme.of(context).textTheme.overline!.copyWith(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.0,
                          ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Icon(Icons.home, color: Colors.teal),
                  ],
                ),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    //images
                    Expanded(
                      child: Container(
                        height: 100,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 50,
                              top: 30,
                              child: UserProfileImage(
                                  imageUrl: room.speakers[0].imageURL,
                                  size: 45),
                            ),
                            Positioned(
                              top: 35,
                              right: 50,
                              child: UserProfileImage(
                                  imageUrl: room.speakers[1].imageURL,
                                  size: 45),
                            ),
                            Positioned(
                              top: 1,
                              left: 18,
                              child: UserProfileImage(
                                  imageUrl: room.speakers[2].imageURL,
                                  size: 45),
                            )
                          ],
                        ),
                      ),
                    ),
                    //names
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...room.speakers.map(
                            (e) => Text(
                              e.firstName + ' ' + e.lastName,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          SizedBox(height: 7),
                          //عدد كل المستخدمين
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                    text:
                                        '${room.followedBySpeakers.length + room.speakers.length + room.others.length} '),
                                WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.person_fill,
                                    size: 18,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                TextSpan(text: '  /  ${room.speakers.length} '),
                                WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.chat_bubble_fill,
                                    size: 18,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
