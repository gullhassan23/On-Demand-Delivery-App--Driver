// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/constants/icons.dart';
import 'package:driverapp/global/refs.dart';
import 'package:driverapp/models/jobs.dart';
import 'package:driverapp/screens/Wallet/withdraw.dart';
import 'package:driverapp/services/user_services.dart';
import 'package:driverapp/widgets/Row.dart';
import 'package:driverapp/widgets/colors.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ondemand/ondemand.dart';

class Wallet extends StatefulWidget {
  Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  UserServices _userServices = Get.find<UserServices>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Headline("Wallet"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Add padding around the ListView
        child: ListView(
          children: [
            SizedBox(height: screenSize.height * 0.01),
            // Text(_userServices.driver.id.toString()),

            Container(
              // height: screenSize.height*0.010,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                      height:
                          screenSize.height * 0.016), // Adjusted padding here
                  Row(
                    children: [
                      SizedBox(width: 16.0), // Adjusted padding here
                      BodyText('My Balance'),
                    ],
                  ),
                  StreamBuilder(
                      stream:
                          walletRef.doc(_userServices.driver.id).snapshots(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          return Row(
                            children: [
                              SizedBox(width: 16.0), // Adjusted padding here
                              WhiteText(
                                  snapshot.data!.data().toString() != "null"
                                      ? '\$ ${snapshot.data!['wallet']}'
                                      : '\$ 0'),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      }),

                  SizedBox(
                      height:
                          screenSize.height * 0.016), // Adjusted padding here
                ],
              ),
            ),
            SizedBox(height: screenSize.height * 0.03),
            Row(
              children: [
                Headline('Withdrawal Request'),
              ],
            ),
            SizedBox(height: screenSize.height * 0.02),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Black outline color
                  width: 1.0, // Border width
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SizedBox(
                width: double.infinity, // Expands to screen width
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Withdraw()), // Replace with your destination page
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: screenSize.height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.lightgrey,
                          ),
                          child:
                              Image.asset('assets/images/Mastercard Icon.png'),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Headline('Withdrawal Request'),
                          SizedBox(height: 6),
                          BodyText('click here to withdraw'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            Row(
              children: [
                Headline('Transaction & Job History'),
              ],
            ),
            SizedBox(
              height: screenSize.height * 0.03,
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              // stream: jobsRef
              //     .where("driver",
              //         isEqualTo: controller.driver.id)
              //     .snapshots(),
              stream: transactionRef
                  .doc(_userServices.driver.id.toString())
                  .collection("transactiondetail")
                  // .where("driver",
                  //     isEqualTo: _userServices.driver.id.toString())
                  .snapshots(),
              builder: (context, snapshot) {
                // print("snapshot ${snapshot.data!.docs.length}");
                // if (snapshot.connectionState ==
                //     ConnectionState.waiting) {
                //   return Center(
                //     child: CircularProgressIndicator(),
                //   );
                // }

                if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Column(
                    children: [
                      SizedBox(
                        height: screenSize.height * 0.06,
                      ),
                      Center(child: Text('No data available')),
                    ],
                  );
                }

                // If data is available, build the ListView.builder
                return Column(
                  children: [
                    // Divider(),
                    // Row(
                    //   children: [
                    //     Headline("${snapshot.data!.docs.length} Result"),
                    //   ],
                    // ),
                    // Divider(),
                    ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        // Access each document from the snapshot and display its data
                        // var document = snapshot.data!.docs[index];
                        List<DocumentSnapshot> documents = snapshot.data!.docs;
                        List<JobModel> job = documents.map((doc) {
                          return JobModel.fromMap(
                              doc.data() as Map<String, dynamic>);
                        }).toList();
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(() => OnDemandScreen(
                                      offerdata: job[index],
                                    ));
                              },
                              child: JobDetailsRow(
                                  heading: job[index].title.toString(),
                                  bodyText: job[index].created.toString(),
                                  IconData: AppIcons.Box,
                                  price: '\$${job[index].amount.toString()}'),
                            ),
                            Divider(),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
            ),
            // JobDetailsRow(
            //     heading: 'Drop Off Payment',
            //     bodyText: 'Mar 18,2022',
            //     IconData: AppIcons.Box,
            //     price: '\$25.5'),
            // Divider(),
            // JobDetailsRow(
            //     heading: 'cargo Shipping ',
            //     bodyText: 'Mar 10,2022',
            //     IconData: AppIcons.Box,
            //     price: '\$29.5'),
            // Divider(),
            // JobDetailsRow(
            //     heading: 'Express Shipping',
            //     bodyText: 'Mar 6,2022',
            //     IconData: AppIcons.Box,
            //     price: '\$50.5'),
            // Divider(),
            // JobDetailsRow(
            //     heading: 'Pick Up Payment',
            //     bodyText: 'Mar 2,2022',
            //     IconData: AppIcons.Box,
            //     price: '\$16.5'),
          ],
        ),
      ),
    );
  }
}
