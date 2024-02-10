import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore fireStore = FirebaseFirestore.instance;
final DateTime time = DateTime.now();

Future getUsersName(String name) async {
  try {
    await fireStore.collection('users').add({
      'name': name,
      'time': time,
    }).then((value) => print("User Added"));
  } catch (e) {
    print("Error: $e");
  }
}
