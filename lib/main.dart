import 'package:flutter/material.dart';
import 'theme.dart';

void main() {
  runApp(PaymentApp());
}

class PaymentApp extends StatefulWidget {
  @override
  _PaymentAppState createState() => _PaymentAppState();
}

class _PaymentAppState extends State<PaymentApp> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String subTitle, String Pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              width: 1.0,
              color: selectedIndex == index
                  ? Color(0xff007DFF)
                  : Color(0xff4D5B7C),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/icons/circle.png',
                          width: 18,
                          height: 18,
                        )
                      : Image.asset(
                          'assets/icons/circle-grey.png',
                          width: 18,
                          height: 18,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: planTextStyle,
                      ),
                      Text(
                        subTitle,
                        style: desTextStyle,
                      )
                    ],
                  ),
                  SizedBox(width: 30),
                  Text(
                    Pricing,
                    style: priceTextStyle,
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(
          left: 32,
          top: 50.0,
          right: 32,
        ),
        child: Column(
          children: [
            const Center(
              child: Image(
                image: AssetImage(
                  'assets/images/imgPayment.png',
                ),
                height: 180,
                width: 267,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Upgrade to', style: titleTextStyle),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  'Pro',
                  style: titleProTextStyle,
                )
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Go unlock all features and \nbuild your own bussinees bigger',
              style: subTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 51.23,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff007DFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(71),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Checkout Now',
                style: buttonTextStyle,
              ),
            ),
          ),
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff04112f),
        body: SingleChildScrollView(
            child: Column(
          children: [
            header(),
            const SizedBox(height: 30),
            option(0, 'Carabian latte', 'Good for drink night', '\$25'),
            option(1, 'Mocca sugar', 'Coffe drinking in morning', '\$70'),
            option(2, 'Odeng special', 'Special food Indonesia', '\$800'),
            const SizedBox(height: 30),
            selectedIndex == -1 ? SizedBox() : checkoutButton(),
            const SizedBox(height: 20),
          ],
        )),
      ),
    );
  }
}
