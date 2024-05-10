class EndPoint {
  static String baseUrl = "http://85.31.237.33/test/api/";
  static String logIn = "auth/login/";
  static String religousPost = "religious-posts/";
  static String guidnacePost = "guidance-posts/";
  static String indiviualReligiousPost = "religious-post/";
  static String getindiviualReligiousPost(id) {
    return "religious-post/$id";
  }
  static String indiviualGuidenacePost = "guidance-post/";
  static String getindiviualGuidnacePost(id) {
    return "guidance-post/$id";
  }
  static String pilgrimInfo = "get-pilgrim/";
  static String getPilgrimInfo(pilgremId) {
    return "get-pilgrim/$pilgremId";
  }
  static String listSteps = "list-steps/";
  static String prayerTime = "prayers-timings/";

}

class ApiKeys {
  static String username = "username";
  static String password = "password";
  static String deviceId = "device_token";
  static String longitude = "longitude";
  static String latitude = "latitude";
  static String day = "day";
  static String month = "month";
  static String year = "year";
}
