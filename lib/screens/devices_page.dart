import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_card.dart';
import '../widgets/search_bar.dart';
import '../models/device.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Device> _allDevices = [];
  List<Device> _filteredDevices = [];
  int _currentPage = 1;
  final int _itemsPerPage = 30;

  @override
  void initState() {
    super.initState();
    _loadDevices();
  }

  void _loadDevices() {
    // Mock data - replace with actual API call
    _allDevices = [
      Device(
        id: '1',
        label: 'Main Entrance',
        modelName: 'AC-2000',
        serialNumber: 'SN001234',
        currentIp: '192.168.1.100',
        mac: '00:11:22:33:44:55',
        status: DeviceStatus.online,
        lastModified: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Device(
        id: '2',
        label: 'Back Door',
        modelName: 'AC-1500',
        serialNumber: 'SN001235',
        currentIp: '192.168.1.101',
        mac: '00:11:22:33:44:56',
        status: DeviceStatus.offline,
        lastModified: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Device(
        id: '3',
        label: 'Office Door',
        modelName: 'AC-3000',
        serialNumber: 'SN001236',
        currentIp: '192.168.1.102',
        mac: '00:11:22:33:44:57',
        status: DeviceStatus.warning,
        lastModified: DateTime.now().subtract(const Duration(minutes: 30)),
      ),
    ];
    _filteredDevices = _allDevices;
  }

  void _filterDevices(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredDevices = _allDevices;
      } else {
        _filteredDevices = _allDevices.where((device) {
          final searchLower = query.toLowerCase();
          return device.label?.toLowerCase().contains(searchLower) == true ||
              device.modelName?.toLowerCase().contains(searchLower) == true ||
              device.serialNumber?.toLowerCase().contains(searchLower) == true ||
              device.currentIp?.toLowerCase().contains(searchLower) == true ||
              device.mac?.toLowerCase().contains(searchLower) == true;
        }).toList();
      }
      _currentPage = 1;
    });
  }

  List<Device> get _paginatedDevices {
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = (startIndex + _itemsPerPage).clamp(0, _filteredDevices.length);
    return _filteredDevices.sublist(startIndex, endIndex);
  }

  int get _totalPages => (_filteredDevices.length / _itemsPerPage).ceil();

  Color _getStatusColor(DeviceStatus status) {
    switch (status) {
      case DeviceStatus.online:
        return AppTheme.success;
      case DeviceStatus.offline:
        return AppTheme.error;
      case DeviceStatus.warning:
        return AppTheme.warning;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Access Control System',
        onLogout: null,
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.fromLTRB(0, 16, 65, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Devices',
                  style: AppTheme.heading2,
                ),
                const SizedBox(height: 4),
                Text(
                  'Manage and monitor access control devices',
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.mutedForeground,
                  ),
                ),
              ],
            ),
          ),

          // Search Bar
          CustomSearchBar(
            placeholder: 'Search devices by serial number, model, IP, label, or MAC...',
            value: _searchController.text,
            onChanged: _filterDevices,
            onClear: () {
              _searchController.clear();
              _filterDevices('');
            },
          ),

          // Device List
          Expanded(
            child: _filteredDevices.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          LucideIcons.smartphone,
                          size: 64,
                          color: AppTheme.mutedForeground,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _searchController.text.isEmpty
                              ? 'No devices found.'
                              : 'No devices found matching your search.',
                          style: AppTheme.bodyLarge.copyWith(
                            color: AppTheme.mutedForeground,
                          ),
                        ),
                      ],
                    ),
                  )
                : CustomCard(
                    margin: const EdgeInsets.fromLTRB(12, 10, 12, 16),
                    child: Column(
                      children: [
                        CustomCardHeader(
                          title: 'Device List (${_filteredDevices.length} devices)',
                          icon: const Icon(
                            LucideIcons.smartphone,
                            color: AppTheme.accent,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _paginatedDevices.length,
                            itemBuilder: (context, index) {
                              final device = _paginatedDevices[index];
                              return _buildDeviceItem(device);
                            },
                          ),
                        ),
                        if (_totalPages > 1) _buildPagination(),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceItem(Device device) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        children: [
          // Status Icon
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: _getStatusColor(device.status),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          
          // Device Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.displayName,
                  style: AppTheme.labelLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  '${device.modelInfo} • ${device.serialInfo}',
                  style: AppTheme.bodySmall,
                ),
                const SizedBox(height: 2),
                Text(
                  'IP: ${device.ipInfo} • MAC: ${device.macInfo}',
                  style: AppTheme.bodySmall,
                ),
              ],
            ),
          ),
          
          // Status Badge and Last Modified
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getStatusColor(device.status).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _getStatusColor(device.status).withOpacity(0.3),
                  ),
                ),
                child: Text(
                  device.status.displayName,
                  style: AppTheme.labelSmall.copyWith(
                    color: _getStatusColor(device.status),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Modified: ${DateFormat('MMM dd, yyyy').format(device.lastModified)}',
                style: AppTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPagination() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Showing ${(_currentPage - 1) * _itemsPerPage + 1} to ${(_currentPage * _itemsPerPage).clamp(0, _filteredDevices.length)} of ${_filteredDevices.length} devices',
            style: AppTheme.bodySmall,
          ),
          Row(
            children: [
              IconButton(
                onPressed: _currentPage > 1 ? () {
                  setState(() {
                    _currentPage--;
                  });
                } : null,
                icon: const Icon(LucideIcons.chevronLeft),
              ),
              Text(
                '$_currentPage / $_totalPages',
                style: AppTheme.labelMedium,
              ),
              IconButton(
                onPressed: _currentPage < _totalPages ? () {
                  setState(() {
                    _currentPage++;
                  });
                } : null,
                icon: const Icon(LucideIcons.chevronRight),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
