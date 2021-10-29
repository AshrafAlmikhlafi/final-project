import 'package:club_house_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageUrl;
  final double size;
  final String name;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfile(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.size,
      this.isNew = false,
      this.isMuted = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            //the profile image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserProfileImage(imageUrl: imageUrl, size: size),
            ),
            if (isNew)
              Positioned(
                bottom: 3,
                left: 10,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Icon(
                    CupertinoIcons.smiley,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
            if (isMuted)
              Positioned(
                bottom: 3,
                right: 3,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Icon(
                    CupertinoIcons.mic_slash_fill,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
          ],
        ),
        Flexible(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
