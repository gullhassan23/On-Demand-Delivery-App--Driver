
import 'package:driverapp/widgets/font.dart';
import 'package:flutter/material.dart';

class WithdrawHistory extends StatefulWidget {
  WithdrawHistory({super.key});

  @override
  State<WithdrawHistory> createState() => _WithdrawHistoryState();
}

class _WithdrawHistoryState extends State<WithdrawHistory> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
          leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Headline('Withdraw History'),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: screenSize.height*0.04),
             PaymentHistoryRow(heading: 'Withdraw Amount : 200\$', image: 'assets/images/creditcard.png', bodyText: '09-oct-2023', price: 'completed'),
              SizedBox(height: screenSize.height*0.04),
             PaymentHistoryRow(heading: 'Withdraw Amount : 450\$', image: 'assets/images/applepay.jpg', bodyText: '10-nov-2023', price: 'completed'),
              SizedBox(height: screenSize.height*0.04),
             PaymentHistoryRow(heading: 'Withdraw Amount : 820\$', image: 'assets/images/paypal.png', bodyText: '21-nov-2022', price: 'completed')
            ],
          ),
        ),
      ),
    );
  }
}


class PaymentHistoryRow extends StatelessWidget {
  final String heading;
  final String image; // Image path or URL
  final String bodyText;
  final String price;

  PaymentHistoryRow({super.key, 
    required this.heading,
    required this.image,
    required this.bodyText,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return InkWell(
     onTap: () {
    _showBankDetailsBottomSheet(context);
  },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 60,
            height: screenSize.height*0.06,
            child: CircleAvatar(
              backgroundImage: AssetImage(image),
              radius: 30,
            ),
          ),
          SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 4,),
              Text(
                bodyText,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          Spacer(),
          Text(
            price,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}

void _showBankDetailsBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BankDetailsBottomSheet();
    },
  );
}


class BankDetailsBottomSheet extends StatelessWidget {
  BankDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Headline('Bank Name'),
            subtitle:SimpleText('Your Bank Name'),
            
          ),
          ListTile(
            title: Headline('Account Number'),
            subtitle: SimpleText('123**********0'),
          ),
          ListTile(
            title: Headline('Account Holder'),
            subtitle: SimpleText('Your Name'),
          ),
          ListTile(
            title: Headline('Balance'),
            subtitle: SimpleText('\$1000.00'),
          ),
          // Add more ListTile widgets for additional bank details
        ],
      ),
    );
  }
}
