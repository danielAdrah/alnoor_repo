class EndPoint {
  static String baseUrl = "http://85.31.237.33/test/api/";
  static String logIn = "auth/login/";
  static String religousPost = "religious-posts/";
  static String guidnacePost = "guidance-posts/";
  static String indiviualReligiousPost = "religious-post/";
  static String getindiviualReligiousPost(id) {
    return "religious-post/$id";
  }
}

class ApiKeys {
  static String username = "username";
  static String password = "password";
}
