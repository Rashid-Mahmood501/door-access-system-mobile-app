import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:file_picker/file_picker.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_card.dart';
import '../models/personnel.dart';
import '../models/device.dart';

class AddPersonnelPage extends StatefulWidget {
  final Personnel? personnel;

  const AddPersonnelPage({super.key, this.personnel});

  @override
  State<AddPersonnelPage> createState() => _AddPersonnelPageState();
}

class _AddPersonnelPageState extends State<AddPersonnelPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  
  String? _selectedAccessGroup;
  String? _selectedPhotoPath;
  Set<String> _selectedDeviceIds = {};
  bool _isLoading = false;

  // Mock data
  final List<AccessGroup> _accessGroups = [
    AccessGroup(id: '1', name: 'Admin'),
    AccessGroup(id: '2', name: 'Employee'),
    AccessGroup(id: '3', name: 'Guest'),
  ];

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
    if (widget.personnel != null) {
      _nameController.text = widget.personnel!.name;
      _cardNumberController.text = widget.personnel!.cardNumber ?? '';
      _selectedAccessGroup = widget.personnel!.accessGroup;
      _selectedDeviceIds = Set.from(widget.personnel!.deviceIds);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cardNumberController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _selectedPhotoPath = result.files.first.path;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error picking image: $e'),
          backgroundColor: AppTheme.error,
        ),
      );
    }
  }

  void _toggleDeviceSelection(String deviceId) {
    setState(() {
      if (_selectedDeviceIds.contains(deviceId)) {
        _selectedDeviceIds.remove(deviceId);
      } else {
        _selectedDeviceIds.add(deviceId);
      }
    });
  }

  void _selectAllDevices() {
    setState(() {
      if (_selectedDeviceIds.length == _devices.length) {
        _selectedDeviceIds.clear();
      } else {
        _selectedDeviceIds = _devices.map((d) => d.id).toSet();
      }
    });
  }

  Future<void> _savePersonnel() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(widget.personnel != null 
              ? 'Personnel updated successfully' 
              : 'Personnel added successfully'),
          backgroundColor: AppTheme.success,
        ),
      );
      Navigator.of(context).pop(true);
    }
  }

  void _deletePersonnel() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: const Text(
          'Are you sure you want to delete this personnel? This action cannot be undone.',
        ),
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Implement delete logic
              Navigator.of(context).pop(true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.personnel != null ? 'Edit Personnel' : 'Add Personnel',
        actions: widget.personnel != null ? [
          IconButton(
            onPressed: _deletePersonnel,
            icon: const Icon(LucideIcons.trash2),
            tooltip: 'Delete',
          ),
        ] : null,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Photo Section
                CustomCard(
                  child: Column(
                    children: [
                      const CustomCardHeader(
                        title: 'Photo',
                        icon: Icon(LucideIcons.camera, color: AppTheme.accent),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: AppTheme.mutedForeground.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: _selectedPhotoPath != null
                                  ? ClipOval(
                                      child: Image.asset(
                                        _selectedPhotoPath!,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) {
                                          return const Icon(
                                            LucideIcons.user,
                                            color: AppTheme.mutedForeground,
                                            size: 60,
                                          );
                                        },
                                      ),
                                    )
                                  : widget.personnel?.photoUrl != null
                                      ? ClipOval(
                                          child: Image.network(
                                            widget.personnel!.photoUrl!,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                              return const Icon(
                                                LucideIcons.user,
                                                color: AppTheme.mutedForeground,
                                                size: 60,
                                              );
                                            },
                                          ),
                                        )
                                      : const Icon(
                                          LucideIcons.user,
                                          color: AppTheme.mutedForeground,
                                          size: 60,
                                        ),
                            ),
                            const SizedBox(height: 16),
                            OutlinedButton.icon(
                              onPressed: _pickImage,
                              icon: const Icon(LucideIcons.upload, size: 16),
                              label: Text(_selectedPhotoPath != null || widget.personnel?.photoUrl != null
                                  ? 'Update Image'
                                  : 'Add Photo'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Basic Information
                CustomCard(
                  child: Column(
                    children: [
                      const CustomCardHeader(
                        title: 'Basic Information',
                        icon: Icon(LucideIcons.user, color: AppTheme.accent),
                      ),
                      
                      // Name Field
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter personnel name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Card Number Field
                      TextFormField(
                        controller: _cardNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Card Number',
                          hintText: 'Enter card number',
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Card number is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Access Group Field
                      DropdownButtonFormField<String>(
                        value: _selectedAccessGroup,
                        decoration: const InputDecoration(
                          labelText: 'Access Group',
                          hintText: 'Select Access Group',
                        ),
                        items: _accessGroups.map((group) {
                          return DropdownMenuItem(
                            value: group.name,
                            child: Text(group.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedAccessGroup = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                // Device Mapping
                CustomCard(
                  child: Column(
                    children: [
                      const CustomCardHeader(
                        title: 'Device Mapping',
                        icon: Icon(LucideIcons.smartphone, color: AppTheme.accent),
                      ),
                      
                      // Select All Toggle
                      Row(
                        children: [
                          Checkbox(
                            value: _selectedDeviceIds.length == _devices.length,
                            onChanged: (_) => _selectAllDevices(),
                            activeColor: AppTheme.accent,
                          ),
                          const Text('Select All'),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Device List
                      ..._devices.map((device) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            children: [
                              Checkbox(
                                value: _selectedDeviceIds.contains(device.id),
                                onChanged: (_) => _toggleDeviceSelection(device.id),
                                activeColor: AppTheme.accent,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      device.displayName,
                                      style: AppTheme.labelMedium,
                                    ),
                                    Text(
                                      '${device.modelInfo} • ${device.serialInfo}',
                                      style: AppTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _savePersonnel,
                        child: _isLoading
                            ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        AppTheme.accentForeground,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text('Saving...'),
                                ],
                              )
                            : Text(widget.personnel != null ? 'Save' : 'Add Personnel'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
