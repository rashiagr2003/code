import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:testiproject/home_page.dart';

class Test1 extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Test1State createState() => _Test1State();
}

class _Test1State extends State<Test1> with SingleTickerProviderStateMixin {
  // custom tab bar controller
  late TabController controller;

  @override
  void initState() {
    super.initState();

    // SingleTockerProviderStateMixin is used to control the animation of the tab bar controller
    controller = TabController(length: 2, vsync: this);
    // refresh the state of the tab bar to display index on app bar and tab bar controller on app bar
    controller.addListener(() {
      setState(() {});
    });
  }

  // dispose the tab controller when the app is closed to avoid memory leaks
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 250,
          backgroundColor: Colors.black,
          title: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.squarespace-cdn.com/content/v1/601bb91eb4b86828b4d6cf0f/1612729292590-C3I6CP9C272T4D2KDMOP/Copy+of+Welcome+Long.png"))),
          ),
          centerTitle: true,
          bottom: TabBar(controller: controller, tabs: const [
            Tab(
              child: Text(
                "Sign up",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
        ),
        // no of widgets must be same as parent (TabBar)
        body: TabBarView(controller: controller, children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                    padding: EdgeInsets.only(top: 5, left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(),
                        color: Colors.white),
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "User Name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                    padding: EdgeInsets.only(top: 5, left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(),
                        color: Colors.white),
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "User Email I'd",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                    padding: EdgeInsets.only(top: 5, left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(),
                        color: Colors.white),
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Create Password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Container(
                      width: 328,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color.fromARGB(255, 235, 36, 36),
                      ),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                    padding: EdgeInsets.only(top: 5, left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(),
                        color: Colors.white),
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "User Name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                    padding: EdgeInsets.only(top: 5, left: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(),
                        color: Colors.white),
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Center(
                      child: Container(
                        width: 328,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Color.fromARGB(255, 235, 36, 36),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.all(12),
                          width: 156,
                          child: Text("Forgot your password?",
                              style: TextStyle(fontWeight: FontWeight.w500)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ));
}
