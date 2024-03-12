import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iegy/core/utils/app_assets.dart';
import 'package:iegy/features/home/presentation/components/home_category.dart';
import 'package:iegy/features/home/presentation/cubit/home_cubit/home_state.dart';
import 'package:iegy/features/home/presentation/screens/notifications_screen.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  FocusNode focusNode = FocusNode();

  void onWhatsAppPressed() async {
    var whatsappUrl = "whatsapp://send?phone=+201015066160";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  void dialPhoneNumber() async {
    var phoneNumber = '+201017689600';
    var dialUrl = 'tel:$phoneNumber';

    if (await canLaunch(dialUrl)) {
      await launch(dialUrl);
    } else {
      throw 'Could not launch $dialUrl';
    }
  }

  void openFacebookPage() async {
    var facebookUrl = "https://www.facebook.com/profile.php?id=100086191197579&mibextid=dGKdO6";

    if (await canLaunch(facebookUrl)) {
      await launch(facebookUrl);
    } else {
      throw 'Could not launch $facebookUrl';
    }
  }

  final SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String? spokenWords = "";
  double confidenceLevel = 0;

  void onVoiceSearchClicked() async {
    speechEnabled = await speechToText.initialize();
    if(speechToText.isListening) {
      _stopListening();
    } else {_startListening();}
  }

  void _startListening() async {
    await speechToText.listen(onResult: _onSpeechResult);
    confidenceLevel = 0;
    emit(SpeechEnabledState());
  }

  void _stopListening () async {
    await speechToText.stop();
    emit(HomeInitial());
  }

  void _onSpeechResult(result) {
    spokenWords = "${result.recognizedWords}";
    confidenceLevel = result.cofidence;
    emit(HomeInitial());
  }

  void goToNotifications(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const NotificationsScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var slideAnimation = animation.drive(tween);
          return SlideTransition(
            position: slideAnimation,
            child: child,
          );
        },
      ),
    );
  }
}