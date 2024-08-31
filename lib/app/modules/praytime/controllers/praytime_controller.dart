import 'dart:async';

import 'package:adhan/adhan.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class PraytimeController extends GetxController {
  var hijriDate = HijriCalendar.now().toFormat("d MMMM, yyyy");
  var currentTime = DateTime.now().obs;
  Timer? _timer;

  // Get formatted time as a String
  String get formattedTime {
    return DateFormat('HH:mm').format(currentTime.value);
  }

  String date = DateFormat('d MMMM, yyyy').format(DateTime.now());

  // Coordinates for the location

  final myCoordinates =
      Coordinates(23.5449, 90.5296); // Replace with your own location lat, lng.
  final params = CalculationMethod.karachi.getParameters();
  final madhab = Madhab.hanafi;
  PrayerTimes? prayerTimes;

  // Get the prayer times

  gettime(
      CalculationParameters params, Madhab madhab, Coordinates coordinates) {
    final prayertimes = PrayerTimes.today(
      coordinates,
      params,
    );
    return prayertimes;
  }

  // Get the prayer times

  String getFajrTime() {
    final prayerTimes = gettime(params, madhab, myCoordinates);
    return DateFormat('hh:mm a').format(prayerTimes.fajr);
  }

  String getSunRiceTime() {
    final prayerTimes = gettime(params, madhab, myCoordinates);
    return DateFormat('hh:mm a').format(prayerTimes.sunrise);
  }

  String getdhuhrTime() {
    final prayerTimes = gettime(params, madhab, myCoordinates);
    return DateFormat('hh:mm a').format(prayerTimes.dhuhr);
  }

  String getasrTime() {
    final prayerTimes = gettime(params, madhab, myCoordinates);
    return DateFormat('hh:mm a').format(prayerTimes.asr);
  }

  String getmaghribTime() {
    final prayerTimes = gettime(params, madhab, myCoordinates);
    return DateFormat('hh:mm a').format(prayerTimes.maghrib);
  }

  String getishaTime() {
    final prayerTimes = gettime(params, madhab, myCoordinates);
    return DateFormat('hh:mm a').format(prayerTimes.isha);
  }

  // Next prayer time

PrayerTimes getPrayerTimes() {
  return PrayerTimes.today(myCoordinates, params);
}

String getCurrentPrayerTime() {
  final prayerTimes = getPrayerTimes();
  final now = DateTime.now();

  // List of prayer times in order, each with a name and time
  final List<Map<String, dynamic>> prayerTimesList = [
    {'name': 'Fajr', 'time': prayerTimes.fajr},
    {'name': 'Sunrise', 'time': prayerTimes.sunrise},
    {'name': 'Dhuhr', 'time': prayerTimes.dhuhr},
    {'name': 'Asr', 'time': prayerTimes.asr},
    {'name': 'Maghrib', 'time': prayerTimes.maghrib},
    {'name': 'Isha', 'time': prayerTimes.isha},
  ];

  // Find the current prayer time
  final currentPrayer = prayerTimesList.lastWhere(
    (prayer) => now.isAfter(prayer['time'] as DateTime) || now.isAtSameMomentAs(prayer['time'] as DateTime),
    orElse: () => {'name': 'None', 'time': prayerTimesList.first['time']}
  );

  final nextPrayer = prayerTimesList
      .firstWhere((prayer) => (prayer['time'] as DateTime).isAfter(now), orElse: () => prayerTimesList.first);

  // Calculate the time remaining until the next prayer
  final difference = (nextPrayer['time'] as DateTime).difference(now);
  final hours = difference.inHours;
  final minutes = difference.inMinutes % 60;

  // Format the output
  return '${currentPrayer['name']} ${hours < 0 && minutes < 0 ? 'Less than 0h 01m' : '${hours}h ${minutes}m'} until ${nextPrayer['name']} (${DateFormat('hh:mm a').format(nextPrayer['time'] as DateTime)})';
}

// Get the current prayer time

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentTime.value = DateTime.now();
      update();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
