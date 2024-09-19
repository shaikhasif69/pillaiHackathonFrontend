import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pillai_hackcelestial/models/student_form_data.dart';


final formDataProvider = StateNotifierProvider<FormDataNotifier, FormData>(
  (ref) => FormDataNotifier(),
);

class FormDataNotifier extends StateNotifier<FormData> {
  FormDataNotifier() : super(FormData());

  // Update Academic Stream
  void updateAcademicStream(String value) {
    state = state.copyWith(academicStream: value);
  }

  // Update Year of Study
  void updateYearOfStudy(String value) {
    state = state.copyWith(yearOfStudy: value);
  }

  // Update Academic Interests
  void updateAcademicInterests(List<String> interests) {
    state = state.copyWith(academicInterests: interests);
  }

  // Update Extracurricular Interests
  void updateExtracurricularInterests(List<String> interests) {
    state = state.copyWith(extracurricularInterests: interests);
  }

  // Add similar methods for the other fields
  void updateActivityPreference(String value) {
    state = state.copyWith(activityPreference: value);
  }

  void updateTimeCommitment(String value) {
    state = state.copyWith(timeCommitment: value);
  }

  void updateCommunityEngagement(String value) {
    state = state.copyWith(communityEngagement: value);
  }

  void updateCommunityType(String value) {
    state = state.copyWith(communityType: value);
  }

  void updateLeadershipPreference(String value) {
    state = state.copyWith(leadershipPreference: value);
  }

  void updateLongTermGoal(String value) {
    state = state.copyWith(longTermGoal: value);
  }

  void updateCollaborationPreference(String value) {
    state = state.copyWith(collaborationPreference: value);
  }
}
