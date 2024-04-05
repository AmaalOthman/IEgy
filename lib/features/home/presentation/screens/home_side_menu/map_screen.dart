import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/widgets/back_arrow.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:iegy/core/widgets/custom_text_form_field.dart';
import 'package:iegy/features/home/presentation/cubit/map_cubit/map_cubit.dart';
import 'package:iegy/features/home/presentation/cubit/map_cubit/map_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<MapCubit, MapState>(
          builder: (context, state) {
            return Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: BlocProvider.of<MapCubit>(context).gesrAlSwaisPosition,
                  onMapCreated: (GoogleMapController controller) {
                    BlocProvider.of<MapCubit>(context).controller.complete(controller);
                  },
                  markers: {
                    const Marker(markerId: MarkerId('branch_location'), position: LatLng(30.152102, 31.335730))
                  }
                ),
                Positioned(
                  top: 24.h,
                  child: Row(
                    children: [
                      const BackArrow(),
                      CustomTextFormField(
                          h: 48.h,
                          w: 350.w,
                          shadow: true,
                          preIcon: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [CustomImage(imagePath: AppAssets.googleLocation, h: 24.h, w: 24.w)]),
                          suffixIcon: CustomImage(
                            imagePath: AppAssets.mic,
                            h: 18.h,
                            w: 13.39.w,
                          ),
                          hint: AppLocalizations.of(context)!
                              .what_are_u_looking_for
                      )
                    ],
                  ),
                )
              ],
            );
          }
        )
    );
  }
}