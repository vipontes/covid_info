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
    worldometersId = json['worldometers_id'];
    measurementDate = json['measurement_date'];
    country = json['country'];
    totalCases = json['total_cases'];
    newCases = json['new_cases'];
    totalDeaths = json['total_deaths'];
    newDeaths = json['new_deaths'];
    totalRecovered = json['total_recovered'];
    activeCases = json['active_cases'];
    seriousCases = json['serious_cases'];
    casesPerMillion = json['cases_per_million'];
    deathsPerMillion = json['deaths_per_million'];
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
          worldometersId: item["worldometers_id"],
          measurementDate: item["measurement_date"],
          country: item["country"],
          totalCases: item["total_cases"],
          newCases: item["new_cases"],
          totalDeaths: item["total_deaths"],
          newDeaths: item["new_deaths"],
          totalRecovered: item["total_recovered"],
          activeCases: item["active_cases"],
          seriousCases: item["serious_cases"],
          casesPerMillion: item["cases_per_million"],
          deathsPerMillion: item["deaths_per_million"]);

      data.add(cidade);
    }

    return data;
  }
}
