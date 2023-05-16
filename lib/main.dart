import 'package:courseproject/features/edit%20profile/edit_profile.dart';
import 'package:courseproject/location_example.dart';
import 'package:courseproject/models/userModel.dart';
import 'package:courseproject/screens/selected_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:courseproject/features/login/cubit/cubit.dart';
import 'package:courseproject/shared/bloc_observer.dart';
import 'package:courseproject/shared/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/home_screen.dart';
import 'features/profile/profile.dart';
import 'features/register/cubit/cubit.dart';
import 'features/services_and_companies/services_cubit.dart';
import 'screens/all_services_screen.dart';
import 'screens/company_profile_screen.dart';
import 'screens/company_services_screen.dart';
import 'screens/distance_screen.dart';

void main() {
  print(companyLocationOnMap ?? "null ya sadekiiii");

  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()..createDatabase()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider<ServicesCubit>(create: (context) => ServicesCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomeScreen(),
          initialRoute: '/',
          routes: {
            '/all_services': (context) => AllServicesScreen(),
            '/company_profile': (context) => CompanyProfileScreen(
                company: ModalRoute.of(context)!.settings.arguments
                    as UserModel),
            '/selected_service': (context) => SelectedServiceScreen(),
            '/distance': (context) => DistanceScreen(),
            '/company_services': (context) => CompanyServicesScreen(
                companyId:
                    ModalRoute.of(context)!.settings.arguments as String),
            '/profile': (context)=> ProfileScreen(),
            '/edit_profile': (context)=> EditProfile(),
            '/min': (context) => MinimumExample(),
          },
        ),
    );
  }
}
