import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/styles/colors.dart';
import '../edit profile/edit_profile.dart';
import '../register/cubit/cubit.dart';
import '../register/cubit/states.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: const Icon(Icons.person),
              title: const Text('Your Profile'),
            ),
            body: cubit.profile != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepPurple,
                            ),
                            child: Row(
                              children: [
                                cubit.profileImage != null
                                    ? CircleAvatar(
                                        radius: 50,
                                        backgroundImage: FileImage(
                                          cubit.profileImage!,
                                        ),
                                      )
                                    : const CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            AssetImage("assets/images/0.png"),
                                      ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${cubit.profile!.personName}",
                                        maxLines: 1,
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        "${cubit.profile!.phone}",
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InfoComponent(
                              field: "Email", fieldValue: cubit.profile!.email),
                          InfoComponent(
                              field: "Company Name",
                              fieldValue: cubit.profile!.companyName),
                          InfoComponent(
                              field: "Company Address",
                              fieldValue: cubit.profile!.companyAddress),
                          InfoComponent(
                              field: "Company Location",
                              fieldValue: cubit.profile!.companyLocation),
                          InfoComponent(
                              field: "Company Size",
                              fieldValue: cubit.profile!.companySize),
                          InfoComponent(
                              field: "Company Industries",
                              fieldValue: cubit.profile!.companyIndustry),
                          InfoComponent(
                              field: "Company Location",
                              fieldValue: cubit.profile!.companyLocation),
                        ],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            floatingActionButton: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
            ),
          );
        },
        listener: (context, state) {});
  }
}

class InfoComponent extends StatelessWidget {
  String field;
  String fieldValue;

  InfoComponent({required this.field, required this.fieldValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            field,
            style: GoogleFonts.nunitoSans(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[400],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            fieldValue,
            style: GoogleFonts.nunitoSans(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
