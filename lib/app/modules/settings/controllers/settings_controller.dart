import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsController extends GetxController {
  Future<void> applaunchUrl() async {
    if (!await launchUrl(Uri(
       scheme: 'mehedihasannovi@gmail.com',
    
    queryParameters: {
      'subject': "Ramadan Planner App User Feedback", 
      'body': "Hello, I am using the Ramadan Planner App and I would like to provide feedback on the following:",
    },
    ))) {
      throw Exception('Could not launch ');
    }
  }
}
