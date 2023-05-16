import 'package:courseproject/models/userModel.dart';
import 'package:courseproject/shared/components/widgets/company_description.dart';
import 'package:courseproject/shared/components/widgets/toast.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class CompanyProfileScreen extends StatelessWidget {
  final UserModel company;

  const CompanyProfileScreen({required this.company});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(company.companyName)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(company.companyName),
            subtitle: Text(company.companyAddress),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/company_services',
                    arguments: company.phone);
              },
              child: const Text('see all services'),
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CompanyDescription(company),
            ),
          )
        ],
      ),
    );
  }
}
