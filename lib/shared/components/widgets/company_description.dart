import 'package:flutter/cupertino.dart';

import '../../../models/userModel.dart';

Widget CompanyDescription(UserModel userModel ){
  final name = userModel.companyName;
  final industry = userModel.companyIndustry;
  final address = userModel.companyAddress;
  final location = userModel.companyLocation;
  final size = userModel.companySize;
  return Text(
      '''Company name : $name'''
          '''Company industry : $industry'''
          '''Company address : $address'''
          '''Company location : $location'''
          '''Company size : $size'''
  );
}