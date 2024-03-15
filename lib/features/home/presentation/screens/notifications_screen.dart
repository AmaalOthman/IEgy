import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/features/home/presentation/components/notification_widget.dart';
import 'package:iegy/features/home/presentation/cubit/notification_cubit/notification_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/notification_cubit/notification_state.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            BlocProvider.of<NotificationCubit>(context).changeTab(0);
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              leading: Row(
                children: [
                  SizedBox(
                    width: 20.5.w,
                  ),
                  BackArrow(
                    onTap: () => BlocProvider.of<NotificationCubit>(context)
                        .onBackPressed(context),
                  ),
                ],
              ),
              title: Text(
                AppLocalizations.of(context)!.notifications,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: (256 + 42 + 24).w,
                          child: DefaultTabController(
                              length: 4,
                              child: TabBar(
                                  tabs: [
                                    Tab(
                                      child:
                                          Text(AppLocalizations.of(context)!.all),
                                    ),
                                    Tab(
                                      child: Text(
                                          AppLocalizations.of(context)!.orders),
                                    ),
                                    Tab(
                                      child: Text(
                                          AppLocalizations.of(context)!.offers),
                                    ),
                                    Tab(
                                      child: Text(AppLocalizations.of(context)!
                                          .about_us_ii),
                                    )
                                  ],
                                  dividerColor: Colors.transparent,
                                  indicatorColor: AppColors.brown,
                                  labelColor: AppColors.brown,
                                  unselectedLabelColor: AppColors.darkBlue,
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.w),
                                  unselectedLabelStyle: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 20.w),
                                  onTap: (index) {
                                    BlocProvider.of<NotificationCubit>(context).changeTab(index);
                                  },
                                  labelPadding: const EdgeInsets.all(0),
                                padding: const EdgeInsets.all(0),
                                indicatorPadding: const EdgeInsets.all(0),
                              )),
                        ),
                      ],
                    ),
                    if(state is NotificationInitial) Column(
                      children: [
                        NotificationWidget(index: 1, title: 'خصم 50% على الكنب', details: 'خصم 50% بمناسبة البلاك فرايداي على خشب الزان الأحمر'),
                        NotificationWidget(index: 0, title: 'يتم إعداد طلبك', details: 'سيتم توصيل طلبك قبل 20-2-2024'),
                        NotificationWidget(index: 2, title: 'الضمان', details: 'تتميز منتجاتنا بأن معها ضمان من سنة إلى ثلاث سنوات')
                      ],
                    ),
                    if(state is OrdersState) Column(
                      children: [
                        NotificationWidget(index: 0, title: 'يتم إعداد طلبك', details: 'سيتم توصيل طلبك قبل 20-2-2024')
                      ],
                    ),
                    if(state is OffersState) Column(
                      children: [
                        NotificationWidget(index: 1, title: 'خصم 50% على الكنب', details: 'خصم 50% بمناسبة البلاك فرايداي على خشب الزان الأحمر')
                      ],
                    ),
                    if(state is AboutUsState) Column(
                      children: [
                        NotificationWidget(index: 2, title: 'الضمان', details: 'تتميز منتجاتنا بأن معها ضمان من سنة إلى ثلاث سنوات')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
