import 'package:flutter/material.dart';
import 'package:jobsque/screens/home/items/profile/provider/profile_state.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileState state = ProfileState();

  void onNameChange(String value) {
    value.isEmpty
        ? state.nameErrorMessage = "Name is required"
        : state.nameErrorMessage = null;
    state.name = value;
    notifyListeners();
  }

  void onBioChange(String value) {
    value.isEmpty
        ? state.bioErrorMessage = "Bio is required"
        : state.bioErrorMessage = null;
    state.bio = value;
    notifyListeners();
  }

  void onAddressChange(String value) {
    value.isEmpty
        ? state.addressErrorMessage = "Address is required"
        : state.addressErrorMessage = null;
    state.address = value;
    notifyListeners();
  }

  void onPhoneChange(PhoneNumber value) {
    value.toString().isEmpty ? state.phoneErrorMessgae = "Phone is required" : state.phoneErrorMessgae = null;
    state.phone = value;
    notifyListeners();
  }

  validate() {
    return state.name != null &&
        state.bio != null &&
        state.address != null &&
        state.phone != null &&
        state.nameErrorMessage == null &&
        state.bioErrorMessage == null &&
        state.addressErrorMessage == null;
  }

  save(BuildContext context) {
    Navigator.pop(context);
  }

  void jobSearchAlertChange(bool value) {
    state.jobSearchAlert = value;
    notifyListeners();
  }

  void jobApplicationUpdateChange(bool value) {
    state.jobApplicationUpdate = value;
    notifyListeners();
  }

  void jobApplicationRemindersChange(bool value) {
    state.jobApplicationReminders = value;
    notifyListeners();
  }

  void interestedInJobsChange(bool value) {
    state.interestedInJobs = value;
    notifyListeners();
  }

  void jobSeekerUpdatesChange(bool value) {
    state.jobSeekerUpdates = value;
    notifyListeners();
  }

  void showProfileChange(bool value) {
    state.showProfile = value;
    notifyListeners();
  }

  void allMessagesChange(bool value) {
    state.allMessages = value;
    notifyListeners();
  }

  void messageNudgesChange(bool value) {
    state.messageNudges = value;
    notifyListeners();
  }
}
