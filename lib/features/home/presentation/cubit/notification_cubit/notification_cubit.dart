import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/features/home/presentation/cubit/notification_cubit/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  int currentTab = 0;
  List states = [
    NotificationInitial(),
    NotificationsOrdersState(),
    OffersState(),
    AboutUsState()
  ];

  void onBackPressed(BuildContext context) {
    changeTab(0);
    Navigator.pop(context);
  }

  void changeTab(int index) {
    currentTab = index;
    emit(states[index]);
  }
}