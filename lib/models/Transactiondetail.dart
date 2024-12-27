import 'package:cloud_firestore/cloud_firestore.dart';

import 'jobs.dart';

class TransactionModel {
  final String userId;
  final double totalPrice;
  final double commission;
  final double totalPriceAfterCommission;
  final DateTime timestamp;
  final JobModel job; // New variable to hold JobModel data

  TransactionModel({
    required this.userId,
    required this.totalPrice,
    required this.commission,
    required this.totalPriceAfterCommission,
    required this.timestamp,
    required this.job, // Add JobModel variable to constructor
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'totalPrice': totalPrice,
      'commission': commission,
      'totalPriceAfterCommission': totalPriceAfterCommission,
      'timestamp': timestamp,
      'job': job
          .toMap(), // Convert JobModel to a map and include it in the TransactionModel map
    };
  }
}
