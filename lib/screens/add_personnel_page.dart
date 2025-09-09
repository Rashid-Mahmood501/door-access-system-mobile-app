import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:file_picker/file_picker.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_card.dart';
import '../models/personnel.dart';
import '../models/device.dart';
import '../l10n/generated/app_localizations.dart';

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

  // Mock data - will be localized in the dropdown
  final List<AccessGroup> _accessGroups = [
    AccessGroup(id: '1', name: 'admin'),
    AccessGroup(id: '2', name: 'employee'),
    AccessGroup(id: '3', name: 'guest'),
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
      // Map old access group names to new lowercase keys
      String? accessGroup = widget.personnel!.accessGroup;
      if (accessGroup != null) {
        switch (accessGroup.toLowerCase()) {
          case 'admin':
            _selectedAccessGroup = 'admin';
            break;
          case 'employee':
            _selectedAccessGroup = 'employee';
            break;
          case 'guest':
            _selectedAccessGroup = 'guest';
            break;
          default:
            _selectedAccessGroup = accessGroup.toLowerCase();
        }
      }
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
          content: Text(AppLocalizations.of(context)!.errorPickingImage(e.toString())),
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
              ? AppLocalizations.of(context)!.personnelUpdatedSuccessfully
              : AppLocalizations.of(context)!.personnelAddedSuccessfully),
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
        title: Text(AppLocalizations.of(context)!.confirmDelete),
        content: Text(AppLocalizations.of(context)!.deletePersonnelConfirm),
        actions: [
          OutlinedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)!.cancel),
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
            child: Text(AppLocalizations.of(context)!.delete),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.personnel != null ? AppLocalizations.of(context)!.editPersonnel : AppLocalizations.of(context)!.addPersonnel,
        actions: widget.personnel != null ? [
          IconButton(
            onPressed: _deletePersonnel,
            icon: const Icon(LucideIcons.trash2),
            tooltip: AppLocalizations.of(context)!.delete,
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
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Photo Section
                CustomCard(
                  child: Column(
                    children: [
                      CustomCardHeader(
                        title: AppLocalizations.of(context)!.photo,
                        icon: const Icon(LucideIcons.camera, color: AppTheme.accent),
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
                                  ? AppLocalizations.of(context)!.updateImage
                                  : AppLocalizations.of(context)!.addPhoto),
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
                      CustomCardHeader(
                        title: AppLocalizations.of(context)!.basicInformation,
                        icon: const Icon(LucideIcons.user, color: AppTheme.accent),
                      ),
                      
                      // Name Field
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.name,
                          hintText: AppLocalizations.of(context)!.enterPersonnelName,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!.nameRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Card Number Field
                      TextFormField(
                        controller: _cardNumberController,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.employeeId,
                          hintText: AppLocalizations.of(context)!.enterCardNumber,
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!.employeeIdRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Access Group Field
                      DropdownButtonFormField<String>(
                        value: _selectedAccessGroup,
                        decoration: InputDecoration(
                          labelText: AppLocalizations.of(context)!.accessLevel,
                          hintText: AppLocalizations.of(context)!.selectAccessGroup,
                        ),
                        items: _accessGroups.map((group) {
                          String localizedName;
                          switch (group.name) {
                            case 'admin':
                              localizedName = AppLocalizations.of(context)!.admin;
                              break;
                            case 'employee':
                              localizedName = AppLocalizations.of(context)!.employee;
                              break;
                            case 'guest':
                              localizedName = AppLocalizations.of(context)!.guest;
                              break;
                            default:
                              localizedName = group.name;
                          }
                          return DropdownMenuItem(
                            value: group.name,
                            child: Text(localizedName),
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
                      CustomCardHeader(
                        title: AppLocalizations.of(context)!.deviceMapping,
                        icon: const Icon(LucideIcons.smartphone, color: AppTheme.accent),
                      ),
                      
                      // Select All Toggle
                      Row(
                        children: [
                          Checkbox(
                            value: _selectedDeviceIds.length == _devices.length,
                            onChanged: (_) => _selectAllDevices(),
                            activeColor: AppTheme.accent,
                          ),
                          Text(AppLocalizations.of(context)!.selectAll),
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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
                          child: Text(AppLocalizations.of(context)!.cancel),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _savePersonnel,
                          child: _isLoading
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
                              : Text(widget.personnel != null ? AppLocalizations.of(context)!.save : AppLocalizations.of(context)!.addPersonnel),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
