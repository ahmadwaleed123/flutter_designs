import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widgets/app_text_field.dart';
import '../../../common_widgets/custom_appbar.dart';
import '../../../common_widgets/profile_avatar_widget.dart';
import '../../../constants/theme_constants.dart';
import '../../../utils/routes.dart';

class _Contact {
  final String name;
  final String initials;

  const _Contact(this.name, this.initials);
}

class FinanceSendMoneyRecipientScreen extends StatefulWidget {
  const FinanceSendMoneyRecipientScreen({super.key});

  @override
  State<FinanceSendMoneyRecipientScreen> createState() =>
      _FinanceSendMoneyRecipientScreenState();
}

class _FinanceSendMoneyRecipientScreenState
    extends State<FinanceSendMoneyRecipientScreen> {
  final _searchController = TextEditingController();

  final List<_Contact> _contacts = const [
    _Contact('Sarah Williams', 'SW'),
    _Contact('James Carter', 'JC'),
    _Contact('Priya Patel', 'PP'),
    _Contact('Daniel Kim', 'DK'),
    _Contact('Olivia Brown', 'OB'),
    _Contact('Marcus Lee', 'ML'),
  ];

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();
    final filtered =
        query.isEmpty
            ? _contacts
            : _contacts
                .where((c) => c.name.toLowerCase().contains(query))
                .toList();

    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      appBar: const CustomAppbar(title: 'Send Money'),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: AppSpacing.pageSpacingSmall,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16.spMin,
            children: [
              AppTextField(
                hintText: 'Search contacts',
                controller: _searchController,
                onChange: (value) => setState(() {}),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.tertiaryBlack,
                ),
              ),
              Text('Contacts', style: AppTextStyle.poppinsW600(16)),
              Expanded(
                child: ListView.separated(
                  itemCount: filtered.length,
                  separatorBuilder:
                      (context, index) =>
                          Divider(color: AppColors.mediumStroke, height: 1),
                  itemBuilder: (context, index) {
                    final contact = filtered[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: ProfileAvatarWidget(
                        initials: contact.initials,
                        size: 44,
                      ),
                      title: Text(contact.name, style: AppTextStyle.interW600(14)),
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                        color: AppColors.tertiaryBlack,
                      ),
                      onTap:
                          () => Navigator.pushNamed(
                            context,
                            Routes.financeSendMoneyAmount,
                            arguments: contact.name,
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
