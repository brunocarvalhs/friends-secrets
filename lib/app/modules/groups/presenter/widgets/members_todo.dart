import 'package:flutter/material.dart';
import 'package:friends_secrets/app/modules/login/domain/entities/logged_user_info.dart';

class MembersTodo extends StatelessWidget {
  final LoggedUserInfo user;

  const MembersTodo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      semanticContainer: false,
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage("${user.photoUrl}"),
              ),
              title: Text("${user.name}"),
            ),
          ],
        ),
      ),
    );
  }
}
