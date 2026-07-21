import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/theme_constants.dart';
import 'app_icon_button.dart';

class AppbarAction {
  final IconData icon;
  final Function() action;

  const AppbarAction({required this.icon, required this.action});
}

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Function? overrideBackButton;
  final String? title;
  final List<AppbarAction> actions;

  const CustomAppbar({
    super.key,
    this.overrideBackButton,
    this.title,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.spMin, vertical: 8.spMin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIconButton(
                icon: Icons.arrow_back_ios_new_rounded,
                iconSize: 16,
                action: () {
                  if (overrideBackButton != null) {
                    overrideBackButton!();
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              if (title != null)
                Text(title!, style: AppTextStyle.poppinsW600(16)),
              if (actions.isNotEmpty)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children:
                      actions
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.only(left: 8.spMin),
                              child: AppIconButton(
                                icon: e.icon,
                                iconSize: 16,
                                action: e.action,
                              ),
                            ),
                          )
                          .toList(),
                )
              else if (title != null)
                SizedBox(width: 44.spMin),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.spMin);
}
