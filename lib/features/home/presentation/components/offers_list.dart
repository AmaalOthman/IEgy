import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';
import 'package:iegy/features/home/data/models/offer_model.dart';
import 'package:iegy/features/home/presentation/components/offer.dart';
import 'package:iegy/features/home/presentation/cubit/offers_cubit/offers_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/offers_cubit/offers_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OffersList extends StatefulWidget {
  const OffersList({super.key});

  @override
  State<OffersList> createState() => _OffersListState();
}

class _OffersListState extends State<OffersList> {

  @override
  void initState() {
    context.read<OffersCubit>().fetchSliders(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    return BlocBuilder<OffersCubit, OffersState>(builder: (context, state) {
      if (state is OffersErrorState) {
        return Text(state.errorMessage);
      } else if (state is OffersSuccessState) {
        // Using StreamBuilder since state.sliders is a Stream<QuerySnapshot<SliderModel>>
        return StreamBuilder<QuerySnapshot<OfferModel>>(
            stream: state.offers, // Assuming state.sliders is a Stream<QuerySnapshot<SliderModel>>
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<OfferModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CustomLoadingIndicator();
              } else if (snapshot.hasError) {
                return Text(AppLocalizations.of(context)!
                    .somethingWentWrongPleaseTryAgainLater);
              } else if (snapshot.hasData) {
                // Convert QuerySnapshot<SliderModel> to List<Widget>
                List<Widget> offersWidgets = snapshot.data!.docs.map((doc) {
                  OfferModel offer = doc.data(); // Assuming doc.data() returns a SliderModel
                  return Offer(image: offer.image ?? 'https://w3layouts.com/wp-content/uploads/2021/06/fitment-404.png');
                }).toList();

                return SizedBox(
                    height: 190.h,
                    width: 414.w,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return offersWidgets[index];
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 8.w);
                        },
                        itemCount: offersWidgets.length
                    )
                );
              } else {
                return const CustomLoadingIndicator();
              }
            });
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
