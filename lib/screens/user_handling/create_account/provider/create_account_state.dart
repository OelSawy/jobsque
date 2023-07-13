import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:jobsque/core/assets.dart';
import 'package:jobsque/data/models/auth_models/register_response_model.dart';
import 'package:jobsque/data/models/profile_models/update_profile_response_model.dart';

class CreateAccountState {
  //! vars
  String? username;
  String? email;
  String? password;

  //! controllers
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //! errors
  String? usernameErrorMessage;
  String? emailErrorMessage;
  String? passwordErrorMessage;
  String? registerErrorMessage;
  String? updateProfileErrorMessage;

  //! bools
  bool hidePass = true;

  //! categories
  Map<String, Map<String, dynamic>> categories = {
    "uiDesigner": {
      "icon": const Icon(Iconsax.bezier4),
      "name": "UI/UX Designer"
    },
    "illustratorDesigner": {
      "icon": const Icon(Iconsax.pen_tool4),
      "name": "Illustrator Designer"
    },
    "developer": {"icon": const Icon(Iconsax.code4), "name": "Developer"},
    "management": {"icon": const Icon(Iconsax.graph4), "name": "Management"},
    "informationTechnology": {
      "icon": const Icon(Iconsax.monitor_mobbile4),
      "name": "Information Technology"
    },
    "research": {
      "icon": const Icon(Iconsax.cloud_add4),
      "name": "Research and Analytics"
    },
  };

  Map<String, Map<String, dynamic>> selectedCategories = {};

  //! countries
  Map<String, Map<String, dynamic>> countries = {
    "argentina": {"name": "Argentina", "image": AppAssets.argentina},
    "brazil": {"name": "Brazil", "image": AppAssets.brazil},
    "canada": {"name": "Canada", "image": AppAssets.canada},
    "china": {"name": "China", "image": AppAssets.china},
    "india": {"name": "India", "image": AppAssets.india},
    "indonesia": {"name": "Indonesia", "image": AppAssets.indonesia},
    "malaysia": {"name": "Malaysia", "image": AppAssets.malaysia},
    "philiphenes": {"name": "Philiphenes", "image": AppAssets.philiphenes},
    "poland": {"name": "Poland", "image": AppAssets.poland},
    "saudi": {"name": "Saudi Arabia", "image": AppAssets.saudi},
    "singapore": {"name": "Singapore", "image": AppAssets.singapore},
    "vietnam": {"name": "Vietnam", "image": AppAssets.vietnam},
    "us": {"name": "United States", "image": AppAssets.us},
  };

  Map<String, Map<String, dynamic>> selectedCountries = {};

  //! responses
  RegisterResponseModel? registerResponseModel;
  UpdateProfileResponseModel? updateProfileResponseModel;
}
