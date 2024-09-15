import 'package:flutter/material.dart';
import 'package:pillai_hackcelestial/provider/StudentForm.dart';

import 'package:provider/provider.dart';

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  int currentStep = 0;

  List<Widget> getFormPages() {
    return [
      basicInfoPage(),
      academicInterestsPage(),
      skillsPage(),
      mentorPreferencesPage(),
      availabilityPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final studentForm = Provider.of<StudentFormModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Student Profile')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(child: getFormPages()[currentStep]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentStep > 0)
                  ElevatedButton(
                    onPressed: () => setState(() => currentStep--),
                    child: Text('Back'),
                  ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      if (currentStep < getFormPages().length - 1) {
                        setState(() => currentStep++);
                      } else {
                        // Submit data to backend
                        studentForm.submitForm();
                      }
                    }
                  },
                  child: Text(currentStep == getFormPages().length - 1
                      ? 'Complete Profile'
                      : 'Continue'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget basicInfoPage() {
    final studentForm = Provider.of<StudentFormModel>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            onSaved: (value) => studentForm.updateName(value ?? ''),
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Year of Study'),
            value: studentForm.year.isNotEmpty ? studentForm.year : null,
            items: ['First', 'Second', 'Third', 'Fourth']
                .map((year) => DropdownMenuItem(value: year, child: Text(year)))
                .toList(),
            onChanged: (value) => studentForm.updateYear(value!),
            validator: (value) => value == null ? 'Required' : null,
          ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Department'),
            value: studentForm.department.isNotEmpty
                ? studentForm.department
                : null,
            items: ['CS', 'IT', 'ECE', 'EEE']
                .map((dept) => DropdownMenuItem(value: dept, child: Text(dept)))
                .toList(),
            onChanged: (value) => studentForm.updateDepartment(value!),
            validator: (value) => value == null ? 'Required' : null,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'College'),
            onSaved: (value) => studentForm.updateCollege(value ?? ''),
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
        ],
      ),
    );
  }

  Widget academicInterestsPage() {
    final studentForm = Provider.of<StudentFormModel>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Preferred Subjects'),
            onSaved: (value) =>
                studentForm.updatePreferredSubjects(value ?? ''),
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Research Interests'),
            onSaved: (value) =>
                studentForm.updateResearchInterests(value ?? ''),
            validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Career Aspirations'),
            onSaved: (value) =>
                studentForm.updateCareerAspirations(value ?? ''),
          ),
        ],
      ),
    );
  }

  Widget skillsPage() {
    final studentForm = Provider.of<StudentFormModel>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Current Skills'),
            onSaved: (value) => studentForm.updateCurrentSkills(value ?? ''),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Extracurricular Interests'),
            onSaved: (value) => studentForm.updateExtracurricular(value ?? ''),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Skills to Learn'),
            onSaved: (value) => studentForm.updateSkillsToLearn(value ?? ''),
          ),
        ],
      ),
    );
  }

  Widget mentorPreferencesPage() {
    final studentForm = Provider.of<StudentFormModel>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Challenges You\'re Facing'),
            onSaved: (value) => studentForm.updateChallenges(value ?? ''),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Focus of Mentorship'),
            onSaved: (value) =>
                studentForm.updateFocusOfMentorship(value ?? ''),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Mentoring Style'),
            onSaved: (value) => studentForm.updateMentoringStyle(value ?? ''),
          ),
        ],
      ),
    );
  }

  Widget availabilityPage() {
    final studentForm = Provider.of<StudentFormModel>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration:
                InputDecoration(labelText: 'Preferred Communication Method'),
            onSaved: (value) =>
                studentForm.updateCommunicationMethod(value ?? ''),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Time Availability'),
            onSaved: (value) => studentForm.updateTimeAvailability(value ?? ''),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Long Term Goals'),
            onSaved: (value) => studentForm.updateLongTermGoals(value ?? ''),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Short Term Goals'),
            onSaved: (value) => studentForm.updateShortTermGoals(value ?? ''),
          ),
        ],
      ),
    );
  }
}
