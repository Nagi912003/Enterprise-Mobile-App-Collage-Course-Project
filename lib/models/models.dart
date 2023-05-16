import 'package:flutter/cupertino.dart';

class BusinessService {
  final String id;
  String name;
  String companyId;
  SimpleLocation serviceLocation;
  String address;
  bool isFavorite = false;

  BusinessService(
      {required this.serviceLocation,
        required this.id,
        required this.name,
        required this.companyId,
        required this.address,
        this.isFavorite = false,});

  void toggleFavorite(){
    isFavorite = !isFavorite;
  }

  BusinessService copyWith({
    SimpleLocation? location,
    String? id,
    String? name,
    String? companyId,
    String? address,
    bool? isFavorite,
  }) {
    return BusinessService(
      serviceLocation: location ?? this.serviceLocation,
      id: id ?? this.id,
      name: name ?? this.name,
      companyId: companyId ?? this.companyId,
      address: address ?? this.address,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}




class CompanyProfile {
  final String id;
  String name;
  final String description;
  // Add any other relevant fields

  CompanyProfile(
      {required this.id, required this.name, required this.description});
}

class SimpleLocation {
  final double latitude;
  final double longitude;

  SimpleLocation({required this.latitude, required this.longitude});
}
