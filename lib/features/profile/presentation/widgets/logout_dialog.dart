import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gap/gap.dart';
import 'package:iegy/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(AppLocalizations.of(context)!.areYouSureYouWantToLogOut, style: Theme.of(context).textTheme.displayMedium),
        const Gap(12),
        Row(
          children: [
            TextButton(onPressed: () => context.read<ProfileCubit>().logOut(context), child: Text(AppLocalizations.of(context)!.log_out, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16))),
            const Spacer(),
            TextButton(onPressed: () => Navigator.pop(context), child: Text(AppLocalizations.of(context)!.back, style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16)))
          ]
        )
      ]
    );
  }
}
