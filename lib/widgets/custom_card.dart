import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;

  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(16),
      child: Card(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: padding ?? const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ),
    );
  }
}

class CustomCardHeader extends StatelessWidget {
  final String title;
  final Widget? icon;
  final Widget? action;
  final String? subtitle;

  const CustomCardHeader({
    super.key,
    required this.title,
    this.icon,
    this.action,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Text(
                title,
                style: AppTheme.heading3,
              ),
            ),
            if (action != null) action!,
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subtitle!,
            style: AppTheme.bodySmall,
          ),
        ],
        const SizedBox(height: 16),
      ],
    );
  }
}
