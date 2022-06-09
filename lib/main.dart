import 'package:flutter/material.dart';
import 'helper.dart';

void main() {
  runApp(HarryPotterPage());
}

class HarryPotterPage extends StatelessWidget {
  const HarryPotterPage({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HarryPotter(),
    );
  }
}

Helper helper = new Helper();

class HarryPotter extends StatefulWidget {
  _HarryPotterState createState() => _HarryPotterState();
}

class _HarryPotterState extends State<HarryPotter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[1000],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/harrypotter.png'),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 120),
                    child: Text(
                      helper.getQuestion(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      helper.nextQuestion(1);
                    });
                  },
                  child: Text(
                    helper.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: helper.buttonShouldBeVisible(),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        helper.nextQuestion(2);
                      });
                    },
                    child: Text(
                      helper.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
