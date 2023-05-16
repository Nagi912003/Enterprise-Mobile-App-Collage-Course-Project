import 'package:courseproject/features/google%20maps/google_maps.dart';
import 'package:courseproject/shared/components/widgets/toast.dart';
import 'package:courseproject/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import '../../helpers/app_state.dart';
import '../../shared/components/widgets/button.dart';
import '../../shared/components/widgets/text_form_field.dart';

import '../../shared/styles/colors.dart';
import 'package:email_validator/email_validator.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        if (state is NullCompanyLocationState) {
          warningText(
              context: context,
              text: "Choose Company Location From Map",
              color: Colors.red);
        }
        if (state is InsertIntoDatabaseTodoSuccessState) {
          warningText(
              context: context, text: "Success Signup", color: Colors.green);
        }
        if (state is RepeatableUserData) {
          warningText(
              context: context,
              text: "Email Address Or Phone Number Already Exist",
              color: Colors.red);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Register",
              style: GoogleFonts.nunitoSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
              ),
            ),
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    defaultTextFormField(
                        controller: cubit.phoneController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "field is required";
                          } else if (value.isNotEmpty &&
                              RegExp(r'^0\d{10}$').hasMatch(value) == false) {
                            return "Invalid Phone Number";
                          }
                        },
                        text: "Phone",
                        prefixIcon: Icons.phone,
                        keyboardType: TextInputType.phone),
                    const SizedBox(
                      height: 10,
                    ),

                    defaultTextFormField(
                        controller: cubit.emailController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "field is required";
                          } else if (value.isNotEmpty &&
                              EmailValidator.validate(value) == false) {
                            return "Invalid Email Address";
                          }
                        },
                        text: "Email Address",
                        prefixIcon: Icons.alternate_email,
                        keyboardType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 10,
                    ),

                    defaultTextFormField(
                        controller: cubit.personNameController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "field is required";
                          }
                        },
                        text: "Full Name",
                        prefixIcon: Icons.person,
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),

                    defaultTextFormField(
                        controller: cubit.companyNameController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "field is required";
                          }
                        },
                        text: "Company Name",
                        prefixIcon: Icons.home_repair_service,
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),

                    defaultTextFormField(
                        controller: cubit.companyAddressController,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            return "field is required";
                          }
                        },
                        text: "Company Address",
                        prefixIcon: Icons.location_on_sharp,
                        keyboardType: TextInputType.text),
                    const SizedBox(
                      height: 10,
                    ),

                    InkWell(
                        onTap: () {
                          companyLocationOnMap = null;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => const Maps()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: mainColor, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(children: [
                            const Icon(
                              Icons.my_location,
                              color: mainColor,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Location Of Company",
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_right,
                              color: mainColor,
                            ),
                          ]),
                        )),
                    //-----------------------------------------------
                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: mainColor)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Choose Company Size",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: mainColor,
                            ),
                          ),
                          SizedBox(
                              height: 210,
                              child: ListView(
                                children: [
                                  RadioListTile(
                                      title: const Text("Micro"),
                                      value: 0,
                                      groupValue: cubit.selectedValue,
                                      onChanged: (value) {
                                        cubit.changeRadioValue(value!);
                                      }),
                                  RadioListTile(
                                      title: const Text("Small"),
                                      value: 1,
                                      groupValue: cubit.selectedValue,
                                      onChanged: (value) {
                                        cubit.changeRadioValue(value!);
                                      }),
                                  RadioListTile(
                                      title: const Text("Mini"),
                                      value: 2,
                                      groupValue: cubit.selectedValue,
                                      onChanged: (value) {
                                        cubit.changeRadioValue(value!);
                                      }),
                                  RadioListTile(
                                      title: const Text("Large"),
                                      value: 3,
                                      groupValue: cubit.selectedValue,
                                      onChanged: (value) {
                                        cubit.changeRadioValue(value!);
                                      }),
                                ],
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    MultiSelectDialogField(
                      title: const Text(
                        "Select Industries",
                      ),
                      buttonText: const Text("Company Industries"),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: mainColor),
                      ),
                      selectedColor: mainColor,
                      selectedItemsTextStyle:
                          const TextStyle(color: Colors.white),
                      items: cubit.type,
                      listType: MultiSelectListType.CHIP,
                      buttonIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: mainColor,
                      ),
                      onConfirm: (values) {
                        cubit.selectedTypes = values;
                        print(cubit.selectedTypes.toString());
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    defaultTextFormField(
                      controller: cubit.passwordController,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "field is required";
                        } else if (value.length < 8) {
                          return "Min length 8";
                        }
                      },
                      text: "Password",
                      prefixIcon: Icons.password,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    defaultTextFormField(
                      controller: cubit.repeatedPasswordController,
                      validate: (value) {
                        if (value == null || value.isEmpty) {
                          return "field is required";
                        } else if (value.isNotEmpty &&
                            cubit.passwordController.text !=
                                cubit.repeatedPasswordController.text) {
                          return "Not Matched Passwords";
                        }
                      },
                      text: "Repeated Password",
                      prefixIcon: Icons.password,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    defaultButton(
                        function: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.insertToDatabase(
                              phone: cubit.phoneController.text,
                              email: cubit.emailController.text,
                              personName: cubit.personNameController.text,
                              companyName: cubit.companyNameController.text,
                              companyIndustry: cubit.compnayIndustries(),
                              companyAddress:
                                  cubit.companyAddressController.text,
                              companyLocation: companyLocationOnMap.toString(),
                              companySize:
                                  cubit.companySize[cubit.selectedValue],
                              password: cubit.passwordController.text,
                              repeatedPassword:
                                  cubit.repeatedPasswordController.text,
                            );
                           }
                        },
                        text: "S I G N  U P"),
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
