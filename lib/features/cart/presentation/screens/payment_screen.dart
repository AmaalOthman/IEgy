import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/features/cart/presentation/cubit/payment_cubit/payment_cubit.dart';
import 'package:iegy/features/cart/presentation/cubit/payment_cubit/payment_state.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit, PaymentState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 84.h),
            child: Column(
              children: [
                const Spacer(),
                AppBar(
                  title: Text(
                    AppLocalizations.of(context)!.payment,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  leading: IconButton(
                    onPressed: () => BlocProvider.of<PaymentCubit>(context)
                        .onBackPressed(context),
                    icon: const BackArrow(),
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 22.w),
            child: Column(
              children: [
                BlocProvider.of<PaymentCubit>(context).phases[
                    BlocProvider.of<PaymentCubit>(context).currentPhase],
                CustomButton(
                    onPressed: () =>
                        BlocProvider.of<PaymentCubit>(context).goNext(),
                    text:
                        BlocProvider.of<PaymentCubit>(context).currentPhase != 2
                            ? AppLocalizations.of(context)!.next
                            : AppLocalizations.of(context)!.pay_now)
              ],
            ),
          ),
        );
      },
    );
  }
}
