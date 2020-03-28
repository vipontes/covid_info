class Worldometer {
  int worldometersId;
  String measurementDate;
  String country;
  int totalCases;
  int newCases;
  int totalDeaths;
  int newDeaths;
  int totalRecovered;
  int activeCases;
  int seriousCases;
  double casesPerMillion;
  double deathsPerMillion;

  Worldometer(
      {this.worldometersId,
      this.measurementDate,
      this.country,
      this.totalCases,
      this.newCases,
      this.totalDeaths,
      this.newDeaths,
      this.totalRecovered,
      this.activeCases,
      this.seriousCases,
      this.casesPerMillion,
      this.deathsPerMillion});

  Worldometer.fromJson(Map<String, dynamic> json) {
    worldometersId = int.parse(json['worldometers_id']);
    measurementDate = json['measurement_date'];
    country = json['country'];
    totalCases = int.parse(json['total_cases']);
    newCases = int.parse(json['new_cases']);
    totalDeaths = int.parse(json['total_deaths']);
    newDeaths = int.parse(json['new_deaths']);
    totalRecovered = int.parse(json['total_recovered']);
    activeCases = int.parse(json['active_cases']);
    seriousCases = int.parse(json['serious_cases']);
    casesPerMillion = double.parse(json['cases_per_million']);
    deathsPerMillion = double.parse(json['deaths_per_million']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['worldometers_id'] = this.worldometersId;
    data['measurement_date'] = this.measurementDate;
    data['country'] = this.country;
    data['total_cases'] = this.totalCases;
    data['new_cases'] = this.newCases;
    data['total_deaths'] = this.totalDeaths;
    data['new_deaths'] = this.newDeaths;
    data['total_recovered'] = this.totalRecovered;
    data['active_cases'] = this.activeCases;
    data['serious_cases'] = this.seriousCases;
    data['cases_per_million'] = this.casesPerMillion;
    data['deaths_per_million'] = this.deathsPerMillion;
    return data;
  }

  static List<Worldometer> listFromJson(List<dynamic> json) {
    List<Worldometer> data = List();

    for (final item in json) {
      Worldometer cidade = Worldometer(
          worldometersId: int.parse(item["worldometers_id"]),
          measurementDate: item["measurement_date"],
          country: item["country"],
          totalCases: int.parse(item["total_cases"]),
          newCases: int.parse(item["new_cases"]),
          totalDeaths: int.parse(item["total_deaths"]),
          newDeaths: int.parse(item["new_deaths"]),
          totalRecovered: int.parse(item["total_recovered"]),
          activeCases: int.parse(item["active_cases"]),
          seriousCases: int.parse(item["serious_cases"]),
          casesPerMillion: double.parse(item["cases_per_million"]),
          deathsPerMillion: double.parse(item["deaths_per_million"]));

      data.add(cidade);
    }

    return data;
  }
}
