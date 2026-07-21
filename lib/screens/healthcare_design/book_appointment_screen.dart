import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../common_widgets/app_text_field.dart';
import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/shimmer_container.dart';
import '../../common_widgets/specialist_card.dart';
import '../../constants/theme_constants.dart';
import '../../providers/providers.dart';
import '../../utils/routes.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();

    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const CustomAppbar(title: 'Book Appointment'),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: AppSpacing.pageSpacingSmall,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.spMin,
            children: [
              Text(
                'Appointments which you need to attend in your coming days.',
                style: AppTextStyle.interW400(
                  13,
                  fontColor: AppColors.secondaryBlack,
                ),
              ),
              AppTextField(
                hintText: 'Search doctors, specialties',
                controller: _searchController,
                onChange: (value) => setState(() {}),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.tertiaryBlack,
                ),
                suffixIcon: const Icon(
                  Icons.mic_none_rounded,
                  color: AppColors.tertiaryBlack,
                ),
              ),
              Text('Select Doctor', style: AppTextStyle.poppinsW600(16)),
              Expanded(
                child: Consumer<SpecialistProvider>(
                  builder: (context, provider, _) {
                    if (provider.isLoading) {
                      return GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.spMin,
                        crossAxisSpacing: 12.spMin,
                        childAspectRatio: 0.78,
                        children: List.generate(
                          4,
                          (index) => ShimmerContainer(
                            width: double.infinity,
                            height: double.infinity,
                            borderRadius: AppRoundBorder.circularXpx(pixel: 16),
                          ),
                        ),
                      );
                    }
                    final specialists =
                        query.isEmpty
                            ? provider.specialists
                            : provider.specialists
                                .where(
                                  (s) =>
                                      s.name.toLowerCase().contains(query) ||
                                      s.specialty.toLowerCase().contains(query),
                                )
                                .toList();
                    if (specialists.isEmpty) {
                      return Center(
                        child: Text(
                          'No doctors found',
                          style: AppTextStyle.interW400(
                            14,
                            fontColor: AppColors.tertiaryBlack,
                          ),
                        ),
                      );
                    }
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.spMin,
                        crossAxisSpacing: 12.spMin,
                        childAspectRatio: 0.78,
                      ),
                      itemCount: specialists.length,
                      itemBuilder:
                          (context, index) => SpecialistCard(
                            specialist: specialists[index],
                            action:
                                () => Navigator.pushNamed(
                                  context,
                                  Routes.healthcareSpecialistDetail,
                                  arguments: specialists[index],
                                ),
                          ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
