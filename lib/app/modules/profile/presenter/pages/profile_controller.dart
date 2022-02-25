import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part "profile_controller.g.dart";

@Injectable()
class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  _ProfileControllerBase() {
    analyticsDefines();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>().setCurrentScreen(screenName: 'Profile');
  }
}
