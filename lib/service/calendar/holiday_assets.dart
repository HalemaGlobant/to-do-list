class HolidayAssets {
  final String imagePath;
  final String announcement;

  HolidayAssets({required this.imagePath, required this.announcement});
}

final Map<String, HolidayAssets> holidayAssets = {
  "Saudi National Day": HolidayAssets(
    imagePath: 'assets/images/ksa.avif',
    announcement: "🇸🇦 Happy Saudi National Day!",
  ),
  "New Year's Day": HolidayAssets(
    imagePath: 'assets/images/new_year.png',
    announcement: "🎉 Happy New Year!",
  ),
  "Rosh Hashana": HolidayAssets(
    imagePath: 'assets/images/Rosh-Hashanah.webp',
    announcement: "Happy Rosh Hashana Day!",
  ),
};
