import 'package:flutter/material.dart';

import '../constants/theme_constants.dart';
import '../models/models.dart';

class SpecialistProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<Specialist> _specialists = [];

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Specialist> get specialists => _specialists;

  Future<void> fetchSpecialists() async {
    isLoading = true;
    await Future.delayed(const Duration(milliseconds: 800));
    _specialists = const [
      Specialist(
        id: 1,
        name: 'Dr. Sarah Kewin',
        specialty: 'Allergy Specialist',
        initials: 'SK',
        rating: 4.9,
        price: 50,
        bio:
            'Dr. Sarah Kewin has over 10 years of experience diagnosing and '
            'treating seasonal and chronic allergies.',
        avatarColor: AppColors.primaryBrand,
      ),
      Specialist(
        id: 2,
        name: 'Dr. Michael Reyes',
        specialty: 'Cardiologist',
        initials: 'MR',
        rating: 4.8,
        price: 65,
        bio:
            'Dr. Michael Reyes specializes in preventive cardiology and '
            'heart health screenings for adults of all ages.',
        avatarColor: Color(0xff2ED573),
      ),
      Specialist(
        id: 3,
        name: 'Dr. Aisha Khan',
        specialty: 'Dermatologist',
        initials: 'AK',
        rating: 4.7,
        price: 55,
        bio:
            'Dr. Aisha Khan focuses on skin health, acne treatment and '
            'cosmetic dermatology procedures.',
        avatarColor: Color(0xffFFB020),
      ),
      Specialist(
        id: 4,
        name: 'Dr. James Carter',
        specialty: 'Dentist',
        initials: 'JC',
        rating: 4.9,
        price: 45,
        bio:
            'Dr. James Carter provides general and cosmetic dentistry with '
            'a focus on painless, patient-friendly care.',
        avatarColor: Color(0xff4FA1FF),
      ),
    ];
    isLoading = false;
  }
}
