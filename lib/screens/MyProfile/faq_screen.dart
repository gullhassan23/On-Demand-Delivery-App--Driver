import 'package:driverapp/global/refs.dart';
import 'package:driverapp/models/faq.dart';
import 'package:driverapp/widgets/font.dart';
import 'package:driverapp/widgets/loading_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Headline('FAQs')),
      body: StreamBuilder(
        stream: faqRef.orderBy('question').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data.docs.isEmpty) {
            return CircularLoadingWidget(
              height: context.height,
              onCompleteText: 'No FAQs yet...',
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            padding: const EdgeInsets.all(15),
            itemBuilder: (context, index) {
              final faq = FaqModel.fromMap(snapshot.data.docs[index]);
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: ExpansionTile(
                  title: Headline(faq.question!, fontsize: 16),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BodyText(faq.answer!),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
