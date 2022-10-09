import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:laverdi/src/features/home/bloc/home_bloc.dart';
import 'package:laverdi/src/features/home/store/home_store.dart';
import 'package:laverdi/src/features/user/view/user_details_view.dart';
import 'package:laverdi/src/shared/app_routes.dart';

import 'features/home/view/home_view.dart';

class LaverdiApp extends StatelessWidget {
  const LaverdiApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(store: HomeStore())
        ..add(
          LoadMealsEvent(
            date: DateTime.now(),
          ),
        ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LaVerdi',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', ''),
        ],
        theme: ThemeData(
          fontFamily: 'Fahkwang',
        ).copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: const Color(0xFF8CA87C),
                secondary: HSLColor.fromColor(const Color(0xFF414B3B))
                    .withLightness(0.5)
                    .toColor(),
              ),
        ),
        routes: {
          AppRoutes.HOME_PAGE: (ctx) => const HomeView(),
          AppRoutes.USER_DETAILS: (ctx) => const UserDetailsView(),
        },
      ),
    );
  }
}
