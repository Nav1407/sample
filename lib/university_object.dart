class UniversityObj {
  final List<String> domains;
  final String name;
  final String country;
  final String alphaCode;
  final String? state;
  final List<String> webPages;

  UniversityObj(
      {required this.domains,
        required this.name,
        required this.country,
        required this.alphaCode,
        this.state,
        required this.webPages});

  factory UniversityObj.fromJson(Map<String, dynamic> json) {
    return UniversityObj(
      domains: json["domains"].cast<String>(),
      name: json["name"],
      country: json["country"],
      alphaCode: json["alpha_two_code"],
      state: json["state-province"],
      webPages: json['web_pages'].cast<String>(),
    );
  }
}