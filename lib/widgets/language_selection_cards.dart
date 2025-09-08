import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../l10n/generated/app_localizations.dart';
import '../theme/app_theme.dart';

class LanguageSelectionCards extends StatelessWidget {
  const LanguageSelectionCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.selectLanguage,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppTheme.foreground,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _LanguageCard(
                    locale: const Locale('zh', 'HK'),
                    title: '繁體中文',
                    subtitle: 'Traditional Chinese',
                    isSelected: languageProvider.currentLocale == const Locale('zh', 'HK'),
                    onTap: () => languageProvider.changeLanguage(const Locale('zh', 'HK')),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _LanguageCard(
                    locale: const Locale('en'),
                    title: 'English',
                    subtitle: 'English',
                    isSelected: languageProvider.currentLocale == const Locale('en'),
                    onTap: () => languageProvider.changeLanguage(const Locale('en')),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _LanguageCard extends StatelessWidget {
  final Locale locale;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageCard({
    required this.locale,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.accent : AppTheme.cardBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppTheme.accent : AppTheme.border,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isSelected ? AppTheme.accentForeground : AppTheme.foreground,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isSelected 
                    ? AppTheme.accentForeground.withOpacity(0.8)
                    : AppTheme.mutedForeground,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
