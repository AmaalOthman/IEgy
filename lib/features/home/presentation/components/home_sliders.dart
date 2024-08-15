import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iegy/core/widgets/custom_button.dart';
import 'package:iegy/core/widgets/custom_cached_image.dart';
import 'package:iegy/core/widgets/custom_loading_indicator.dart';
import 'package:iegy/features/home/data/models/slider_model.dart';
import 'package:iegy/features/home/presentation/cubit/sliders_cubit/sliders_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/sliders_cubit/sliders_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeSliders extends StatefulWidget {
  const HomeSliders({super.key});

  @override
  State<HomeSliders> createState() => _HomeSlidersState();
}

class _HomeSlidersState extends State<HomeSliders> {
  @override
  void initState() {
    context.read<SlidersCubit>().fetchSliders(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String currentLang = Localizations.localeOf(context).languageCode;
    return BlocBuilder<SlidersCubit, SlidersState>(builder: (context, state) {
      if (state is SlidersErrorState) {
        return Text(state.errorMessage);
      } else if (state is SlidersSuccessState) {
        // Using StreamBuilder since state.sliders is a Stream<QuerySnapshot<SliderModel>>
        return StreamBuilder<QuerySnapshot<SliderModel>>(
            stream: state
                .sliders, // Assuming state.sliders is a Stream<QuerySnapshot<SliderModel>>
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<SliderModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CustomLoadingIndicator();
              } else if (snapshot.hasError) {
                return Text(AppLocalizations.of(context)!
                    .somethingWentWrongPleaseTryAgainLater);
              } else if (snapshot.hasData) {
                // Convert QuerySnapshot<SliderModel> to List<Widget>
                List<Widget> sliderWidgets = snapshot.data!.docs.map((doc) {
                  SliderModel slider =
                      doc.data(); // Assuming doc.data() returns a SliderModel
                  return Container(
                      padding: EdgeInsets.all(16.w),
                      margin: const EdgeInsets.symmetric(vertical: 7),
                      width: 398.w,
                      height: 203.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.black.withOpacity(0.15),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: const Offset(0, 3))
                        ],
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xffe8e3da),
                      ),
                      child: Row(children: [
                        SizedBox(
                            width: 106.w,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  RichText(
                                      overflow: TextOverflow.fade,
                                      text: TextSpan(
                                          text: currentLang == 'en'
                                              ? slider.bodyEn
                                              : slider.body,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(height: 2.h))),
                                  CustomButton(
                                      h: 22.h,
                                      onPressed: () {},
                                      text: AppLocalizations.of(context)!
                                          .contact_us,
                                      fontSize: 10.w)
                                ])),
                        const Spacer(),
                        CustomCachedImage(
                            imgUrl: slider.image ??
                                'https://w3layouts.com/wp-content/uploads/2021/06/fitment-404.png')
                      ]));
                }).toList();

                return CarouselSlider(
                    options: CarouselOptions(
                        height: 210.h,
                        autoPlay: true,
                        viewportFraction: 1,
                        enlargeCenterPage: true),
                    items: sliderWidgets);
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