import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';
import 'package:iegy/features/home/data/models/product_model.dart';
import 'package:iegy/features/home/presentation/components/sale.dart';
import 'package:iegy/features/home/presentation/cubit/best_seller_cubit/best_seller_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/best_seller_cubit/best_seller_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BestSellerWidget extends StatefulWidget {
  const BestSellerWidget({super.key});

  @override
  State<BestSellerWidget> createState() => _BestSellerWidgetState();
}

class _BestSellerWidgetState extends State<BestSellerWidget> {
  @override
  void initState() {
    context.read<BestSellerCubit>().fetchBestSeller(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    return BlocBuilder<BestSellerCubit, BestSellerState>(
        builder: (context, state) {
      if (state is BestSellerErrorState) {
        return Text(state.errorMessage);
      } else if (state is BestSellerSuccessState) {
        // Using StreamBuilder since state.sliders is a Stream<QuerySnapshot<SliderModel>>
        return StreamBuilder<QuerySnapshot<ProductModel>>(
            stream: state
                .bestSeller, // Assuming state.sliders is a Stream<QuerySnapshot<SliderModel>>
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<ProductModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CustomLoadingIndicator();
              } else if (snapshot.hasError) {
                return Text(AppLocalizations.of(context)!
                    .somethingWentWrongPleaseTryAgainLater);
              } else if (snapshot.hasData) {
                // Convert QuerySnapshot<SliderModel> to List<Widget>
                List<Widget> bestSellerWidget = snapshot.data!.docs.map((doc) {
                  ProductModel product =
                      doc.data(); // Assuming doc.data() returns a SliderModel
                  return Sale(
                      image: product.image ??
                          'https://w3layouts.com/wp-content/uploads/2021/06/fitment-404.png',
                      title: currentLang == 'en'
                          ? (product.titleEn ?? '')
                          : (product.title ?? ''),
                      color1: product.colors?[0] ?? 'FFFFFF',
                      color2: product.colors?[1] ?? 'FFFFFF',
                      color3: product.colors?[2] ?? 'FFFFFF',
                      oldPrice: product.oldPrice,
                      price: product.price ?? '',
                      rateCount: product.ratesCount ?? '0');
                }).toList();

                return SizedBox(
                    height: 251.h,
                    width: 414.w,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return bestSellerWidget[index];
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 16.w);
                        },
                        itemCount: bestSellerWidget.length));
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
