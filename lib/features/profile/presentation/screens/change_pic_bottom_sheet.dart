import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/core/widgets/custom_image.dart';
import 'package:image_picker/image_picker.dart';

class ChangePicBottomSheet extends StatelessWidget {
  const ChangePicBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 15.h),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                // Pick an image
                final XFile? image = await picker.pickImage(
                    source: ImageSource.gallery, imageQuality: 80);
                if (image != null) {
                  log('Image path: ${image.path} -- MimeType ${image.mimeType}');
                  /*setState(() {
                    _image = image.path;
                  });
                  APIs.updateProfilePicture(File(_image!));*/
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(),
                  fixedSize: Size(MediaQuery.of(context).size.width * .3, MediaQuery.of(context).size.height * .15)),
              child: CustomImage(imagePath: AppAssets.gallery, w: 50.w,),
            ),
            ElevatedButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                // Pick an image
                final XFile? image = await picker.pickImage(
                    source: ImageSource.camera, imageQuality: 80);
                if (image != null) {
                  log('Image path: ${image.path}');
                  /*setState(() {
                    _image = image.path;
                  });
                  APIs.updateProfilePicture(File(_image!));*/
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const CircleBorder(),
                  fixedSize: Size(MediaQuery.of(context).size.width * .3, MediaQuery.of(context).size.height * .15)),
              child: CustomImage(imagePath: AppAssets.camera, w: 50.w,),
            )
          ],
        )
      ],
    );
  }
}
