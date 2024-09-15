import 'package:flutter/material.dart';

class StudentFormModel extends ChangeNotifier {
  String name = '';
  String year = '';
  String department = '';
  String college = '';
  String preferredSubjects = '';
  String researchInterests = '';
  String careerAspirations = '';
  String currentSkills = '';
  String extracurricular = '';
  String skillsToLearn = '';
  String challenges = '';
  String focusOfMentorship = '';
  String mentoringStyle = '';
  String communicationMethod = '';
  String timeAvailability = '';
  String longTermGoals = '';
  String shortTermGoals = '';

  void updateName(String value) {
    name = value;
    notifyListeners();
  }

  void updateYear(String value) {
    year = value;
    notifyListeners();
  }

  void updateDepartment(String value) {
    department = value;
    notifyListeners();
  }

  void updateCollege(String value) {
    college = value;
    notifyListeners();
  }

  void updatePreferredSubjects(String value) {
    preferredSubjects = value;
    notifyListeners();
  }

  void updateResearchInterests(String value) {
    researchInterests = value;
    notifyListeners();
  }

  void updateCareerAspirations(String value) {
    careerAspirations = value;
    notifyListeners();
  }

  void updateCurrentSkills(String value) {
    currentSkills = value;
    notifyListeners();
  }

  void updateExtracurricular(String value) {
    extracurricular = value;
    notifyListeners();
  }

  void updateSkillsToLearn(String value) {
    skillsToLearn = value;
    notifyListeners();
  }

  void updateChallenges(String value) {
    challenges = value;
    notifyListeners();
  }

  void updateFocusOfMentorship(String value) {
    focusOfMentorship = value;
    notifyListeners();
  }

  void updateMentoringStyle(String value) {
    mentoringStyle = value;
    notifyListeners();
  }

  void updateCommunicationMethod(String value) {
    communicationMethod = value;
    notifyListeners();
  }

  void updateTimeAvailability(String value) {
    timeAvailability = value;
    notifyListeners();
  }

  void updateLongTermGoals(String value) {
    longTermGoals = value;
    notifyListeners();
  }

  void updateShortTermGoals(String value) {
    shortTermGoals = value;
    notifyListeners();
  }

  // Print data or send to backend
  void submitForm() {
    // Handle form submission
    print({
      'name': name,
      'year': year,
      'department': department,
      'college': college,
      'preferredSubjects': preferredSubjects,
      'researchInterests': researchInterests,
      'careerAspirations': careerAspirations,
      'currentSkills': currentSkills,
      'extracurricular': extracurricular,
      'skillsToLearn': skillsToLearn,
      'challenges': challenges,
      'focusOfMentorship': focusOfMentorship,
      'mentoringStyle': mentoringStyle,
      'communicationMethod': communicationMethod,
      'timeAvailability': timeAvailability,
      'longTermGoals': longTermGoals,
      'shortTermGoals': shortTermGoals,
    });
  }
}
