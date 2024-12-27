import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final firestore = FirebaseFirestore.instance;
FirebaseStorage storage = FirebaseStorage.instance;
Reference jobimageRef = storage.ref().child('jobimages/${DateTime.now()}.png');

///
final customersRef = firestore.collection('Customers');
final adminRef = firestore.collection('Admins');
final driverRef = firestore.collection('Drivers');
final settingsRef = firestore.collection('Settings');
final jobsRef = firestore.collection('Jobs');
final chatRef = firestore.collection('Chats');
final walletRef = firestore.collection('Wallet');
final faqRef = firestore.collection('FAQs');
final ratesRef = firestore.collection('Rates');
final reviewRef = firestore.collection('Reviews');
final vehicleRef = firestore.collection('Vehicles');
final withdrawRef = firestore.collection('Withdraws');
final utilsRef = firestore.collection('Utils');
final transactionRef = firestore.collection('Transactions');
final notificationRef = firestore.collection('Notification');

/// sub  collections

CollectionReference messagesRef(String id) =>
    chatRef.doc(id).collection('Messages');

CollectionReference notifications(String id) =>
    settingsRef.doc(id).collection('Notifications');
