import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_card.dart';
import '../widgets/search_bar.dart';
import '../models/personnel.dart';
import 'add_personnel_page.dart';

class PersonnelPage extends StatefulWidget {
  const PersonnelPage({super.key});

  @override
  State<PersonnelPage> createState() => _PersonnelPageState();
}

class _PersonnelPageState extends State<PersonnelPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Personnel> _allPersonnel = [];
  List<Personnel> _filteredPersonnel = [];
  int _currentPage = 1;
  final int _itemsPerPage = 30;

  @override
  void initState() {
    super.initState();
    _loadPersonnel();
  }

  void _loadPersonnel() {
    // Mock data - replace with actual API call
    _allPersonnel = [
      Personnel(
        id: '1',
        name: 'John Doe',
        cardNumber: 'CARD001',
        accessGroup: 'Admin',
        photoUrl: null,
        deviceIds: ['1', '2'],
      ),
      Personnel(
        id: '2',
        name: 'Jane Smith',
        cardNumber: 'CARD002',
        accessGroup: 'Employee',
        photoUrl: null,
        deviceIds: ['1'],
      ),
      Personnel(
        id: '3',
        name: 'Bob Johnson',
        cardNumber: 'CARD003',
        accessGroup: 'Guest',
        photoUrl: null,
        deviceIds: ['3'],
      ),
    ];
    _filteredPersonnel = _allPersonnel;
  }

  void _filterPersonnel(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredPersonnel = _allPersonnel;
      } else {
        _filteredPersonnel = _allPersonnel.where((person) {
          final searchLower = query.toLowerCase();
          return person.name.toLowerCase().contains(searchLower) ||
              person.cardNumber?.toLowerCase().contains(searchLower) == true;
        }).toList();
      }
      _currentPage = 1;
    });
  }

  List<Personnel> get _paginatedPersonnel {
    final startIndex = (_currentPage - 1) * _itemsPerPage;
    final endIndex = (startIndex + _itemsPerPage).clamp(0, _filteredPersonnel.length);
    return _filteredPersonnel.sublist(startIndex, endIndex);
  }

  int get _totalPages => (_filteredPersonnel.length / _itemsPerPage).ceil();

  void _navigateToAddPersonnel() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AddPersonnelPage()),
    );
    
    if (result == true) {
      _loadPersonnel();
    }
  }

  void _navigateToEditPersonnel(Personnel personnel) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddPersonnelPage(personnel: personnel),
      ),
    );
    
    if (result == true) {
      _loadPersonnel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        imagePath: 'Assets/hkezit-logo.png',
        onLogout: null, // Add logout functionality
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
                  'Personnel',
                  style: AppTheme.heading2,
                ),
                const SizedBox(height: 4),
                Text(
                  'Manage personnel access and permissions',
                  style: AppTheme.bodyMedium.copyWith(
                    color: AppTheme.mutedForeground,
                  ),
                ),
              ],
            ),
          ),

          // Search Bar
          CustomSearchBar(
            placeholder: 'Search personnel by name or card number...',
            value: _searchController.text,
            onChanged: _filterPersonnel,
            onClear: () {
              _searchController.clear();
              _filterPersonnel('');
            },
          ),

          // Add Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _navigateToAddPersonnel,
                    icon: const Icon(LucideIcons.userPlus, size: 18),
                    label: const Text('Add Personnel'),
                  ),
                ),
              ],
            ),
          ),
const SizedBox(height: 8),
          // Personnel List
          Expanded(
            child: _filteredPersonnel.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          LucideIcons.users,
                          size: 64,
                          color: AppTheme.mutedForeground,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          _searchController.text.isEmpty
                              ? 'No personnel found.'
                              : 'No personnel found matching your search.',
                          style: AppTheme.bodyLarge.copyWith(
                            color: AppTheme.mutedForeground,
                          ),
                        ),
                      ],
                    ),
                  )
                : CustomCard(
                    margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                    child: Column(
                      children: [
                        CustomCardHeader(
                          title: 'Personnel List (${_filteredPersonnel.length} personnel)',
                          icon: const Icon(
                            LucideIcons.users,
                            color: AppTheme.accent,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _paginatedPersonnel.length,
                            itemBuilder: (context, index) {
                              final personnel = _paginatedPersonnel[index];
                              return _buildPersonnelItem(personnel);
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

  Widget _buildPersonnelItem(Personnel personnel) {
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
          // Profile Photo
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppTheme.mutedForeground.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: personnel.photoUrl != null
                ? ClipOval(
                    child: Image.network(
                      personnel.photoUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          LucideIcons.user,
                          color: AppTheme.mutedForeground,
                          size: 30,
                        );
                      },
                    ),
                  )
                : const Icon(
                    LucideIcons.user,
                    color: AppTheme.mutedForeground,
                    size: 30,
                  ),
          ),
          const SizedBox(width: 16),
          
          // Personnel Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  personnel.name,
                  style: AppTheme.labelLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  'Card: ${personnel.cardInfo}',
                  style: AppTheme.bodySmall,
                ),
                const SizedBox(height: 2),
                Text(
                  'Access Group: ${personnel.groupInfo}',
                  style: AppTheme.bodySmall,
                ),
              ],
            ),
          ),
          
          // Edit Button
          OutlinedButton.icon(
            onPressed: () => _navigateToEditPersonnel(personnel),
            icon: const Icon(LucideIcons.edit, size: 16),
            label: const Text('Edit'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
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
            'Showing ${(_currentPage - 1) * _itemsPerPage + 1} to ${(_currentPage * _itemsPerPage).clamp(0, _filteredPersonnel.length)} of ${_filteredPersonnel.length} personnel',
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
