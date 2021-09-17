import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/my_custom_widgets.dart';
import '../Components/icon_content.dart';
import '../Components/my_constants.dart';
import '../Components/my_round_icon_button.dart';
import 'result_page.dart';
import '../Components/my_bottom_bar.dart';
import 'package:bmi_calculator_flutter/Components/bmi_calculator.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? genderType;
  int height = 180;
  int weight = 70;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Center(
            child: Text(
              'BMI Calculator',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReuseableWidget(
                        customColor: genderType == Gender.male
                            ? kActiveColor
                            : kInactiveColor,
                        customchild: IconContent(FontAwesomeIcons.mars, 'Male'),
                        onPress: () {
                          setState(() {
                            genderType = Gender.male;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ReuseableWidget(
                          customColor: genderType == Gender.female
                              ? kActiveColor
                              : kInactiveColor,
                          customchild:
                              IconContent(FontAwesomeIcons.venus, 'Female'),
                          onPress: () {
                            setState(() {
                              genderType = Gender.female;
                            });
                          }),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ReuseableWidget(
                  customColor: kActiveColor,
                  customchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: kMyTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(), style: kMyBoldTextStyle),
                          Text('cm', style: kMyTextStyle)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.deepPurpleAccent.shade700,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Colors.deepPurpleAccent,
                            overlayColor: Color(0x299A32CD),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30)),
                        child: Slider(
                            value: height.toDouble(),
                            min: 60,
                            max: 240,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReuseableWidget(
                          customColor: kActiveColor,
                          customchild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Weight',
                                style: kMyTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kMyBoldTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyRoundIconButton(FontAwesomeIcons.minus, () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  MyRoundIconButton(FontAwesomeIcons.plus, () {
                                    setState(() {
                                      weight++;
                                    });
                                  })
                                ],
                              )
                            ],
                          ),
                          onPress: () {}),
                    ),
                    Expanded(
                      child: ReuseableWidget(
                          customColor: kActiveColor,
                          customchild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Age',
                                style: kMyTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kMyBoldTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MyRoundIconButton(FontAwesomeIcons.minus, () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  MyRoundIconButton(FontAwesomeIcons.plus, () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                                ],
                              )
                            ],
                          ),
                          onPress: () {}),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6, bottom: 5),
                child: MyBottomBar(
                  barText: 'Calculate',
                  onPressed: () {
                    BMICalculatorBrain calculator =
                        BMICalculatorBrain(weight: weight, height: height);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (ResultPage(
                          result: calculator.getResult(),
                          resultText: calculator.bmiResultText(),
                          advice: calculator.advice(),
                        )),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
