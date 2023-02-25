import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        'bmiCalc': (context) => const BmiCalc(),
      },
    ),
  );
}

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, 'bmiCalc'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset("assets/images/bmi-logo.png",
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}

class BmiCalc extends StatefulWidget {
  const BmiCalc({Key? key}) : super(key: key);

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  double height = 0;
  double weight = 0;
  double meter = 0;

  double bmi = 0;
  int age = 0;
  bool tap = true;
  String category = "";

  // bool male = true;
  // bool female = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xff02061B),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 8, left: 30),
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: -200, end: 0),
                        duration: const Duration(milliseconds: 2000),
                        builder: (context, val, widget) {
                          return Transform.translate(
                            offset: Offset(val, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: (tap == false)
                                    ? const Color(0xff171830)
                                    : const Color(0xff4B4E5E),
                              ),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        tap = !tap;
                                      });
                                    },
                                    child: TweenAnimationBuilder(
                                      tween:
                                          Tween<double>(begin: 0, end: 2 * pi),
                                      duration:
                                          const Duration(milliseconds: 2000),
                                      builder: (context, val, widget) {
                                        return Transform.rotate(
                                          angle: val,
                                          child: widget,
                                        );
                                      },
                                      child: Icon(
                                        Icons.female_sharp,
                                        size: 130,
                                        color: (tap == false)
                                            ? const Color(0xffD8D8DB)
                                            : const Color(0xffE91E63),
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "Female",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xffD9D9DC)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 30, left: 8),
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 200, end: 0),
                        duration: const Duration(milliseconds: 2000),
                        builder: (context, val, widget) {
                          return Transform.translate(
                            offset: Offset(val, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: (tap == false)
                                    ? const Color(0xff4B4E5E)
                                    : const Color(0xff1d1e33),
                              ),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        tap = !tap;
                                      });
                                    },
                                    child: TweenAnimationBuilder(
                                      tween:
                                          Tween<double>(begin: 0, end: 2 * pi),
                                      duration:
                                          const Duration(milliseconds: 2000),
                                      builder: (context, val, widget) {
                                        return Transform.rotate(
                                          angle: val,
                                          child: widget,
                                        );
                                      },
                                      child: Icon(
                                        Icons.male_sharp,
                                        size: 130,
                                        color: (tap == false)
                                            ? const Color(0xffE91E63)
                                            : const Color(0xffD8D8DB),
                                      ),
                                    ),
                                  ),
                                  const Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "Male",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffD9D9DC),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 5, left: 30, right: 30),
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: -200, end: 0),
                  curve: Curves.bounceOut,
                  duration: const Duration(milliseconds: 1000),
                  builder: (context, val, widget) {
                    return Transform.translate(
                      offset: Offset(0, val),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xff171830),
                        ),
                        child: Column(
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Height",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff4B4E5E),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${height.toInt()}",
                                    style: const TextStyle(
                                        fontSize: 50, color: Colors.white),
                                  ),
                                  const Text(
                                    "cm",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff626473),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: SliderTheme(
                                data: const SliderThemeData(
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 10),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 30),
                                  trackHeight: 1,
                                ),
                                child: Slider(
                                  onChanged: (double value) {
                                    setState(() {
                                      height = value;
                                    });
                                  },
                                  value: height,
                                  min: 0,
                                  max: 360,
                                  divisions: 359,
                                  activeColor: const Color(0xff383844),
                                  inactiveColor: const Color(0xff383844),
                                  thumbColor: const Color(0xffEC0D54),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5, left: 30, right: 8),
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: -200, end: 0),
                        duration: const Duration(milliseconds: 2000),
                        curve: Curves.bounceOut,
                        builder: (context, val, widget) {
                          return Transform.translate(
                            offset: Offset(val, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xff171830),
                              ),
                              child: Column(
                                children: [
                                  const Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Weight",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xffF1F1F3)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${weight.toInt()}",
                                      style: const TextStyle(
                                          fontSize: 35,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (weight.toInt() <= 0) {
                                                    weight = 0;
                                                  } else {
                                                    weight--;
                                                  }
                                                });
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xff4B4E5E)),
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.grey.shade500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  weight++;
                                                });
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xff4B4E5E)),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.grey.shade500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5, right: 30, left: 8),
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 200, end: 0),
                        duration: const Duration(milliseconds: 2000),
                        curve: Curves.bounceOut,
                        builder: (context, val, widget) {
                          return Transform.translate(
                            offset: Offset(val, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xff171830),
                              ),
                              child: Column(
                                children: [
                                  const Expanded(
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Age",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xffF1F1F3)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "$age",
                                      style: const TextStyle(
                                          fontSize: 35,
                                          color: Color(0xffFFFFFF)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (age <= 2) {
                                                    age = 2;
                                                  } else {
                                                    age--;
                                                  }
                                                });
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xff4B4E5E)),
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Colors.grey.shade500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          flex: 1,
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  age++;
                                                });
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color(0xff4B4E5E)),
                                                child: Icon(Icons.add,
                                                    color:
                                                        Colors.grey.shade500),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 200, end: 0),
                  duration: const Duration(milliseconds: 1000),
                  // curve: Curves.bounceOut,
                  builder: (context, val, widget) {
                    return Transform.translate(
                      offset: Offset(0, val),
                      child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff171830),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                bmi.toStringAsFixed(2),
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: Color(0xffffffff),
                                ),
                              ),
                              Text(
                                category,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xffffffff),
                                ),
                              )
                            ],
                          )),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (tap != 0 && age >= 2) {
                        meter = height / 100;
                        bmi = weight / (meter * meter);
                        if (bmi <= 18.5) {
                          category = "Underweight";
                        } else if (bmi >= 18.5 && bmi <= 24.9) {
                          category = "Normal weight";
                        } else if (bmi >= 25 && bmi <= 29.9) {
                          category = "Overweight";
                        } else {
                          category = "Obesity";
                        }
                      }
                    });
                  },
                  borderRadius: BorderRadius.circular(30),
                  splashColor: Colors.white,
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 200, end: 0),
                    curve: Curves.bounceOut,
                    duration: const Duration(milliseconds: 2000),
                    builder: (context, val, widget) {
                      return Transform.translate(
                        offset: Offset(0, val),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffE91E63),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Calculate",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xff02061B),
      ),
    );
  }
}
