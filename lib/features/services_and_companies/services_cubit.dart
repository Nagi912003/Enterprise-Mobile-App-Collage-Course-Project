import 'package:courseproject/shared/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';

class ServicesCubit extends Cubit<List<BusinessService>> {
  ServicesCubit() : super([]);

  bool showFavorite = false;
  @override
  // TODO: implement state
  List<BusinessService> get state => allServices;

  void toggleFavorite(BusinessService service) {
    final updatedServices = state.map((s) {
      if (s.id == service.id) {
        s.isFavorite = !s.isFavorite;
      }
      return s;
    }).toList();
    emit(updatedServices);
  }

  void filterFavorites(bool showFavorite) {
    final filteredServices = showFavorite==true?state.where((s) => s.isFavorite == showFavorite).toList(): allServices;
    this.showFavorite = showFavorite;
    emit(filteredServices);
  }


// Add other methods as needed
}
