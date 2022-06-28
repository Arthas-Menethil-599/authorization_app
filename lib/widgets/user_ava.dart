import 'package:flutter/material.dart';

import '../constants/app_assets.dart';

class UserAva extends StatelessWidget {
  const UserAva(
    this.url, {
    Key? key,
    this.margin,
    this.border,
    this.radius = 36.0,
  }) : super(key: key);

  final BoxBorder? border;
  final EdgeInsets? margin;
  final double radius;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: border,
      ),
      child: CircleAvatar(
        backgroundImage: url == null
            ? AssetImage(AppAssets.images.noAvatar) as ImageProvider
            : NetworkImage(url!),
        radius: radius,
      ),
    );
  }
}