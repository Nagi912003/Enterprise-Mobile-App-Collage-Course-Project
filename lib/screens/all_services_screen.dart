import 'package:courseproject/features/login/cubit/cubit.dart';
import 'package:courseproject/features/register/cubit/cubit.dart';
import 'package:courseproject/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/services_and_companies/services_cubit.dart';

class AllServicesScreen extends StatelessWidget {
  const AllServicesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var appCubit = AppCubit.get(context);
    final servicesCubit = BlocProvider.of<ServicesCubit>(context);

    void onlyFavorites() {
      servicesCubit.filterFavorites(true);
    }

    void showAll() {
      servicesCubit.filterFavorites(false);
    }

    // final allServices = !servicesCubit.showFavorite
    //     ? servicesCubit.allServices
    //     : servicesCubit.favoriteServices;

    return Scaffold(
      appBar: AppBar(
        title: !servicesCubit.showFavorite
            ? const Text('All Services')
            : const Text('Favorites'),
      ),
      body: BlocBuilder<ServicesCubit, List<BusinessService>>(
        builder: (context,services) {
          return ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              return ListTile(
                title: Text(service.name),
                subtitle: Text(service.companyId),
                onTap: () {
                  // Navigate to the company profile screen passing the selected service
                  Navigator.pushNamed(context, '/selected_service',
                      arguments: service);
                },
              );
            },
          );
        },
      ) ,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            if (appCubit.profile != null)
              UserAccountsDrawerHeader(
                accountName: Text(appCubit.profile!.personName),
                accountEmail: Text(appCubit.profile!.email),
                currentAccountPicture: appCubit.profileImage != null
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(
                          appCubit.profileImage!,
                        ),
                      )
                    : const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("assets/images/0.png"),
                      ),
              ),
            ListTile(
              title: const Text('All Services'),
              onTap: () {
                showAll();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Favorite Services'),
              onTap: () {
                onlyFavorites();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                if (appCubit.profile != null) {
                  Navigator.pushNamed(context, '/profile');
                } else {
                  Navigator.pop(context);
                }
              },
            ),
            ListTile(
              title: const Text('Edit profile'),
              onTap: () {
                Navigator.pushNamed(context, '/edit_profile');
              },
            ),
            // Add more ListTile items for other screens
          ],
        ),
      ),
    );
  }
}
