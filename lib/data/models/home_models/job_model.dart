class JobModel {
  String? name;
  CompanyModel? company;
  String? jobTime;
  String? jobType;
  String? jobCategory;
  String? salary;

  JobModel(
      {required this.name,
      required this.company,
      required this.jobTime,
      required this.jobType,
      required this.jobCategory,
      required this.salary});
}

class CompanyModel {
  String? name;
  String? location;
  String? image;

  CompanyModel({required this.name, required this.location, required this.image});
}
