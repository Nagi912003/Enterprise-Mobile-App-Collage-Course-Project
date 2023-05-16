// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'package:courseproject/models/models.dart';
//
// class ServicesState with ChangeNotifier {
//   bool showFavorite = false;
//   final List<BusinessService> allServices = [
//     BusinessService(
//         SimpleLocation(latitude: 29.5821,longitude: 30.5638),
//         id: '1',
//         name: 'Service 1',
//         companyId: '',
//         address: ''),
//     BusinessService(
//         SimpleLocation(latitude: 29.5821,longitude: 30.5638),
//         id: '2',
//         name: 'Service 2',
//         companyId: '',
//         address: ''),
//     BusinessService(
//         SimpleLocation(latitude: 29.5821,longitude: 30.5638),
//         id: '3',
//         name: 'Service 3',
//         companyId: '',
//         address: ''),
//     BusinessService(
//         SimpleLocation(latitude: 29.5821,longitude: 30.5638),
//         id: '4',
//         name: 'Service 4',
//         companyId: '',
//         address: ''),
//     BusinessService(
//         SimpleLocation(latitude: 29.5821,longitude: 30.5638),
//         id: '5',
//         name: 'Service 5',
//         companyId: '',
//         address: ''),
//     BusinessService(
//         SimpleLocation(latitude: 29.5821,longitude: 30.5638),
//         id: '6',
//         name: 'Service 6',
//         companyId: '',
//         address: ''),
//   ];
//   final List<CompanyProfile> allCompanies = [
//     CompanyProfile(
//         id: 'CompanyA',
//         name: 'CompanyA Name',
//         description: 'CompanyA Description '),
//   ];
//
//   void onlyFavorites() {
//     showFavorite = true;
//     notifyListeners();
//   }
//
//   void showAll() {
//     showFavorite = false;
//     notifyListeners();
//   }
//
//   get favoriteServices =>
//       [...allServices.where((element) => element.isFavorite == true).toList()];
//
//   CompanyProfile? selectedCompanyProfile;
//
//   SimpleLocation? currentLocation;
//
//
//   bool isServiceFavorite(BusinessService service) {
//     return service.isFavorite;
//   }
//   void toggleFavorite(BusinessService service) {
//      service.isFavorite = !service.isFavorite;
//      notifyListeners();
//   }
//
//   CompanyProfile getCompanyById(String id) {
//     return allCompanies.firstWhere((element) => element.id == id);
//   }
//
// }
//
// class MyProvider extends StatelessWidget {
//   final Widget child;
//
//   const MyProvider({super.key, required this.child});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [],
//       child: child,
//     );
//   }
// }
