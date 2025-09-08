# Door Access Control System - Mobile App

A Flutter mobile application for door access control system that replicates the functionality and design of the existing web application. This is a frontend-only implementation with no backend integration, focusing on UI/UX consistency and user experience.

## Features

### Navigation Structure
- **Bottom Tab Navigation** with 5 main tabs:
  - **Devices Tab**: Manage and monitor access control devices
  - **Personnel Tab**: Manage personnel access and permissions
  - **Access Log Tab**: View and monitor access control activities
  - **Backup Tab**: Manage system backups and data recovery
  - **Settings Tab**: Global access configuration

### Key Pages

#### 1. Login Page
- Server URL configuration with edit/save/cancel functionality
- Password field with visibility toggle
- Loading states and form validation
- Navigates to Devices tab after successful login

#### 2. Devices Page
- Real-time search across device fields (serial, model, IP, label, MAC)
- Device list with status indicators (online/offline/warning)
- Pagination support (30 items per page)
- Device information display with last modified timestamps

#### 3. Personnel Page
- Personnel list with search functionality
- Add/Edit personnel forms with photo upload
- Device mapping for access control
- Access group assignment
- Pagination support

#### 4. Access Log Page
- Advanced filtering by device, personnel, and date range
- Export functionality for CSV downloads
- Access direction indicators (In/Out)
- Real-time log display

#### 5. Backup Page
- Create and restore backup functionality
- File upload for backup restoration
- Daily backup configuration
- Backup time and path settings

#### 6. Settings Page
- Global access configuration table
- Editable access groups and time slots
- Day-of-week access permissions
- Real-time editing with save/cancel functionality

## Design System

### Color Scheme
- **Background**: #181c20 (dark gray)
- **Card Background**: #23272f (slightly lighter gray)
- **Accent Color**: #F26A21 (orange)
- **Foreground**: #f3f4f6 (light gray)
- **Muted Foreground**: #a1a1aa (medium gray)
- **Border**: #2d323b (dark border)

### Status Colors
- **Success/Online**: Green variants
- **Warning**: Yellow variants
- **Error/Offline**: Red variants
- **Info**: Blue variants

## Technical Implementation

### Dependencies
- `lucide_icons`: ^0.257.0 - For consistent iconography
- `file_picker`: ^8.0.0+1 - For file upload functionality
- `intl`: ^0.19.0 - For date/time formatting

### Architecture
- **Models**: Data structures for devices, personnel, access logs, and configuration
- **Screens**: Individual page implementations
- **Widgets**: Reusable UI components
- **Theme**: Centralized design system and styling

### Key Components
- `CustomAppBar`: Consistent app bar with language switcher and user info
- `CustomCard`: Standardized card component with header support
- `CustomSearchBar`: Search functionality with clear button
- `MainNavigation`: Bottom tab navigation structure

## Getting Started

1. **Prerequisites**
   - Flutter SDK (^3.8.1)
   - Dart SDK
   - Android Studio / VS Code with Flutter extensions

2. **Installation**
   ```bash
   flutter pub get
   ```

3. **Running the App**
   ```bash
   flutter run
   ```

## Mock Data

The app currently uses mock data for demonstration purposes. All API calls are simulated with delays to demonstrate loading states and user interactions.

## Future Enhancements

- Backend integration with real API endpoints
- Language switching implementation
- Push notifications for access events
- Offline mode support
- Advanced filtering and search capabilities
- User authentication and role-based access control

## Notes

- This is a frontend-only implementation
- No database or backend integration
- Language switching UI is present but not functional
- All data is mock/simulated for demonstration purposes