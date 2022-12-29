import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ShareData> portFolioList = [];
  List<ShareData> shareDataList = [
    ShareData(
        imageUrl:
            "https://d2t1xqejof9utc.cloudfront.net/screenshots/pics/4e0fce665d835af5fb2cf06d1b2f2026/large.jpg",
        noOfItems: 100,
        name: "TATA",
        noofsolditem: 900,
        buy_price: 400,
        mrp: 440),
    ShareData(
        imageUrl:
            "https://seeklogo.com/images/A/adani-power-logo-87266F764F-seeklogo.com.png",
        noOfItems: 5,
        name: "ADANI",
        noofsolditem: 0,
        buy_price: 580,
        mrp: 600),
    ShareData(
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/7/75/Zomato_logo.png",
        noOfItems: 200,
        name: "Zomato",
        noofsolditem: 400,
        buy_price: 380,
        mrp: 400),
    ShareData(
        imageUrl:
            "https://www.logo-designer.co/storage/2017/04/2017-Design-Stack-new-logo-design-State-Bank-of-India.png",
        noOfItems: 500,
        name: "SBI BANK",
        noofsolditem: 50,
        buy_price: 580,
        mrp: 600),
    ShareData(
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/ICICI_Bank_Logo.svg/2560px-ICICI_Bank_Logo.svg.png",
        noOfItems: 500,
        name: "ICICI BANK",
        noofsolditem: 200,
        buy_price: 100,
        mrp: 150),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              leading: Container(),
              primary: false,
              bottom: const TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "Available Items",
                  ),
                  Tab(
                    text: "Sold Out",
                  ),
                ],
              ),
            ),
            body: TabBarView(children: <Widget>[
              Card(
                child: ListView.builder(
                  itemCount: shareDataList.length,
                  itemBuilder: (context, index) {
                    return buy_tile(shareData: shareDataList[index]);
                    Row(
                      children: [
                        Container(
                          height: 80,
                          width: 100,
                        )
                      ],
                    );
                  },
                ),
              ),
              Card(
                child: ListView.builder(
                  itemCount: portFolioList.length,
                  itemBuilder: (context, index) {
                    return sold_tile(shareData: portFolioList[index]);
                  },
                ),
              ),
            ])));
  }

  Widget buy_tile({required ShareData shareData}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        leading: Container(
          width: 100,
          height: 100,
          child: Image.network(shareData.imageUrl),
        ),
        title: Text(shareData.name),
        subtitle: Container(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Available Quantity-" + shareData.noOfItems.toString()),
                  Text("Sold-" + shareData.noofsolditem.toString())
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("MPQ-" + "50"),
                  Text("ATS - " + "2 week"),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        portFolioList.add(shareData);
                      });
                    },
                    child: Container(
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(color: Colors.blue.shade900),
                      child: Center(
                        child: Text(
                          "Buy",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Buy Price -" + shareData.buy_price.toString()),
                  Text("MRP-" + shareData.mrp.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sold_tile({required ShareData shareData}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        leading: Container(
          width: 100,
          height: 100,
          child: Image.network(shareData.imageUrl),
        ),
        title: Text(shareData.name),
        subtitle: Container(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("MPQ-" + "50"),
                  Text("ATS - " + "2 week"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Buy Price -" + shareData.buy_price.toString()),
                  Text("MRP-" + shareData.mrp.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShareData {
  final String imageUrl;
  final int noOfItems;

  final String name;

  final int noofsolditem;

  final double buy_price;
  final double mrp;

  ShareData(
      {required this.imageUrl,
      required this.noOfItems,
      required this.name,
      required this.noofsolditem,
      required this.buy_price,
      required this.mrp});
}
