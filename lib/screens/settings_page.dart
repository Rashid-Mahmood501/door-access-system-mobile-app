import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_card.dart';
import '../models/access_config.dart';
import '../l10n/generated/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<AccessConfig> _accessConfigs = [];
  List<AccessConfig> _originalConfigs = [];
  bool _hasChanges = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadAccessConfigs();
  }

  void _loadAccessConfigs() {
    // Mock data - replace with actual API call
    _accessConfigs = [
      // Admin (non-editable)
      AccessConfig(
        id: '1',
        accessGroup: 'admin',
        timeSlots: [
          TimeSlot(from: '00:00', to: '23:59'),
          TimeSlot(from: '00:00', to: '23:59'),
          TimeSlot(from: '00:00', to: '23:59'),
          TimeSlot(from: '00:00', to: '23:59'),
          TimeSlot(from: '00:00', to: '23:59'),
        ],
        dayAccess: {
          DayOfWeek.sunday: true,
          DayOfWeek.monday: true,
          DayOfWeek.tuesday: true,
          DayOfWeek.wednesday: true,
          DayOfWeek.thursday: true,
          DayOfWeek.friday: true,
          DayOfWeek.saturday: true,
        },
        isEditable: false,
      ),
      // Employee (editable)
      AccessConfig(
        id: '2',
        accessGroup: 'employee',
        timeSlots: [
          TimeSlot(from: '08:00', to: '17:00'),
          TimeSlot(from: '08:00', to: '17:00'),
          TimeSlot(from: '08:00', to: '17:00'),
          TimeSlot(from: '08:00', to: '17:00'),
          TimeSlot(from: '08:00', to: '17:00'),
        ],
        dayAccess: {
          DayOfWeek.sunday: false,
          DayOfWeek.monday: true,
          DayOfWeek.tuesday: true,
          DayOfWeek.wednesday: true,
          DayOfWeek.thursday: true,
          DayOfWeek.friday: true,
          DayOfWeek.saturday: false,
        },
        isEditable: true,
      ),
      // Contractor (editable)
      AccessConfig(
        id: '3',
        accessGroup: 'contractor',
        timeSlots: [
          TimeSlot(from: '09:00', to: '16:00'),
          TimeSlot(from: '09:00', to: '16:00'),
          TimeSlot(from: '09:00', to: '16:00'),
          TimeSlot(from: '09:00', to: '16:00'),
          TimeSlot(from: '09:00', to: '16:00'),
        ],
        dayAccess: {
          DayOfWeek.sunday: false,
          DayOfWeek.monday: true,
          DayOfWeek.tuesday: true,
          DayOfWeek.wednesday: true,
          DayOfWeek.thursday: true,
          DayOfWeek.friday: true,
          DayOfWeek.saturday: false,
        },
        isEditable: true,
      ),
      // Visitor (editable)
      AccessConfig(
        id: '4',
        accessGroup: 'visitor',
        timeSlots: [
          TimeSlot(from: '10:00', to: '15:00'),
          TimeSlot(from: '10:00', to: '15:00'),
          TimeSlot(from: '10:00', to: '15:00'),
          TimeSlot(from: '10:00', to: '15:00'),
          TimeSlot(from: '10:00', to: '15:00'),
        ],
        dayAccess: {
          DayOfWeek.sunday: false,
          DayOfWeek.monday: true,
          DayOfWeek.tuesday: true,
          DayOfWeek.wednesday: true,
          DayOfWeek.thursday: true,
          DayOfWeek.friday: true,
          DayOfWeek.saturday: false,
        },
        isEditable: true,
      ),
      // Guest (non-editable)
      AccessConfig(
        id: '5',
        accessGroup: 'guest',
        timeSlots: [
          TimeSlot(from: '08:00', to: '18:00'),
          TimeSlot(from: '08:00', to: '18:00'),
          TimeSlot(from: '08:00', to: '18:00'),
          TimeSlot(from: '08:00', to: '18:00'),
          TimeSlot(from: '08:00', to: '18:00'),
        ],
        dayAccess: {
          DayOfWeek.sunday: true,
          DayOfWeek.monday: true,
          DayOfWeek.tuesday: true,
          DayOfWeek.wednesday: true,
          DayOfWeek.thursday: true,
          DayOfWeek.friday: true,
          DayOfWeek.saturday: true,
        },
        isEditable: false,
      ),
    ];

    _originalConfigs = _accessConfigs.map((config) => config.copyWith()).toList();
  }

  void _updateAccessGroup(int index, String newName) {
    if (!_accessConfigs[index].isEditable) return;

    setState(() {
      _accessConfigs[index] = _accessConfigs[index].copyWith(accessGroup: newName);
      _checkForChanges();
    });
  }

  void _updateTimeSlot(int configIndex, int slotIndex, String from, String to) {
    if (!_accessConfigs[configIndex].isEditable) return;

    final newTimeSlots = List<TimeSlot>.from(_accessConfigs[configIndex].timeSlots);
    newTimeSlots[slotIndex] = TimeSlot(from: from, to: to);

    setState(() {
      _accessConfigs[configIndex] = _accessConfigs[configIndex].copyWith(timeSlots: newTimeSlots);
      _checkForChanges();
    });
  }

  void _updateDayAccess(int configIndex, String day, bool hasAccess) {
    if (!_accessConfigs[configIndex].isEditable) return;

    final newDayAccess = Map<String, bool>.from(_accessConfigs[configIndex].dayAccess);
    newDayAccess[day] = hasAccess;

    setState(() {
      _accessConfigs[configIndex] = _accessConfigs[configIndex].copyWith(dayAccess: newDayAccess);
      _checkForChanges();
    });
  }

  void _checkForChanges() {
    bool hasChanges = false;
    for (int i = 0; i < _accessConfigs.length; i++) {
      if (_accessConfigs[i].accessGroup != _originalConfigs[i].accessGroup ||
          _accessConfigs[i].timeSlots != _originalConfigs[i].timeSlots ||
          _accessConfigs[i].dayAccess != _originalConfigs[i].dayAccess) {
        hasChanges = true;
        break;
      }
    }
    setState(() {
      _hasChanges = hasChanges;
    });
  }

  String _getDayAbbreviation(String day) {
    switch (day) {
      case 'sunday':
        return AppLocalizations.of(context)!.sunday;
      case 'monday':
        return AppLocalizations.of(context)!.monday;
      case 'tuesday':
        return AppLocalizations.of(context)!.tuesday;
      case 'wednesday':
        return AppLocalizations.of(context)!.wednesday;
      case 'thursday':
        return AppLocalizations.of(context)!.thursday;
      case 'friday':
        return AppLocalizations.of(context)!.friday;
      case 'saturday':
        return AppLocalizations.of(context)!.saturday;
      default:
        return day.substring(0, 3);
    }
  }

  String _getAccessGroupName(String accessGroup) {
    switch (accessGroup.toLowerCase()) {
      case 'admin':
        return AppLocalizations.of(context)!.admin;
      case 'employee':
        return AppLocalizations.of(context)!.employee;
      case 'contractor':
        return AppLocalizations.of(context)!.contractor;
      case 'visitor':
        return AppLocalizations.of(context)!.visitor;
      case 'guest':
        return AppLocalizations.of(context)!.guest;
      default:
        return accessGroup;
    }
  }

  void _cancelChanges() {
    setState(() {
      _accessConfigs = _originalConfigs.map((config) => config.copyWith()).toList();
      _hasChanges = false;
    });
  }

  Future<void> _saveChanges() async {
    setState(() {
      _isSaving = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isSaving = false;
      _originalConfigs = _accessConfigs.map((config) => config.copyWith()).toList();
      _hasChanges = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.configurationSavedSuccessfully),
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
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.settings,
                      style: AppTheme.heading2,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppLocalizations.of(context)!.appSettings,
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.mutedForeground,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Configuration Table
              CustomCard(
                margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                child: Column(
                  children: [
                    // Scrollable Table Content
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: [
                          // Table Header
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppTheme.background,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              border: Border.all(color: AppTheme.border),
                            ),
                            child: _buildTableHeader(),
                          ),

                          // Table Body
                          Column(
                            children: _accessConfigs.asMap().entries.map((entry) {
                              final index = entry.key;
                              final config = entry.value;
                              return _buildTableRow(index, config);
                            }).toList(),
                          ),
                        ],
                      ),
                    ),

                    // Action Buttons
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.background,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        border: Border.all(color: AppTheme.border),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: _hasChanges && !_isSaving ? _cancelChanges : null,
                              child: Text(AppLocalizations.of(context)!.cancel),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _hasChanges && !_isSaving ? _saveChanges : null,
                              child: _isSaving
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor: AlwaysStoppedAnimation<Color>(
                                              AppTheme.accentForeground,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(AppLocalizations.of(context)!.saving),
                                      ],
                                    )
                                  : Text(AppLocalizations.of(context)!.save),
                            ),
                          ),
                        ],
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

  Widget _buildTableHeader() {
    return Row(
      children: [
        // NO. column
        SizedBox(
          width: 50,
          child: Text(
            AppLocalizations.of(context)!.no,
            style: AppTheme.labelMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 16),

        // Access Group column
        SizedBox(
          width: 100,
          child: Text(
            AppLocalizations.of(context)!.accessGroup,
            style: AppTheme.labelMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 16),

        // Time Slots columns
        ...List.generate(5, (index) {
          return Row(
            children: [
              SizedBox(
                width: 80,
                child: Text(
                  AppLocalizations.of(context)!.time(index + 1),
                  style: AppTheme.labelMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          );
        }),

        // Day columns
        ...DayOfWeek.all.map((day) {
          return Row(
            children: [
              SizedBox(
                width: 40,
                child: Text(
                  _getDayAbbreviation(day),
                  style: AppTheme.labelMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 8),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildTableRow(int index, AccessConfig config) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: config.isEditable ? AppTheme.cardBackground : AppTheme.background.withOpacity(0.5),
        border: Border(
          bottom: BorderSide(color: AppTheme.border),
        ),
      ),
      child: Row(
        children: [
          // NO. column
          SizedBox(
            width: 50,
            child: Text(
              '${index + 1}',
              style: AppTheme.bodyMedium.copyWith(
                color: config.isEditable ? AppTheme.foreground : AppTheme.mutedForeground,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Access Group column
          SizedBox(
            width: 100,
            child: config.isEditable
                ? TextFormField(
                    initialValue: config.accessGroup,
                    style: AppTheme.bodyMedium,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) => _updateAccessGroup(index, value),
                  )
                : Text(
                    _getAccessGroupName(config.accessGroup),
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.mutedForeground,
                    ),
                  ),
          ),
          const SizedBox(width: 16),

          // Time Slots columns
          ...List.generate(5, (slotIndex) {
            return Row(
              children: [
                SizedBox(
                  width: 80,
                  child: config.isEditable
                      ? Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                initialValue: config.timeSlots[slotIndex].from,
                                style: AppTheme.bodySmall,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                  border: const OutlineInputBorder(),
                                  hintText: AppLocalizations.of(context)!.hhmm,
                                ),
                                onChanged: (value) => _updateTimeSlot(
                                  index,
                                  slotIndex,
                                  value,
                                  config.timeSlots[slotIndex].to,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: TextFormField(
                                initialValue: config.timeSlots[slotIndex].to,
                                style: AppTheme.bodySmall,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                  border: const OutlineInputBorder(),
                                  hintText: AppLocalizations.of(context)!.hhmm,
                                ),
                                onChanged: (value) => _updateTimeSlot(
                                  index,
                                  slotIndex,
                                  config.timeSlots[slotIndex].from,
                                  value,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Text(
                          config.timeSlots[slotIndex].displayText,
                          style: AppTheme.bodySmall.copyWith(
                            color: AppTheme.mutedForeground,
                          ),
                        ),
                ),
                const SizedBox(width: 8),
              ],
            );
          }),

          // Day columns
          ...DayOfWeek.all.map((day) {
            return Row(
              children: [
                SizedBox(
                  width: 40,
                  child: Checkbox(
                    value: config.dayAccess[day] ?? false,
                    onChanged: config.isEditable
                        ? (value) => _updateDayAccess(index, day, value ?? false)
                        : null,
                    activeColor: AppTheme.accent,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            );
          }),
        ],
      ),
    );
  }
}
