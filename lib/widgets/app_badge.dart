import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart' hide Badge;

class AppBadge extends StatelessWidget {
  const AppBadge({
    super.key,
    required this.child,
    required this.badgeContent,
    this.showBadge = true,
  });

  final Widget child;
  final Widget badgeContent;
  final bool showBadge;
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      showBadge: showBadge,
      badgeContent: DefaultTextStyle.merge(
        child: badgeContent,
        style: const TextStyle(fontSize: 10, color: Colors.white),
      ),
      child: child,
    );
  }
}
