import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_card.dart';
import '../models/access_log.dart';
import '../models/device.dart';

class AccessLogPage extends StatefulWidget {
  const AccessLogPage({super.key});

  @override
  State<AccessLogPage> createState() => _AccessLogPageState();
}

class _AccessLogPageState extends State<AccessLogPage> {
  final List<AccessLog> _allLogs = [];
  List<AccessLog> _filteredLogs = [];
  
  // Filter states
  String? _selectedDeviceId;
  String _personnelName = '';
  DateTime? _fromDate;
  DateTime? _toDate;

  // Mock devices
  final List<Device> _devices = [
    Device(
      id: '1',
      label: 'Main Entrance',
      modelName: 'AC-2000',
      serialNumber: 'SN001234',
      currentIp: '192.168.1.100',
      mac: '00:11:22:33:44:55',
      status: DeviceStatus.online,
      lastModified: DateTime.now(),
    ),
    Device(
      id: '2',
      label: 'Back Door',
      modelName: 'AC-1500',
      serialNumber: 'SN001235',
      currentIp: '192.168.1.101',
      mac: '00:11:22:33:44:56',
      status: DeviceStatus.offline,
      lastModified: DateTime.now(),
    ),
    Device(
      id: '3',
      label: 'Office Door',
      modelName: 'AC-3000',
      serialNumber: 'SN001236',
      currentIp: '192.168.1.102',
      mac: '00:11:22:33:44:57',
      status: DeviceStatus.warning,
      lastModified: DateTime.now(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _loadAccessLogs();
  }

  void _loadAccessLogs() {
    // Mock data - replace with actual API call
    _allLogs.clear();
    _allLogs.addAll([
      AccessLog(
        id: '1',
        personnelName: 'John Doe',
        accessTime: DateTime.now().subtract(const Duration(hours: 2)),
        deviceId: '1',
        deviceName: 'Main Entrance',
        deviceSerial: 'SN001234',
        direction: AccessDirection.entry,
        location: 'Main Entrance',
      ),
      AccessLog(
        id: '2',
        personnelName: 'Jane Smith',
        accessTime: DateTime.now().subtract(const Duration(hours: 4)),
        deviceId: '2',
        deviceName: 'Back Door',
        deviceSerial: 'SN001235',
        direction: AccessDirection.exit,
        location: 'Back Door',
      ),
      AccessLog(
        id: '3',
        personnelName: 'Bob Johnson',
        accessTime: DateTime.now().subtract(const Duration(days: 1)),
        deviceId: '3',
        deviceName: 'Office Door',
        deviceSerial: 'SN001236',
        direction: AccessDirection.entry,
        location: 'Office Door',
      ),
    ]);
    _applyFilters();
  }

  void _applyFilters() {
    setState(() {
      _filteredLogs = _allLogs.where((log) {
        // Device filter
        if (_selectedDeviceId != null && _selectedDeviceId != 'all') {
          if (log.deviceId != _selectedDeviceId) return false;
        }

        // Personnel name filter
        if (_personnelName.isNotEmpty) {
          if (!log.personnelName.toLowerCase().contains(_personnelName.toLowerCase())) {
            return false;
          }
        }

        // Date range filter
        if (_fromDate != null) {
          if (log.accessTime.isBefore(_fromDate!)) return false;
        }
        if (_toDate != null) {
          final toDateEnd = DateTime(_toDate!.year, _toDate!.month, _toDate!.day, 23, 59, 59);
          if (log.accessTime.isAfter(toDateEnd)) return false;
        }

        return true;
      }).toList();
    });
  }

  void _clearFilters() {
    setState(() {
      _selectedDeviceId = null;
      _personnelName = '';
      _fromDate = null;
      _toDate = null;
    });
    _applyFilters();
  }

  Future<void> _exportLogs() async {
    // Simulate export functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Exporting access logs...'),
        backgroundColor: AppTheme.info,
      ),
    );

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Access logs exported as access-logs-${DateFormat('yyyy-MM-dd').format(DateTime.now())}.csv'),
          backgroundColor: AppTheme.success,
        ),
      );
    }
  }

  Color _getDirectionColor(AccessDirection direction) {
    switch (direction) {
      case AccessDirection.entry:
        return AppTheme.success;
      case AccessDirection.exit:
        return AppTheme.warning;
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
          // padding: const EdgeInsets.fromLTRB(0, 16, 0, 32),
          child: Column(
            children: [
              // Header Section
              Container(
                 padding: const EdgeInsets.fromLTRB(0, 16, 65, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Access Log',
                      style: AppTheme.heading2,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'View and monitor access control activities',
                      style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.mutedForeground,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Export Button
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _exportLogs,
                        icon: const Icon(LucideIcons.download, size: 18),
                        label: const Text('Export Logs'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Filters Card
              CustomCard(
                margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                child: Column(
                  children: [
                    const CustomCardHeader(
                      title: 'Filters',
                      icon: Icon(LucideIcons.filter, color: AppTheme.accent),
                    ),
                    
                    // Filter Fields
                    Column(
                      children: [
                        // Device Selection
                        DropdownButtonFormField<String>(
                          value: _selectedDeviceId,
                          decoration: const InputDecoration(
                            labelText: 'Device (SN)',
                            hintText: 'All devices',
                          ),
                          items: [
                            const DropdownMenuItem(
                              value: 'all',
                              child: Text('All devices'),
                            ),
                            ..._devices.map((device) {
                              return DropdownMenuItem(
                                value: device.id,
                                child: Text('${device.displayName} (${device.serialInfo})'),
                              );
                            }).toList(),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedDeviceId = value;
                            });
                            _applyFilters();
                          },
                        ),
                        const SizedBox(height: 16),

                        // Personnel Name
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Personnel Name',
                            hintText: 'Search by name...',
                          ),
                          onChanged: (value) {
                            setState(() {
                              _personnelName = value;
                            });
                            _applyFilters();
                          },
                        ),
                        const SizedBox(height: 16),

                        // From Date
                        InkWell(
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: _fromDate ?? DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime.now(),
                            );
                            if (date != null) {
                              setState(() {
                                _fromDate = date;
                              });
                              _applyFilters();
                            }
                          },
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              labelText: 'From Date',
                              hintText: 'Select from date',
                            ),
                            child: Text(
                              _fromDate != null
                                  ? DateFormat('MMM dd, yyyy').format(_fromDate!)
                                  : 'Select from date',
                              style: _fromDate != null
                                  ? AppTheme.bodyMedium
                                  : AppTheme.bodyMedium.copyWith(
                                      color: AppTheme.mutedForeground,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // To Date
                        InkWell(
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: _toDate ?? DateTime.now(),
                              firstDate: _fromDate ?? DateTime(2020),
                              lastDate: DateTime.now(),
                            );
                            if (date != null) {
                              setState(() {
                                _toDate = date;
                              });
                              _applyFilters();
                            }
                          },
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              labelText: 'To Date',
                              hintText: 'Select to date',
                            ),
                            child: Text(
                              _toDate != null
                                  ? DateFormat('MMM dd, yyyy').format(_toDate!)
                                  : 'Select to date',
                              style: _toDate != null
                                  ? AppTheme.bodyMedium
                                  : AppTheme.bodyMedium.copyWith(
                                      color: AppTheme.mutedForeground,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Filter Actions
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: _applyFilters,
                                icon: const Icon(LucideIcons.filter, size: 16),
                                label: const Text('Apply Filters'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: _clearFilters,
                                icon: const Icon(LucideIcons.x, size: 16),
                                label: const Text('Clear Filters'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Access Logs List
              _filteredLogs.isEmpty
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      child: CustomCard(
                        child: Column(
                          children: [
                            const SizedBox(height: 32),
                            const Icon(
                              LucideIcons.fileText,
                              size: 64,
                              color: AppTheme.mutedForeground,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No access logs found',
                              style: AppTheme.bodyLarge.copyWith(
                                color: AppTheme.mutedForeground,
                              ),
                            ),
                            const SizedBox(height: 32),
                          ],
                        ),
                      ),
                    )
                  : CustomCard(
                      margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                      child: Column(
                        children: [
                          const CustomCardHeader(
                            title: 'Access Logs',
                            icon: Icon(LucideIcons.fileText, color: AppTheme.accent),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _filteredLogs.length,
                            itemBuilder: (context, index) {
                              final log = _filteredLogs[index];
                              return _buildLogItem(log);
                            },
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

  Widget _buildLogItem(AccessLog log) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  log.personnelName,
                  style: AppTheme.labelLarge,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getDirectionColor(log.direction).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _getDirectionColor(log.direction).withOpacity(0.3),
                  ),
                ),
                child: Text(
                  log.direction.displayName,
                  style: AppTheme.labelSmall.copyWith(
                    color: _getDirectionColor(log.direction),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            log.formattedTime,
            style: AppTheme.bodySmall,
          ),
          const SizedBox(height: 4),
          Text(
            log.deviceInfo,
            style: AppTheme.bodySmall,
          ),
          const SizedBox(height: 4),
          Text(
            log.location,
            style: AppTheme.bodySmall.copyWith(
              color: AppTheme.mutedForeground,
            ),
          ),
        ],
      ),
    );
  }
}
