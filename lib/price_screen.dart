import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  DropdownButton<String> getDropDownButton(){
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          getBTCData();
          getETHData();
          getLTCData();        });
      },
    );
  }

  CupertinoPicker iOSPicker(){
    List<Text> pickeritems = [];
    for(String currency in currenciesList){
      pickeritems.add(Text(currency));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex){
        selectedCurrency= currenciesList[selectedIndex];
        getBTCData();
        getETHData();
        getLTCData();
      },
      children: pickeritems,
    );
  }

  String bitcoinValueIncurr = '?';
  String ethereumValueIncurr = '?';
  String litecoinValueIncurr = '?';

  void getBTCData() async {
    try {
      double data = await CoinData().getBitcoinData(selectedCurrency);
      setState(() {
        bitcoinValueIncurr = data.toStringAsFixed(0);

      });
    } catch (e) {
      print(e);
    }
  }

  void getETHData() async {
    try {
      double data = await CoinData().getEthereumData(selectedCurrency);
      setState(() {
        ethereumValueIncurr = data.toStringAsFixed(0);

      });
    } catch (e) {
      print(e);
    }
  }

  void getLTCData() async {
    try {
      double data = await CoinData().getLitecoinData(selectedCurrency);
      setState(() {
        litecoinValueIncurr = data.toStringAsFixed(0);

      });
    } catch (e) {
      print(e);
    }
  }



  Widget getPicker(){
    if(Platform.isAndroid){
      return getDropDownButton();
    }
    else{
      return iOSPicker();
    }
  }

  @override
  void initState() {
    super.initState();
    getBTCData();
    getETHData();
    getLTCData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                  '1 BTC = $bitcoinValueIncurr $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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
                  '1 ETH = $ethereumValueIncurr $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
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
                  '1 LTC = $litecoinValueIncurr $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 382.0,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}


