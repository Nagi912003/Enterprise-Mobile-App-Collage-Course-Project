import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/services_and_companies/services_cubit.dart';

class CompanyServicesScreen extends StatelessWidget {
  final String companyId;

  const CompanyServicesScreen({required this.companyId});

  @override
  Widget build(BuildContext context) {
    final servicesCubit = BlocProvider.of<ServicesCubit>(context);
    final Services = servicesCubit.state.where((element) => element.companyId == companyId);

    final companyServices =
        Services.where((service) => service.companyId == companyId).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Company Services')),
      body: ListView.builder(
        itemCount: companyServices.length,
        itemBuilder: (context, index) {
          final service = companyServices[index];
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
      ),
    );
  }
}
