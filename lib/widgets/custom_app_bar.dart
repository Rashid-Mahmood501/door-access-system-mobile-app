import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onLogout;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTheme.heading3,
      ),
      actions: [
        if (onLogout != null) ...[
          IconButton(
            onPressed: onLogout,
            icon: const Icon(LucideIcons.logOut),
            tooltip: 'Logout',
          ),
        ],
        ...?actions,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
