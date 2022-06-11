import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).homeScreen),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${S.of(context).language}: "),
                DropdownButton<String>(
                    value: Intl.getCurrentLocale(),
                    items: [
                      DropdownMenuItem(
                        value: 'en',
                        child: Text(
                          S.of(context).english,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'ru_RU',
                        child: Text(
                          S.of(context).russian,
                        ),
                      ),
                    ],
                    onChanged: (value) async {
                      if (value == 'ru_RU') {
                        await S.load(
                          const Locale('ru', 'RU'),
                        );
                        setState(() {});
                      } else if (value == 'en') {
                        await S.load(
                          const Locale('en'),
                        );
                        setState(() {});
                      }
                    }),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
            ),
            Text(
              S.of(context).counterValue,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 45.0,
                    child: RawMaterialButton(
                      fillColor: Colors.blue,
                      onPressed: _incrementCounter,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  Container(
                    height: 45.0,
                    child: RawMaterialButton(
                      fillColor: Colors.blue,
                      onPressed: _decrementCounter,
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
