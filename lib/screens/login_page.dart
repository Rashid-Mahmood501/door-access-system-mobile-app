import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';
import '../l10n/generated/app_localizations.dart';
import '../widgets/language_selection_cards.dart';
import 'main_navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _serverUrlController = TextEditingController(text: 'http://localhost:10031/');
  final _passwordController = TextEditingController();
  
  bool _isLoading = false;
  bool _isEditingServerUrl = false;
  bool _obscurePassword = true;
  String _originalServerUrl = 'http://localhost:10031/';

  @override
  void dispose() {
    _serverUrlController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleServerUrlEdit() {
    setState(() {
      // Store the current value as original when starting to edit
      if (!_isEditingServerUrl) {
        _originalServerUrl = _serverUrlController.text;
      }
      _isEditingServerUrl = !_isEditingServerUrl;
    });
  }

  void _saveServerUrl() {
    setState(() {
      _isEditingServerUrl = false;
      // The text is already in the controller, so we just need to exit edit mode
    });
  }

  void _cancelServerUrlEdit() {
    setState(() {
      _isEditingServerUrl = false;
      _serverUrlController.text = _originalServerUrl; // Restore original value
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Future<void> _handleSignIn() async {
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

    // Navigate to main app
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainNavigation()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Logo/Title
                      Image.asset(
                        'Assets/hkezit-logo.png',
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 48),

                      // Server URL Field
                      Text(
                        AppLocalizations.of(context)!.serverUrl,
                        style: AppTheme.labelLarge,
                      ),
                      const SizedBox(height: 8),
                      Stack(
                        children: [
                          TextFormField(
                            controller: _serverUrlController,
                            enabled: _isEditingServerUrl,
                            style: AppTheme.bodyMedium.copyWith(
                              color: AppTheme.foreground,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context)!.enterServerUrl,
                              hintStyle: AppTheme.bodyMedium.copyWith(
                                color: AppTheme.mutedForeground.withOpacity(0.6),
                                fontWeight: FontWeight.normal,
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              prefixIcon: const Icon(
                                LucideIcons.server,
                                color: AppTheme.mutedForeground,
                              ),
                              suffixIcon: _isEditingServerUrl
                                  ? Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          onPressed: _saveServerUrl,
                                          icon: const Icon(
                                            LucideIcons.check,
                                            color: AppTheme.success,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: _cancelServerUrlEdit,
                                          icon: const Icon(
                                            LucideIcons.x,
                                            color: AppTheme.error,
                                          ),
                                        ),
                                      ],
                                    )
                                  : null,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.serverUrlRequired;
                              }
                              return null;
                            },
                          ),
                          if (!_isEditingServerUrl)
                            Positioned.fill(
                              child: GestureDetector(
                                onTap: _toggleServerUrlEdit,
                                child: Container(
                                  color: Colors.transparent,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 12.0),
                                      child: Icon(
                                        LucideIcons.edit3,
                                        color: AppTheme.mutedForeground,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Password Field
                      Text(
                        AppLocalizations.of(context)!.password,
                        style: AppTheme.labelLarge,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        style: AppTheme.bodyMedium.copyWith(
                          color: AppTheme.foreground,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.enterPassword,
                          hintStyle: AppTheme.bodyMedium.copyWith(
                            color: AppTheme.mutedForeground.withOpacity(0.6),
                            fontWeight: FontWeight.normal,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          prefixIcon: const Icon(
                            LucideIcons.lock,
                            color: AppTheme.mutedForeground,
                          ),
                          suffixIcon: IconButton(
                            onPressed: _togglePasswordVisibility,
                            icon: Icon(
                              _obscurePassword
                                  ? LucideIcons.eye
                                  : LucideIcons.eyeOff,
                              color: AppTheme.mutedForeground,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppLocalizations.of(context)!.passwordRequired;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32),

                      // Sign In Button
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _handleSignIn,
                          child: _isLoading
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        AppTheme.accentForeground,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Text(AppLocalizations.of(context)!.signingIn),
                                ],
                              )
                            : Text(AppLocalizations.of(context)!.signIn),
                        ),
                      ),
                      const SizedBox(height: 32),
                      
                      // Language Selection Cards
                      const LanguageSelectionCards(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
