import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:studentplanner/constants/color.dart';
import 'package:studentplanner/screens/screen_home.dart';

class OnboardingScreen extends StatefulWidget {
  static String id = 'onboarding';
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<String> listImage = [
    "assets/images/LogoOnboardingA.png",
    "assets/images/LogoOnboardingB.png",
    "assets/images/LogoOnboardingC.png",
    "assets/images/LogoOnboardingD.png"
  ];

  List<String> listTitle = [
    'Hello! This is new Student Planner application',
    "Quick search by university",
    "Notifications about the start of classes",
    "Group chats for communication"
  ];
  List<String> listContent = [
    "View your class schedule without errors RUZ",
    "Find out information about groups, teachers and free classrooms",
    "You will be able to receive notifications about the start of your couples",
    "Create groups with classmates to discuss joint projects"
  ];

  int currentIndex = 0;

  PageController _pageViewController = PageController(initialPage: 0);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late bool _success;
  late String _userEmail;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signInWithEmailAndPassword() async {
    final UserCredential userCredential =
        (await _auth.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ));

    if (userCredential != null) {
      setState(() {
        _success = true;
        final user = userCredential.user;
        if (user != null) {
          _userEmail = user.uid;
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen()
              ),
              ModalRoute.withName("/Home")
          );
        }
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MainColor.darkSecondary,
        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 10,
              child: PageIndicatorContainer(
                align: IndicatorAlign.bottom,
                length: 4,
                indicatorSpace: 5.0,
                padding: const EdgeInsets.all(10),
                indicatorColor: Colors.grey,
                indicatorSelectorColor: Colors.blue,
                pageView: PageView.builder(
                  controller: _pageViewController,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, position) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 40),
                          child: Image.asset(
                            listImage[position],
                            width: 280,
                            height: 280,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            listTitle[position],
                            style: TextStyle(
                              fontSize: 25,
                              color: MainColor.darkGray6,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Text(listContent[position],
                              style: TextStyle(
                                  fontSize: 15, color: MainColor.darkGray),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(bottom: 30, top: 30, right: 15, left: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: MainColor.lightBlue,
              ),
              child: MaterialButton(
                onPressed: () {
                  if (currentIndex < 3) {
                    _pageViewController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  } else {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        isScrollControlled: true,
                        builder: (context) {
                          return FractionallySizedBox(
                            heightFactor: 0.92,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 240, 240, 243),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  new Divider(
                                    color: Color.fromARGB(255, 207, 207, 211),
                                    height: 1,
                                  ),
                                  Image.asset(
                                    "assets/images/logo_university.jpg",
                                    height: 160,
                                    width: 160,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: TextField(
                                      controller: _emailController,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                          hintText:
                                              "Input account or your email",
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey,
                                          ),
                                          border: OutlineInputBorder(),
                                          prefixIcon:
                                              Icon(Icons.account_box_outlined)),
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: TextField(
                                      controller: _passwordController,
                                      autofocus: true,
                                      decoration: InputDecoration(
                                          hintText: "Input password",
                                          hintStyle: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey,
                                          ),
                                          border: OutlineInputBorder(),
                                          prefixIcon: Icon(Icons.password)),
                                      keyboardType: TextInputType.text,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: MaterialButton(
                                      onPressed: () {
                                        _signInWithEmailAndPassword();
                                      },
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: MainColor.darkPrimary),
                                      ),
                                      color: Colors.blue,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      minWidth: double.infinity,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                },
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 25, color: MainColor.darkPrimary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
