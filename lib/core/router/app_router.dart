import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:itlegend_flutter_challenge/core/presentation/views/main_view.dart';
import 'package:itlegend_flutter_challenge/core/router/app_routes.dart';
import 'package:itlegend_flutter_challenge/presentation/controller/home_cubit.dart';
import 'package:itlegend_flutter_challenge/presentation/views/home_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.filtering,
        name: AppRoutes.filtering,
        builder: (context, state) =>
            const Scaffold(body: Center(child: Text('filtering'))),
      ),
      ShellRoute(
        builder: (context, state, child) => MainView(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            name: AppRoutes.home,
            builder: (context, state) {
              return BlocProvider<HomeCubit>(
                create: (_) => GetIt.instance<HomeCubit>()..loadData(),
                child: const HomeView(),
              );
            },
          ),
          GoRoute(
            path: AppRoutes.profile,
            name: AppRoutes.profile,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('profile'))),
          ),
          GoRoute(
            path: AppRoutes.chats,
            name: AppRoutes.chats,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Chats'))),
          ),
          GoRoute(
            path: AppRoutes.advertisements,
            name: AppRoutes.advertisements,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('advertisements'))),
          ),
          GoRoute(
            path: AppRoutes.addAdvertisements,
            name: AppRoutes.addAdvertisements,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('addAdvertisements'))),
          ),
        ],
      ),
    ],
  );
}
