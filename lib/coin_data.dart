import 'package:http/http.dart';
import 'dart:convert';

const APIKEY = '8ABC4202-8DFB-4C5A-A08B-784C3A33F25A';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getBitcoinData(String selectedcurr) async {
    String requestURL = 'https://rest.coinapi.io/v1/exchangerate/BTC/$selectedcurr?apikey=$APIKEY';
    final uri = Uri.parse(requestURL);
    Response response = await get(uri);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }

  Future getLitecoinData(String selectedcurr) async {
    String requestURL = 'https://rest.coinapi.io/v1/exchangerate/LTC/$selectedcurr?apikey=$APIKEY';
    final uri = Uri.parse(requestURL);
    Response response = await get(uri);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }

  Future getEthereumData(String selectedcurr) async {
    String requestURL = 'https://rest.coinapi.io/v1/exchangerate/ETH/$selectedcurr?apikey=$APIKEY';
    final uri = Uri.parse(requestURL);
    Response response = await get(uri);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['rate'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}