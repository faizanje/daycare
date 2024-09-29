import 'package:daycare/core/app_colors.dart';
import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({super.key, required this.title, this.trailing, this.leading, this.onTap});

  final Widget title;
  final Widget? trailing;
  final Widget? leading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      child: ListTile(
        title: DefaultTextStyle.merge(
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
          ),
          child: title,
        ),
        leading: leading != null
            ? IconTheme.merge(
                data: const IconThemeData(size: 20),
                child: leading!,
              )
            : null,
        visualDensity: VisualDensity.compact,
        minLeadingWidth: 16,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}

class DrawerExpansionListTile extends StatefulWidget {
  const DrawerExpansionListTile({
    super.key,
    required this.title,
    this.trailing,
    this.leading,
    this.onTap,
    required this.children,
  });

  final Widget title;
  final Widget? trailing;
  final Widget? leading;
  final VoidCallback? onTap;
  final List<Widget> children;

  @override
  State<DrawerExpansionListTile> createState() => _DrawerExpansionListTileState();
}

class _DrawerExpansionListTileState extends State<DrawerExpansionListTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: DefaultTextStyle.merge(
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w900,
        ),
        child: widget.title,
      ),
      tilePadding: const EdgeInsets.symmetric(horizontal: 0),
      backgroundColor: AppColors.blue,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.blue,
          width: 0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),

      leading: widget.leading != null
          ? IconTheme.merge(
              data: const IconThemeData(size: 20),
              child: widget.leading!,
            )
          : null,
      visualDensity: VisualDensity.compact,
      // minLeadingWidth: 16,
      dense: true,
      // contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      trailing: widget.trailing,
      children: widget.children,
      // onTap: onTap,
    );
  }
}
