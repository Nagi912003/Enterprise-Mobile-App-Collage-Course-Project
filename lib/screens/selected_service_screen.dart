import 'package:courseproject/models/userModel.dart';
import 'package:courseproject/shared/components/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/login/cubit/cubit.dart';
import '../features/services_and_companies/services_cubit.dart';
import '../models/models.dart';
import '../shared/components/widgets/company_description.dart';

class SelectedServiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final service =
        ModalRoute.of(context)!.settings.arguments as BusinessService;
    final loginCubit = LoginCubit.get(context);

    final companyProfile = loginCubit.getCompanyById(service.companyId);

    final servicesCubit = BlocProvider.of<ServicesCubit>(context);

    bool isServiceFavorite(BusinessService service) {
      return service.isFavorite;
    }

    void toggleFavorite(BusinessService service) {
      servicesCubit.toggleFavorite(service);
    }

    return Scaffold(
      appBar: AppBar(title: Text(service.name)),
      body: Column(
        children: [
          ListTile(
            title: Text(service.name),
            subtitle: Text(service.companyId),
          ),
          ListTile(
            title: Text('Company name: ${companyProfile.companyName}'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/company_profile',
                    arguments: companyProfile);
              },
              child: const Text('see company profile'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/distance', arguments: service);
                },
                //appState.addToFavoriteServices(service),
                child: const Row(
                  children: [
                    Icon(Icons.maps_home_work_outlined),
                    Text('  how far is it to your current location')
                  ],
                ),
              ),
              !isServiceFavorite(service)
                  ? ElevatedButton(
                      onPressed: () {
                        warningText(
                            context: context,
                            text: 'added to favorites!',
                            color: Colors.green);
                        toggleFavorite(service);
                      },
                      child: const Icon(Icons.favorite_border))
                  : ElevatedButton(
                      onPressed: () {
                        warningText(
                            context: context,
                            text: 'removed from favorites!',
                            color: Colors.redAccent);
                        toggleFavorite(service);
                      },
                      //appState.addToFavoriteServices(service),
                      child: const Icon(Icons.favorite),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
