// Define the _showBottomSheet function outside the onPressed handler
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/icons.dart';
import '../../global/refs.dart';
import '../../models/vehicle.dart';
import '../../widgets/Row.dart';
import '../../widgets/buttons.dart';
import '../../widgets/font.dart';


void vehicleListSheet(BuildContext context, Function(VehicleModel) ontap) {
  showModalBottomSheet(
    context: context,
    isDismissible: false,
    enableDrag: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 20,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SheetBack(ontap: () => Navigator.of(context).pop())
                    .marginOnly(bottom: 20),
                const Headline("Vehicles"),
                const SizedBox(height: 20),
                Expanded(
                  child: StreamBuilder(
                    stream: vehicleRef.orderBy('name').snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError ||
                          !snapshot.hasData ||
                          snapshot.data.docs.isEmpty) {
                        return const Center(
                          child: Text(
                            'No vehicles found. Please comeback later',
                          ),
                        );
                      }
                      return ListView(
                        children: List.generate(
                          snapshot.data.docs.length,
                          (index) {
                            final vehicle =
                                VehicleModel.fromMap(snapshot.data.docs[index]);
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  ontap(vehicle);
                                });
                                Navigator.of(context).pop();
                              },
                              child: JobDetailsRow(
                                heading: vehicle.name ?? '',
                                bodyText: "${vehicle.duration} Days",
                                IconData: AppIcons.Box,
                                price: "\$${vehicle.amount}",
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
