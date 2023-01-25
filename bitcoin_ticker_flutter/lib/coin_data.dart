import 'dart:convert';
import 'package:http/http.dart' as http;

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
  Future getData(String crypto, String currency) async {
    var url =
        'https://rest.coinapi.io/v1/exchangerate/${crypto.toUpperCase()}/${currency.toUpperCase()}?apikey=31D3C6FB-CD36-4250-A03A-797803DEA232';

    http.Response response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var exchangeRate = decodedData['rate'];
      return exchangeRate;
    } else {
      print(response.statusCode);
    }
  }
}
