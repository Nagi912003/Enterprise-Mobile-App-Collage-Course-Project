import 'package:courseproject/features/login/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models.dart';
import '../../../models/userModel.dart';
import '../../../shared/constants.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  UserModel? userModel;
  void login({required String phone, required String password}) {
    emit(LoadingLoginState());
    bool verified = false;
    users.forEach((element) {
      if (element.phone == phone && element.password == password) {
        verified = true;
        userModel = element;
      }
    });
    allServices.forEach((element) {
      element.companyId = userModel!.phone;
      element.address = userModel!.companyAddress;
    });
    if (verified == true)
      emit(SuccessLoginState(phone));
    else if (verified == false) emit(FailLoginState());
  }


  UserModel getCompanyById(String id) {
    return users.firstWhere((element) => element.phone == id);
  }
}
