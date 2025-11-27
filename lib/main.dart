import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// 1. Dependency Injection Setup
final GetIt sl = GetIt.instance;

void setupLocator() {
  // sl.registerLazySingleton(() => AuthBloc(sl()));
  // sl.registerLazySingleton(() => VaultBloc(sl()));
  // sl.registerLazySingleton(() => SettingsBloc(sl()));
  
  // Use Cases
  // sl.registerLazySingleton(() => UnlockVault(sl()));
  // sl.registerLazySingleton(() => SaveEntry(sl()));
  
  // Repositories
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  // sl.registerLazySingleton<VaultRepository>(() => VaultRepositoryImpl(sl()));
  
  // Data Sources
  // sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sl()));
}

void main() {
  // 2. Initialize dependencies
  setupLocator();
  
  // 3. Run the app
  runApp(const CryptixVaultApp());
}

class CryptixVaultApp extends StatelessWidget {
  const CryptixVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 4. Provide BLoCs/Cubit (مثال على استخدام BLoC)
    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (_) => sl<AuthBloc>()),
        // BlocProvider(create: (_) => sl<VaultBloc>()),
      ],
      child: MaterialApp(
        title: 'CRYPTIX VAULT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.greenAccent,
          scaffoldBackgroundColor: Colors.black,
          // Dark hacker-inspired cyber theme: dark background, neon green & electric blue accents
          colorScheme: const ColorScheme.dark(
            primary: Colors.greenAccent,
            secondary: Colors.blueAccent,
            surface: Color(0xFF0A0A0A),
            background: Colors.black,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.greenAccent,
          ),
          // Use Material 3
          useMaterial3: true,
        ),
        home: const OnboardingScreen(), // الشاشة الأولى
      ),
    );
  }
}

// Placeholder for the OnboardingScreen
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRYPTIX VAULT - Onboarding'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to CRYPTIX VAULT',
              style: TextStyle(color: Colors.greenAccent, fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Ultimate Offline Cyber Security Vault',
              style: TextStyle(color: Colors.blueAccent, fontSize: 16),
            ),
            SizedBox(height: 30),
            Text(
              'App structure is ready for Clean Architecture implementation.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
