class FormData {
  final String? academicStream;
  final String? yearOfStudy;
  final List<String>? academicInterests;
  final List<String>? extracurricularInterests;
  final String? activityPreference;
  final String? timeCommitment;
  final String? communityEngagement;
  final String? communityType;
  final String? leadershipPreference;
  final String? longTermGoal;
  final String? collaborationPreference;

  FormData({
    this.academicStream,
    this.yearOfStudy,
    this.academicInterests,
    this.extracurricularInterests,
    this.activityPreference,
    this.timeCommitment,
    this.communityEngagement,
    this.communityType,
    this.leadershipPreference,
    this.longTermGoal,
    this.collaborationPreference,
  });

  // Define copyWith method
  FormData copyWith({
    String? academicStream,
    String? yearOfStudy,
    List<String>? academicInterests,
    List<String>? extracurricularInterests,
    String? activityPreference,
    String? timeCommitment,
    String? communityEngagement,
    String? communityType,
    String? leadershipPreference,
    String? longTermGoal,
    String? collaborationPreference,
  }) {
    return FormData(
      academicStream: academicStream ?? this.academicStream,
      yearOfStudy: yearOfStudy ?? this.yearOfStudy,
      academicInterests: academicInterests ?? this.academicInterests,
      extracurricularInterests: extracurricularInterests ?? this.extracurricularInterests,
      activityPreference: activityPreference ?? this.activityPreference,
      timeCommitment: timeCommitment ?? this.timeCommitment,
      communityEngagement: communityEngagement ?? this.communityEngagement,
      communityType: communityType ?? this.communityType,
      leadershipPreference: leadershipPreference ?? this.leadershipPreference,
      longTermGoal: longTermGoal ?? this.longTermGoal,
      collaborationPreference: collaborationPreference ?? this.collaborationPreference,
    );
  }
}
