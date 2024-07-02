import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/features/profile/presentation/cubit/orders_cubit/orders_cubit.dart';
import 'package:iegy/features/profile/presentation/cubit/orders_cubit/orders_state.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
  builder: (context, state) {
    return InkWell(
      onTap: () => BlocProvider.of<OrdersCubit>(context).onOrderClicked(context),
      child: Container(
        width: double.infinity,
        height: 170.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25)
        ),
        padding: EdgeInsets.only(top: 5.h),
        margin: EdgeInsets.only(bottom: 16.h),
        child: Row(
          children: [
            CachedNetworkImage(
              fit: BoxFit.fill,
              height: 119.h,
              width: 162.w,
              imageUrl:
              'https://d248k8q1c80cf8.cloudfront.net/WK_Seito_0017_tif_584372fb43.jpg',
              errorWidget: (context, url, error) =>
              const CustomImage(imagePath: AppAssets.errorImage),
              // placeholder: (context, url) => const CustomImage(imagePath: AppAssets.placeholder),
              progressIndicatorBuilder: (context, url, progress) => SizedBox(
                  width: 228.w,
                  child: const Center(child: CustomLoadingIndicator())),
            ),
            SizedBox(width: 18.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('${AppLocalizations.of(context)!.product}: ', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.black, fontSize: 12.w)),
                    Text('طاولة طعام خشب زان', style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.black, fontSize: 12.w))
                  ],
                ),
                Row(
                  children: [
                    Text('${AppLocalizations.of(context)!.size}: ', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.black, fontSize: 12.w)),
                    Text('1م * 1.5م', style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.black, fontSize: 12.w))
                  ],
                ),
                Row(
                  children: [
                    Text('${AppLocalizations.of(context)!.color}: ', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.black, fontSize: 12.w)),
                    Text('بني غامق', style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.black, fontSize: 12.w)),
                    SizedBox(width: 5.w,),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.darkBrown,
                        borderRadius: BorderRadius.circular(500)
                      ),
                      height: 5.h,
                      width: 5.w,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('${AppLocalizations.of(context)!.delivered_on}: ', style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.black, fontSize: 12.w)),
                    Text('24/9/2023', style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.black, fontSize: 12.w))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  },
);
  }
}
