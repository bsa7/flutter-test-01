import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hw_4/src/models/user.dart';
import 'package:hw_4/src/views/shared/user_circle_avatar.dart';

class UserCachedAvatar extends StatelessWidget {
  const UserCachedAvatar({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return user.photoUrl != null ? CachedNetworkImage(
      imageUrl: user.photoUrl,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) {
        return UserCircleAvatar(user: user);
      }
    ) : UserCircleAvatar(user: user);
  }
}
