import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:video_app/screens/welcome_screen.dart';
import 'package:video_app/screens/login_screen.dart';
import 'package:video_app/screens/home_screen.dart';
import 'package:video_app/screens/video_screen.dart';
import 'package:video_app/screens/profile_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/video/:id',
      builder: (context, state) => VideoScreen(
        videoId: state.pathParameters['id'] ?? '',
      ),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
