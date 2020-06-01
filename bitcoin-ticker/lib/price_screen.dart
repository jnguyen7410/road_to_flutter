import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = 'USD';

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;

    CupertinoPicker iOSPicker() {
      return CupertinoPicker(
        itemExtent: 32.0,
        backgroundColor: Colors.lightBlue,
        onSelectedItemChanged: (selectedIndex) {
          setState(() => currency = currenciesList[selectedIndex]);
        },
        children: currenciesList.map<Text>((String value) {
          return Text(
            value,
            style: TextStyle(
              color: Colors.white,
            ),
          );
        }).toList(),
      );
    }

    DropdownButton<String> androidDropdown() {
      return DropdownButton<String>(
        value: currency,
        items: currenciesList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: ((String value) {
          setState(() => currency = value);
        }),
      );
    }

    /** This makes no sense for two platforms, but it will when we extend it
     * to work for other platforms like desktop and web.
     */
    Widget getPicker() {
      switch (platform) {
        case TargetPlatform.iOS:
          return iOSPicker();
        case TargetPlatform.android:
        default:
          return androidDropdown();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          )
        ],
      ),
    );
  }
}
