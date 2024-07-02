import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/page_indicator.dart';
import 'package:iegy/features/home/presentation/components/idea.dart';
import 'package:iegy/features/home/presentation/components/sale.dart';
import 'package:iegy/features/home/presentation/cubit/more_cubit/more_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/more_cubit/more_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreCubit, MoreState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(double.infinity, 87.h),
              child: Column(children: [
                const Spacer(),
                AppBar(
                    title: SizedBox(
                        width: 181.w,
                        child: Text(
                          BlocProvider.of<MoreCubit>(context).section,
                          style: Theme.of(context).textTheme.displayLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        )),
                    leading: BackArrow(onTap: () =>
                        BlocProvider.of<MoreCubit>(context).onBackPressed(context),))
              ])),
          body: Padding(
            padding: EdgeInsets.only(top: 32.h, bottom: 69.h, left: 16.w, right: 16.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PageIndicator(selected: BlocProvider.of<MoreCubit>(context).currentPage == 1),
                    PageIndicator(selected: BlocProvider.of<MoreCubit>(context).currentPage == 2),
                    PageIndicator(selected: BlocProvider.of<MoreCubit>(context).currentPage == 3),
                    PageIndicator(selected: BlocProvider.of<MoreCubit>(context).currentPage == 4)
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    SizedBox(width: 7.w,),
                    Text(
                        '${BlocProvider.of<MoreCubit>(context).currentPage}/4'),
                  ],
                ),
                SizedBox(height: 28.h,),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 19.h,
                      childAspectRatio: BlocProvider.of<MoreCubit>(context).section == AppLocalizations.of(context)!.best_seller? 182/251: 191/120
                    ),
                    itemBuilder: (context, index) {
                      return BlocProvider.of<MoreCubit>(context).section == AppLocalizations.of(context)!.best_seller? const Sale(): const Idea();
                    },
                    itemCount: 32,
                  ),
                ),
                SizedBox(height: 61.h,),
                if(BlocProvider.of<MoreCubit>(context).currentPage < 4) CustomButton(onPressed: () => BlocProvider.of<MoreCubit>(context).goNext(), text: AppLocalizations.of(context)!.next)
              ],
            ),
          ),
        );
      },
    );
  }
}
