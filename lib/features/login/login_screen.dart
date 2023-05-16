
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/app_state.dart';
import '../../shared/components/widgets/button.dart';
import '../../shared/components/widgets/text_form_field.dart';
import '../../shared/components/widgets/toast.dart';
import '../../shared/styles/colors.dart';
import '../register/cubit/cubit.dart';
import '../register/signup.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=LoginCubit.get(context);

    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if(state is FailLoginState)
          {
            warningText(context: context, text: "Wrong Phone Number Or Password", color: Colors.red);
          }
        if(state is SuccessLoginState)
        {
          warningText(context: context, text: "Success Login", color: Colors.green);
          AppCubit.get(context).getProfileData(phone: state.phone);
          //Provider.of<AppState>(context).changeUserCompanyName();

          //Navigator.pushNamed(context,  '/all_services');
          //Navigator.pushNamed(context,  '/profile');
          Navigator.pushNamedAndRemoveUntil(context,  '/all_services', (route) => false);

          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ProfileScreen()),(route) => false,);
        }
      },
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(
          //   elevation: 0.0,
          // ),
          body: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 400),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login Now",style: GoogleFonts.nunitoSans(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: mainColor

                    ),),
                    const SizedBox(height: 25,),
                    defaultTextFormField(
                        controller: cubit.phoneController,
                        validate: (value){
                          if(value ==null ||value.isEmpty)
                            {
                              return "Phone is Required";
                            }
                        },
                        text: "Phone Number",
                        prefixIcon: Icons.phone,
                        keyboardType: TextInputType.phone),
                    const SizedBox(height: 10,),

                    defaultTextFormField(
                        controller: cubit.passwordController,
                        validate: (value){
                          if(value ==null ||value.isEmpty)
                          {
                            return "Password is Required";
                          }
                        },
                        text: "Password",
                        prefixIcon: Icons.password,
                        keyboardType: TextInputType.visiblePassword,
                      isPassword: true,

                    ),
                    const SizedBox(height: 20,),
                    defaultButton(function: (){
                      if(cubit.formKey.currentState!.validate())
                        {
                          cubit.login(phone: cubit.phoneController.text, password: cubit.passwordController.text);
                        }
                    }, text: "L O G I N"),
                    Row(children: [
                      const Text("Don't have an account ?"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterScreen()));
                      }, child: const Text("Register")),
                    ],),

                    if(state is LoadingLoginState)
                      const CircularProgressIndicator(),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
