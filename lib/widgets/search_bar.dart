import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';

class CustomSearchBar extends StatelessWidget {
  final String placeholder;
  final String? value;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;

  const CustomSearchBar({
    super.key,
    required this.placeholder,
    this.value,
    this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: AppTheme.bodyMedium.copyWith(
            color: AppTheme.mutedForeground,
          ),
          prefixIcon: const Icon(
            LucideIcons.search,
            color: AppTheme.mutedForeground,
            size: 20,
          ),
          suffixIcon: value != null && value!.isNotEmpty
              ? IconButton(
                  onPressed: onClear,
                  icon: const Icon(
                    LucideIcons.x,
                    color: AppTheme.mutedForeground,
                    size: 20,
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}
