import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class PraytimeController extends GetxController {
  var hijriDate = HijriCalendar.now().toFormat("d MMMM, yyyy");
  var currentTime = DateTime.now().obs;
  Timer? _timer;

  final location = Hive.box("user").get("location");
  late double latitude;
  late double longitude;
  late Coordinates myCoordinates;

  final params = CalculationMethod.karachi.getParameters();
  final madhab = Madhab.hanafi;
  PrayerTimes? prayerTimes;

  // Get formatted time as a String
  String get formattedTime {
    return DateFormat('HH:mm').format(currentTime.value);
  }

  String date = DateFormat('d MMMM, yyyy').format(DateTime.now());

  // Get the prayer times
  PrayerTimes getPrayerTimes() {
    return PrayerTimes.today(myCoordinates, params);
  }

  String getFajrTime() {
    final prayerTimes = getPrayerTimes();
    return DateFormat('hh:mm a').format(prayerTimes.fajr);
  }

  String getSunRiceTime() {
    final prayerTimes = getPrayerTimes();
    return DateFormat('hh:mm a').format(prayerTimes.sunrise);
  }

  String getdhuhrTime() {
    final prayerTimes = getPrayerTimes();
    return DateFormat('hh:mm a').format(prayerTimes.dhuhr);
  }

  String getasrTime() {
    final prayerTimes = getPrayerTimes();
    return DateFormat('hh:mm a').format(prayerTimes.asr);
  }

  String getmaghribTime() {
    final prayerTimes = getPrayerTimes();
    return DateFormat('hh:mm a').format(prayerTimes.maghrib);
  }

  String getishaTime() {
    final prayerTimes = getPrayerTimes();
    return DateFormat('hh:mm a').format(prayerTimes.isha);
  }

  // Check if the current time is within forbidden prayer times
  bool isForbiddenTime(DateTime currentTime) {
    final prayerTimes = getPrayerTimes();

    // Check if before sunrise
    if (currentTime.isBefore(prayerTimes.sunrise)) {
      return true;
    }

    // Check if at noon (when the sun is at its peak)
    if (currentTime.isAfter(prayerTimes.dhuhr.subtract(Duration(minutes: 5))) &&
        currentTime.isBefore(prayerTimes.dhuhr.add(Duration(minutes: 5)))) {
      return true;
    }

    // Check if after sunset (during the time the sun is setting)
    if (currentTime.isAfter(prayerTimes.maghrib.subtract(Duration(minutes: 5))) &&
        currentTime.isBefore(prayerTimes.maghrib.add(Duration(minutes: 5)))) {
      return true;
    }

    return false;
  }

  String getCurrentPrayerTime() {
    final prayerTimes = getPrayerTimes();
    final now = DateTime.now();

    if (isForbiddenTime(now)) {
      return "এটি নামাজ পড়ার নিষিদ্ধ সময়।";
    }

    // List of prayer times in order, each with a name and time
    final List<Map<String, dynamic>> prayerTimesList = [
      {'name': 'ফজর', 'time': prayerTimes.fajr},
      {'name': 'সূর্যোদয়', 'time': prayerTimes.sunrise},
      {'name': 'যুহর', 'time': prayerTimes.dhuhr},
      {'name': 'আসর', 'time': prayerTimes.asr},
      {'name': 'মাগরিব', 'time': prayerTimes.maghrib},
      {'name': 'ইশা', 'time': prayerTimes.isha},
    ];

    // Find the current prayer time
    final currentPrayer = prayerTimesList.lastWhere(
      (prayer) =>
          now.isAfter(prayer['time'] as DateTime) ||
          now.isAtSameMomentAs(prayer['time'] as DateTime),
      orElse: () => {'name': 'None', 'time': prayerTimesList.first['time']},
    );

    final nextPrayer = prayerTimesList.firstWhere(
      (prayer) => (prayer['time'] as DateTime).isAfter(now),
      orElse: () => prayerTimesList.first,
    );

    // Calculate the time remaining until the next prayer
    final difference = (nextPrayer['time'] as DateTime).difference(now);
    final hours = difference.inHours;
    final minutes = difference.inMinutes % 60;

    // Format the output
    return '${currentPrayer['name']} ${hours < 0 && minutes < 0 ? 'Less than 0h 01m' : '${hours}h ${minutes}m'} পরবর্তী নামাজ ${nextPrayer['name']} (${DateFormat('hh:mm a').format(nextPrayer['time'] as DateTime)})';
  }

  @override
  void onInit() {
    super.onInit();

    // Initialize latitude and longitude
    latitude = Hive.box("user").get("latitude");
    longitude = Hive.box("user").get("longitude");

    // Initialize myCoordinates after latitude and longitude are set
    myCoordinates = Coordinates(latitude, longitude);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      location;
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
