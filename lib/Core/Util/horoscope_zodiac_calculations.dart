String horoscopeSign(DateTime date) {
  if ((date.month == 3 && date.day >= 21) || (date.month == 4 && date.day <= 19)) {
    return 'Aries';
  } else if ((date.month == 4 && date.day >= 20) || (date.month == 5 && date.day <= 20)) {
    return 'Taurus';
  } else if ((date.month == 5 && date.day >= 21) || (date.month == 6 && date.day <= 21)) {
    return 'Gemini';
  } else if ((date.month == 6 && date.day >= 22) || (date.month == 7 && date.day <= 22)) {
    return 'Cancer';
  } else if ((date.month == 7 && date.day >= 23) || (date.month == 8 && date.day <= 22)) {
    return 'Leo';
  } else if ((date.month == 8 && date.day >= 23) || (date.month == 9 && date.day <= 22)) {
    return 'Virgo';
  } else if ((date.month == 9 && date.day >= 23) || (date.month == 10 && date.day <= 23)) {
    return 'Libra';
  } else if ((date.month == 10 && date.day >= 24) || (date.month == 11 && date.day <= 21)) {
    return 'Scorpius';
  } else if ((date.month == 11 && date.day >= 22) || (date.month == 12 && date.day <= 21)) {
    return 'Sagittarius';
  } else if ((date.month == 12 && date.day >= 22) || (date.month == 1 && date.day <= 19)) {
    return 'Capricornus';
  } else if ((date.month == 1 && date.day >= 20) || (date.month == 2 && date.day <= 18)) {
    return 'Aquarius';
  } else if ((date.month == 2 && date.day >= 19) || (date.month == 3 && date.day <= 20)) {
    return 'Pisces';
  }
  return '';
}

List<DateTime> zodiacSignFrom = [
  DateTime(1912, 2, 18),
  DateTime(1913, 2, 6),
  DateTime(1914, 1, 26),
  DateTime(1915, 2, 14),
  DateTime(1916, 2, 3),
  DateTime(1917, 1, 23),
  DateTime(1918, 2, 11),
  DateTime(1919, 2, 1),
  DateTime(1920, 2, 20),
  DateTime(1921, 2, 8),
  DateTime(1922, 1, 28),
  DateTime(1923, 2, 16),
  DateTime(1924, 2, 5),
  DateTime(1925, 1, 25),
  DateTime(1926, 2, 13),
  DateTime(1927, 2, 2),
  DateTime(1928, 1, 23),
  DateTime(1929, 2, 10),
  DateTime(1930, 1, 30),
  DateTime(1931, 2, 17),
  DateTime(1932, 2, 6),
  DateTime(1933, 1, 26),
  DateTime(1934, 2, 14),
  DateTime(1935, 2, 4),
  DateTime(1936, 1, 24),
  DateTime(1937, 2, 11),
  DateTime(1938, 1, 31),
  DateTime(1939, 2, 19),
  DateTime(1940, 2, 8),
  DateTime(1941, 1, 27),
  DateTime(1942, 2, 15),
  DateTime(1943, 2, 5),
  DateTime(1944, 1, 25),
  DateTime(1945, 2, 13),
  DateTime(1946, 2, 2),
  DateTime(1947, 1, 22),
  DateTime(1948, 2, 10),
  DateTime(1949, 1, 29),
  DateTime(1950, 2, 17),
  DateTime(1951, 2, 6),
  DateTime(1952, 1, 27),
  DateTime(1953, 2, 14),
  DateTime(1954, 2, 3),
  DateTime(1955, 1, 24),
  DateTime(1956, 2, 12),
  DateTime(1957, 1, 31),
  DateTime(1958, 2, 18),
  DateTime(1959, 2, 8),
  DateTime(1960, 1, 28),
  DateTime(1961, 2, 15),
  DateTime(1962, 2, 5),
  DateTime(1963, 1, 25),
  DateTime(1964, 2, 13),
  DateTime(1965, 2, 2),
  DateTime(1966, 1, 21),
  DateTime(1967, 2, 9),
  DateTime(1968, 1, 30),
  DateTime(1969, 2, 17),
  DateTime(1970, 2, 6),
  DateTime(1971, 1, 27),
  DateTime(1972, 1, 16),
  DateTime(1973, 2, 3),
  DateTime(1974, 1, 23),
  DateTime(1975, 2, 11),
  DateTime(1976, 1, 31),
  DateTime(1977, 2, 18),
  DateTime(1978, 2, 7),
  DateTime(1979, 1, 28),
  DateTime(1980, 2, 16),
  DateTime(1981, 2, 5),
  DateTime(1982, 1, 25),
  DateTime(1983, 2, 13),
  DateTime(1984, 2, 2),
  DateTime(1985, 2, 20),
  DateTime(1986, 2, 9),
  DateTime(1987, 1, 29),
  DateTime(1988, 2, 17),
  DateTime(1989, 2, 6),
  DateTime(1990, 1, 27),
  DateTime(1991, 2, 15),
  DateTime(1992, 2, 4),
  DateTime(1993, 1, 23),
  DateTime(1994, 2, 10),
  DateTime(1995, 1, 31),
  DateTime(1996, 2, 19),
  DateTime(1997, 2, 7),
  DateTime(1998, 1, 28),
  DateTime(1999, 2, 16),
  DateTime(2000, 2, 5),
  DateTime(2001, 1, 24),
  DateTime(2002, 2, 12),
  DateTime(2003, 2, 1),
  DateTime(2004, 1, 22),
  DateTime(2005, 2, 9),
  DateTime(2006, 1, 29),
  DateTime(2007, 2, 18),
  DateTime(2008, 2, 7),
  DateTime(2009, 1, 26),
  DateTime(2010, 2, 14),
  DateTime(2011, 2, 3),
  DateTime(2012, 1, 23),
  DateTime(2013, 2, 10),
  DateTime(2014, 1, 31),
  DateTime(2015, 2, 19),
  DateTime(2016, 2, 8),
  DateTime(2017, 1, 28),
  DateTime(2018, 2, 16),
  DateTime(2019, 2, 5),
  DateTime(2020, 1, 25),
  DateTime(2021, 2, 12),
  DateTime(2022, 2, 1),
  DateTime(2023, 2, 22),
];

List<String> zodiacSigns = [
  "Rabbit",
  "Tiger",
  "Ox",
  "Rat",
  "Pig",
  "Dog",
  "Rooster",
  "Monkey",
  "Goat",
  "Horse",
  "Snake",
  "Dragon",
  "Rabbit",
  "Tiger",
  "Ox",
  "Rat",
  "Boar",
  "Dog",
  "Rooster",
  "Monkey",
  "Goat",
  "Horse",
  "Snake",
  "Dragon",
  "Rabbit",
  "Tiger",
  "Ox",
  "Rat",
  "Boar",
  "Dog",
  "Rooster",
  "Monkey",
  "Goat",
  "Horse",
  "Snake",
  "Dragon",
  "Rabbit",
  "Tiger",
  "Ox",
  "Rat",
  "Boar",
  "Dog",
  "Rooster",
  "Monkey",
  "Goat",
  "Horse",
  "Snake",
  "Dragon",
  "Rabbit",
  "Tiger",
  "Ox",
  "Rat",
  "Boar",
  "Dog",
  "Rooster",
  "Monkey",
  "Goat",
  "Horse",
  "Snake",
  "Dragon",
  "Rabbit",
  "Tiger",
  "Ox",
  "Rat",
  "Boar",
  "Dog",
  "Rooster",
  "Monkey",
  "Goat",
  "Horse",
  "Snake",
  "Dragon",
  "Rabbit",
  "Tiger",
  "Ox",
  "Rat",
  "Boar",
  "Dog",
  "Rooster",
  "Monkey",
  "Goat",
  "Horse",
  "Snake",
  "Dragon",
  "Rabbit",
  "Tiger",
  "Ox",
  "Rat",
  "Boar",
  "Dog",
  "Rooster",
  "Monkey",
  "Goat",
  "Horse",
  "Snake",
  "Dragon",
  "Rabbit",
  "Tiger",
  "Ox",
  "Rat",
  "Boar",
  "Dog",
  "Rooster",
  "Monkey",
  "Goat",
  "Horse",
  "Snake",
  "Dragon",
  "Rabbit",
  "Tiger",
  "Ox",
  "Rat"
];

String zodiacSign(DateTime dateTime)
{
  int index = dateTime.year - 1912;
  if(zodiacSignFrom[index].month == dateTime.month)
  {
    if(zodiacSignFrom[index].day >= dateTime.day)
    {
      return zodiacSigns[index];
    }
    else
    {
      return zodiacSigns[index - 1];
    }
  }
  else if(zodiacSignFrom[index].month > dateTime.month)
  {
    return zodiacSigns[index];
  }
  else
  {
    return zodiacSigns[index - 1];
  }
}