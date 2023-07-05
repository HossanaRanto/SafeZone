class CrimeModel {
  final int? id;
  final String image;
  final String title;
  final String crimeType;
  final String region;
  final String latitude;
  final String longitude;
  final String date;
  final String time;

  const CrimeModel(
      {this.id,
      required this.image,
      required this.title,
      required this.crimeType,
      required this.region,
      required this.latitude,
      required this.longitude,
      required this.date,
      required this.time});
}
