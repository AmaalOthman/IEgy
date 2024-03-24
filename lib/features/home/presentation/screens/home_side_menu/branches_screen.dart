import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/features/home/presentation/components/branch.dart';
import 'package:iegy/features/home/presentation/cubit/branches_cubit/branches_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/branches_cubit/branches_state.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BranchesCubit, BranchesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 84.h),
            child: Column(
              children: [
                const Spacer(),
                AppBar(
                  title: Text(
                    AppLocalizations.of(context)!.our_branches,
                    style: Theme
                        .of(context)
                        .textTheme
                        .displayLarge,
                  ),
                  leading: IconButton(
                    onPressed: () => BlocProvider.of<BranchesCubit>(context).onBackPressed(context),
                    icon: const BackArrow(),
                  ),
                ),
              ],
            ),
          ),
          body: const Column(
            children: [
              Branch(),
              Branch(),
              Branch(),
              Branch(),
              Branch(),
              Branch(),
              Branch(),
              Branch(),
            ],
          ),
        );
      },
    );
  }
}
