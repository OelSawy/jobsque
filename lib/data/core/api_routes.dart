import 'package:jobsque/data/core/url.dart';

class ApiRoutes {
  //! User Authentication
  static String register = "$baseUrl/auth/register"; //? post
  static String login = "$baseUrl/auth/login"; //? post
  static String getOtp = "$baseUrl/auth/otp"; //? get
  static String updateNameAndPassword = "$baseUrl/auth/user/update"; //? put
  static String getProfile = "$baseUrl/auth/profile"; //? get

  //! Profile
  static String updateProfile = "$baseUrl/user/profile"; //? put
  static String editBioandData = "$baseUrl/user/profile/edit"; //? put
  static String editLanguage = "$baseUrl/user/profile/language"; //? put
  static String addPortfolio = "$baseUrl/user/profile/portofolios"; //? post
  static String getPortfolio = "$baseUrl/user/profile/portofolios"; //? get
  static String editPortfolio = "$baseUrl/user/profile/portofolios"; //? put
  static String deletePortfolio = "$baseUrl/user/profile/portofolios"; //? delete

  //! Jobs
  static String showJobs = "$baseUrl/jobs"; //? get
  static String showSuggestedJobs = "$baseUrl/jobs/sugest"; //? get
  static String searchJobs = "$baseUrl/jobs/search"; //? get
  static String filterSearch = "$baseUrl/jobs/filter"; //? get

  //! Favourites
  static String addFavorite = "$baseUrl/favorites"; //? post
  static String getFavorite = "$baseUrl/favorites"; //? get
  static String deleteFavorite = "$baseUrl/favorites"; //? delete

  //! Education
  static String addEducation = "$baseUrl/education"; //? post
  static String getEducation = "$baseUrl/education"; //? get
  static String editEducation = "$baseUrl/education"; //? put

  //! Experience
  static String addExperience = "$baseUrl/experince"; //? post
  static String endExperience = "$baseUrl/experince"; //? put

  // TODO: make applying and reviewing model and services
  //! Apply
  static String applyJob = "$baseUrl/apply"; //? post
  static String reviewApply = "$baseUrl/apply"; //? put

  // TODO: make company model and services
  //! Company
  static String createCompany = "$baseUrl/company"; //? post
}