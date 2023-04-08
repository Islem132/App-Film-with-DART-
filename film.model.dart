class Film {
  String titre;
  String synop;
  String directeur;
  String image;

  Film(
      {required this.titre,
      required this.synop,
      required this.directeur,
      required this.image});
  factory Film.formJson(Map<String, dynamic> json) {
    return Film(
        titre: json['titre'],
        synop: json['synopsis'],
        directeur: json['directeur'],
        image: json['image']);
  }
}
