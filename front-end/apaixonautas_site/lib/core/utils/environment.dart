class Environment {

  static String get _urlBaseApaixonautasApi => 'http://18.224.183.211:8080';

  //Public endpoints
  static String get solarSystemBaseurl => 'https://63ee56ee5e9f1583bdc10f2c.mockapi.io/api/v1/systemSolar';
  static String get newsBaseUrl => 'https://api.spaceflightnewsapi.net/v4/articles';
  static String get exoplanetBaseUrl => 'https://exoplanet-api.herokuapp.com/exoplanet/';
  static String get launchsBaseUrl => 'https://api.spacexdata.com/v2/launches';

  //Private endpoints
  static String get usersBaseUrl => '$_urlBaseApaixonautasApi/';

}
