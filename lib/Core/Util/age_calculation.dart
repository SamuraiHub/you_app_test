String calculateAge(DateTime birth) {
  DateTime now = DateTime.now();
  int age = now.year - birth.year;
  if (now.month < birth.month || (now.month == birth.month && now.day < birth.day)) {
    age--;
  }
  return age.toString();
}