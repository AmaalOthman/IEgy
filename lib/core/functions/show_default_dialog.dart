import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iegy/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum NotificationType { error, success, warning, info }

void showDefaultDialog(BuildContext context,
    {required NotificationType type,
    String? title,
    required String description, bool? withCancelButton}) {
  switch (type) {
    case NotificationType.error:
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            scrollable: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                shadowColor: Colors.transparent,
                buttonPadding: EdgeInsets.zero,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 190,
                        width: 328,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFD32A2A), Color(0xFFEF5656)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(CupertinoIcons.xmark_circle,
                                  size: 64, color: AppColors.white),
                              const Gap(10),
                              Text(title ?? AppLocalizations.of(context)!.error)
                            ])),
                    Container(
                      height: 190,
                      width: 328,
                      decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(description,
                              textAlign: TextAlign.center),
                          if(withCancelButton != false) const Gap(32),
                          if(withCancelButton != false) GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                                height: 50,
                                width: 164,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFFD32A2A),
                                        Color(0xFFEF5656)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                    child: Text(AppLocalizations.of(context)!.ok))),
                          )
                        ]
                      )
                    )
                  ]
                )
              ));
      break;
    case NotificationType.success:
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            scrollable: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                shadowColor: Colors.transparent,
                buttonPadding: EdgeInsets.zero,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 190,
                      width: 328,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF8BC34A), Color(0xFFABE36A)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12))),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle_outline_outlined,
                                size: 64, color: AppColors.white)
                          ])
                    ),
                    Container(
                      height: 190,
                      width: 328,
                      decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(description,
                              textAlign: TextAlign.center),
                          if(withCancelButton != false)const Gap(32),
                          if(withCancelButton != false) GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                                height: 50,
                                width: 164,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF8BC34A),
                                        Color(0xFFABE36A)
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                    child: Text(AppLocalizations.of(context)!.ok,
                                        ))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
      break;
    case NotificationType.info:
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            scrollable: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                shadowColor: Colors.transparent,
                buttonPadding: EdgeInsets.zero,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 190,
                      width: 328,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.lightBlueAccent],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8))),
                      child: Center(
                          child: Icon(Icons.error_outline,
                              size: 64, color: AppColors.white)),
                    ),
                    Container(
                      height: 190,
                      width: 328,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(description,
                              textAlign: TextAlign.center),
                          if(withCancelButton != false)const Gap(32),
                          if(withCancelButton != false) GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                                height: 50,
                                width: 164,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.blue,
                                        Colors.lightBlueAccent
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                    child: Text(AppLocalizations.of(context)!.ok,
                                        ))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
      break;
    default:
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
            scrollable: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                shadowColor: Colors.transparent,
                buttonPadding: EdgeInsets.zero,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 190,
                      width: 328,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue, Colors.lightBlueAccent],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.info_outline,
                                size: 64, color: AppColors.white),
                            const Gap(10),
                            Text(title ?? AppLocalizations.of(context)!.warning)
                          ]),
                    ),
                    Container(
                      height: 190,
                      width: 328,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(description,
                              textAlign: TextAlign.center),
                          if(withCancelButton != false) const Gap(32),
                          if(withCancelButton != false) GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                                height: 50,
                                width: 164,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Colors.blue,
                                        Colors.lightBlueAccent
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                    child: Text(AppLocalizations.of(context)!.ok))),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ));
      break;
  }
}
