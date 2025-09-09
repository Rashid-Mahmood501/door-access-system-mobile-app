import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../l10n/generated/app_localizations.dart';
import '../theme/app_theme.dart';
import 'devices_page.dart';
import 'personnel_page.dart';
import 'access_log_page.dart';
import 'backup_page.dart';
import 'settings_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const DevicesPage(),
    const PersonnelPage(),
    const AccessLogPage(),
    const BackupPage(),
    const SettingsPage(),
  ];

  List<NavigationItem> _getNavigationItems(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return [
      NavigationItem(
        icon: LucideIcons.smartphone,
        label: l10n.devices,
        route: '/devices',
      ),
      NavigationItem(
        icon: LucideIcons.users,
        label: l10n.personnel,
        route: '/personnel',
      ),
      NavigationItem(
        icon: LucideIcons.fileText,
        label: l10n.accessLog,
        route: '/access-log',
      ),
      NavigationItem(
        icon: LucideIcons.hardDrive,
        label: l10n.backup,
        route: '/backup',
      ),
      NavigationItem(
        icon: LucideIcons.settings,
        label: l10n.settings,
        route: '/settings',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppTheme.cardBackground,
          selectedItemColor: AppTheme.accent,
          unselectedItemColor: AppTheme.mutedForeground,
          selectedLabelStyle: AppTheme.labelMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: AppTheme.labelMedium,
          items: _getNavigationItems(context).map((item) {
            return BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            );
          }).toList(),
        ),
    );
  }
}

class NavigationItem {
  final IconData icon;
  final String label;
  final String route;

  NavigationItem({
    required this.icon,
    required this.label,
    required this.route,
  });
}
