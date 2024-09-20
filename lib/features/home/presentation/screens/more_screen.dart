import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/page_indicator.dart';
import 'package:iegy/features/home/presentation/components/idea.dart';
import 'package:iegy/features/home/presentation/cubit/more_cubit/more_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/more_cubit/more_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var cubit = MoreCubit.get(context);
    return BlocBuilder<MoreCubit, MoreState>(builder: (context, state) {
      return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, 87.h),
              child: Column(children: [
                const Spacer(),
                AppBar(
                    title: SizedBox(
                        width: 181.w,
                        child: Text(BlocProvider.of<MoreCubit>(context).section,
                            style: Theme.of(context).textTheme.displayLarge,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center)),
                    leading: BackArrow(
                        onTap: () => BlocProvider.of<MoreCubit>(context)
                            .onBackPressed(context)))
              ])),
          body: Padding(
              padding:
                  EdgeInsets.only(top: 32.h, bottom: 69.h, left: 16, right: 16),
              child: SingleChildScrollView(
                  child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if (cubit.section ==
                          AppLocalizations.of(context)!.best_seller)
                        Expanded(
                            child: SizedBox(
                                height:
                                    7, // Set a fixed height to prevent unbounded height issues
                                child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (_, index) => PageIndicator(
                                        width: ((width - 32) /
                                                    cubit.bestSellerList
                                                        .length) >
                                                width - 32
                                            ? width - 32
                                            : (width - 32) /
                                                (cubit.bestSellerList.length /
                                                    32),
                                        selected:
                                            BlocProvider.of<MoreCubit>(context)
                                                    .currentPage ==
                                                index +
                                                    1), // Adjust index for accurate comparison
                                    separatorBuilder: (_, index) =>
                                        const Gap(4),
                                    itemCount:
                                        (cubit.bestSellerList.length / 32)
                                            .ceil())))
                    ]),
                SizedBox(height: 8.h),
                Row(children: [
                  SizedBox(width: 7.w),
                  Text('${BlocProvider.of<MoreCubit>(context).currentPage}/4')
                ]),
                SizedBox(height: 28.h),
                Wrap(
                    spacing: 16.w,
                    runSpacing: 19.h,
                    children: BlocProvider.of<MoreCubit>(context).section ==
                            AppLocalizations.of(context)!.best_seller
                        ? cubit.bestSellerList
                        : [const Idea()])
              ]))),
          bottomNavigationBar: BlocProvider.of<MoreCubit>(context).currentPage <
                  4
              ? Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: CustomButton(
                      onPressed: () =>
                          BlocProvider.of<MoreCubit>(context).goNext(),
                      text: AppLocalizations.of(context)!.next))
              : null,
          floatingActionButton: FloatingActionButton(onPressed: () {}));
    });
  }
}
