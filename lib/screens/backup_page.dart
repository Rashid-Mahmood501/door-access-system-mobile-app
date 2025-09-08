import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:file_picker/file_picker.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_card.dart';
import '../l10n/generated/app_localizations.dart';

class BackupPage extends StatefulWidget {
  const BackupPage({super.key});

  @override
  State<BackupPage> createState() => _BackupPageState();
}

class _BackupPageState extends State<BackupPage> {
  bool _isCreatingBackup = false;
  bool _isRestoring = false;
  bool _isSavingConfig = false;
  bool _enableDailyBackup = false;
  TimeOfDay _backupTime = const TimeOfDay(hour: 2, minute: 0);
  String _backupPath = '/backups/system';
  String? _selectedBackupFile;

  Future<void> _createBackup() async {
    setState(() {
      _isCreatingBackup = true;
    });

    // Simulate backup creation
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _isCreatingBackup = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.backupCreated),
          backgroundColor: AppTheme.success,
        ),
      );
    }
  }

  Future<void> _uploadBackupFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['zip', 'tar', 'gz'],
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _selectedBackupFile = result.files.first.name;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error selecting backup file: $e'),
          backgroundColor: AppTheme.error,
        ),
      );
    }
  }

  Future<void> _restoreBackup() async {
    if (_selectedBackupFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a backup file first'),
          backgroundColor: AppTheme.warning,
        ),
      );
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Restore'),
        content: const Text(
          'Are you sure you want to restore from the uploaded backup file? This action will overwrite current data and cannot be undone.',
        ),
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.accent,
            ),
            child: const Text('Confirm Restore'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      setState(() {
        _isRestoring = true;
      });

      // Simulate restore process
      await Future.delayed(const Duration(seconds: 4));

      setState(() {
        _isRestoring = false;
        _selectedBackupFile = null;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Backup restored successfully'),
            backgroundColor: AppTheme.success,
          ),
        );
      }
    }
  }

  Future<void> _selectBackupTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _backupTime,
    );

    if (time != null) {
      setState(() {
        _backupTime = time;
      });
    }
  }

  Future<void> _saveConfiguration() async {
    setState(() {
      _isSavingConfig = true;
    });

    // Simulate save process
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isSavingConfig = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Configuration saved successfully'),
          backgroundColor: AppTheme.success,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        imagePath: 'Assets/hkezit-logo.png',
        onLogout: null, // Add logout functionality
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 65, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.backup,
                      style: AppTheme.heading2,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppLocalizations.of(context)!.backupAndRestore,
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.mutedForeground,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Actions Card
              CustomCard(
                margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                child: Column(
                  children: [
                    const CustomCardHeader(
                      title: 'Actions',
                      icon: Icon(LucideIcons.settings, color: AppTheme.accent),
                    ),
                    
                    // Restore Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.background,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppTheme.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Restore from Backup',
                            style: AppTheme.labelLarge,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: _uploadBackupFile,
                                  icon: const Icon(LucideIcons.upload, size: 16),
                                  label: const Text('Upload Backup File'),
                                ),
                              ),
                            ],
                          ),
                          if (_selectedBackupFile != null) ...[
                            const SizedBox(height: 12),
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppTheme.success.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppTheme.success.withOpacity(0.3),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    LucideIcons.check,
                                    color: AppTheme.success,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      _selectedBackupFile!,
                                      style: AppTheme.bodySmall.copyWith(
                                        color: AppTheme.success,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: _isRestoring ? null : _restoreBackup,
                                icon: _isRestoring
                                    ? const SizedBox(
                                        width: 16,
                                        height: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation<Color>(
                                            AppTheme.accentForeground,
                                          ),
                                        ),
                                      )
                                    : const Icon(LucideIcons.upload, size: 16),
                                label: Text(_isRestoring ? 'Restoring...' : AppLocalizations.of(context)!.restoreBackup),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Create Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.background,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppTheme.border),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.createBackup,
                            style: AppTheme.labelLarge,
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: _isCreatingBackup ? null : _createBackup,
                              icon: _isCreatingBackup
                                  ? const SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          AppTheme.accentForeground,
                                        ),
                                      ),
                                    )
                                  : const Icon(LucideIcons.download, size: 16),
                              label: Text(_isCreatingBackup ? 'Creating Backup...' : 'Backup Now'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Configuration Card
              CustomCard(
                margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                child: Column(
                  children: [
                    const CustomCardHeader(
                      title: 'Configuration',
                      icon: Icon(LucideIcons.settings, color: AppTheme.accent),
                    ),
                    
                    // Enable Daily Backup
                    Row(
                      children: [
                        Checkbox(
                          value: _enableDailyBackup,
                          onChanged: (value) {
                            setState(() {
                              _enableDailyBackup = value ?? false;
                            });
                          },
                          activeColor: AppTheme.accent,
                        ),
                        const Text('Enable Daily Backup'),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Backup Time
                    InkWell(
                      onTap: _selectBackupTime,
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Backup Time (24H)',
                        ),
                        child: Text(
                          _backupTime.format(context),
                          style: AppTheme.bodyMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Backup Path
                    TextFormField(
                      initialValue: _backupPath,
                      decoration: const InputDecoration(
                        labelText: 'Backup Path',
                        hintText: '/backups/system',
                      ),
                      onChanged: (value) {
                        _backupPath = value;
                      },
                    ),
                    const SizedBox(height: 24),

                    // Save Configuration Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _isSavingConfig ? null : _saveConfiguration,
                        icon: _isSavingConfig
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppTheme.accentForeground,
                                  ),
                                ),
                              )
                            : const Icon(LucideIcons.settings, size: 16),
                        label: Text(_isSavingConfig ? 'Save Configuration...' : 'Save Configuration'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
