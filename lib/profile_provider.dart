import 'package:flutter/material.dart';
import 'package:matching_platform_project1/profile_model.dart';

class ProfileProvider with ChangeNotifier {
  ProfileModel myProfile = ProfileModel(
      location: "",
  );
}