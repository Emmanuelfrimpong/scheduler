import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../container/home_container.dart';
import 'router_info.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final navKey = GlobalKey<NavigatorState>();
final router = GoRouter(
    initialLocation: RouterInfo.dataRoute.path,
    navigatorKey: rootNavigatorKey,
    errorBuilder: (context, state) {
      return Consumer(
        builder: (_, WidgetRef ref, __) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Page not found',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          );
        },
      );
    },
    routes: [
      StatefulShellRoute.indexedStack(
          pageBuilder: (context, state, navigationShell) => NoTransitionPage(
                child: HomeContainer(
                  key: state.pageKey,
                  child: navigationShell,
                ),
              ),
          branches: [
            StatefulShellBranch(
                initialLocation: RouterInfo.dataRoute.path,
                routes: [
                  GoRoute(
                    path: RouterInfo.dataRoute.path,
                    name: RouterInfo.dataRoute.routeName,
                    pageBuilder: (context, state) => NoTransitionPage(
                        child: Container(
                      key: state.pageKey,
                          child:const Center(child: Text('Data Page'))
                    )),
                  ),

                ]),
          ]),
    ]);
