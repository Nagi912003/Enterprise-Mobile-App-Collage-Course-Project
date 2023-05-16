import 'package:courseproject/models/userModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/models.dart';

LatLng? companyLocationOnMap;
List<UserModel> users=[];

List<BusinessService> allServices = [
  BusinessService(
      serviceLocation: SimpleLocation(latitude: 29.5821,longitude: 30.5638),
      id: '1',
      name: 'Service 1',
      companyId: '',
      address: ''),
  BusinessService(
      serviceLocation: SimpleLocation(latitude: 29.5821,longitude: 30.5638),
      id: '2',
      name: 'Service 2',
      companyId: '',
      address: ''),
  BusinessService(
      serviceLocation: SimpleLocation(latitude: 29.5821,longitude: 30.5638),
      id: '3',
      name: 'Service 3',
      companyId: '',
      address: ''),
  BusinessService(
      serviceLocation: SimpleLocation(latitude: 29.5821,longitude: 30.5638),
      id: '4',
      name: 'Service 4',
      companyId: '',
      address: ''),
  BusinessService(
      serviceLocation: SimpleLocation(latitude: 29.5821,longitude: 30.5638),
      id: '5',
      name: 'Service 5',
      companyId: '',
      address: ''),
  BusinessService(
      serviceLocation: SimpleLocation(latitude: 29.5821,longitude: 30.5638),
      id: '6',
      name: 'Service 6',
      companyId: '',
      address: ''),
];