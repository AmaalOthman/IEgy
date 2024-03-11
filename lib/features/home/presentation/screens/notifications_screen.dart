import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/widgets/back_arrow.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(width: 20.5.w,),
            const BackArrow(onTap: null,),
          ],
        ),
        title: Text(AppLocalizations.of(context)!.notifications, style: Theme.of(context).textTheme.displayLarge,),
      ),
    );
  }
}
