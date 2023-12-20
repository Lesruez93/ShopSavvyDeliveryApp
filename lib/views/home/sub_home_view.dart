import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopsavvy_delivery_app/style/app_color.dart';

class SubHomeView extends StatelessWidget {
  const SubHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Order History"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(itemBuilder: (context, index) {
          return Card(
            child: Container(
              margin: EdgeInsets.all(10),
              child: ListTile(
                trailing: Flexible(
                  child: Column(
                    children: [
                      Text(
                        "USD 1.78",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Expanded(child: Chip(
                        avatar: Icon(CupertinoIcons.check_mark_circled),
                        label: Text('Delivered'),
                        backgroundColor: AppColor.warningTint,
                      )),
                    ],
                  ),
                ),
                subtitle: Text('2 June 2023'),
                subtitleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColor.primarySoft),
                title: RichText(
                  text: TextSpan(
                    text: 'Order# ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: '002902 ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
