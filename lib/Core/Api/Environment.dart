abstract class Environment {
  var youAppUrl;
}

class DevEnvironment extends Environment {
  var youAppUrl = 'https://techtest.youapp.ai/api/';
}

enum EnvironmentType { DEV, STAGING, PROD }