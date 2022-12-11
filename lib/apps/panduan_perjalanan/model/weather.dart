class Weather {
  static String kotaAsal = "";
  static String kotaTujuan = "";

  String city;
  String icon;
  String description;
  double temp;
  int humidity;
  int clouds;
  double windSpeed;

  Weather({
    required this.city,
    required this.icon,
    required this.description,
    required this.temp,
    required this.humidity,
    required this.clouds,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<dynamic, dynamic> json) => Weather(
      city: json['name'],
      icon: json['weather'][0]['icon'],
      description: json['weather'][0]['description'],
      temp: json['main']['temp'],
      humidity: json['main']['humidity'],
      clouds: json['clouds']['all'],
      windSpeed: json['wind']['speed']);

  static void setKota(String kotaAsal, String kotaTujuan) {
    Weather.kotaAsal = kotaAsal;
    Weather.kotaTujuan = kotaTujuan;
  }

  static void resetKota() {
    Weather.kotaAsal = "";
    Weather.kotaTujuan = "";
  }

  @override
  String toString() {
    String result = '''\n
    City: $city
    Icon: $icon
    Description: $description
    Temp: $temp
    Humidity: $humidity
    Wind Speed: $windSpeed''';
    return result;
  }
}
