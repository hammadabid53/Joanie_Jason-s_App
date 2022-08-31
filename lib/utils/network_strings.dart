class NetworkStrings {
  ////////////////////// API BASE URL //////////////////////////////////
  // Technado CPanel
  static const String API_BASE_URL =
      "https://server.appsstaging.com/2522/breeder_network/api/";
  static const String GOOGLE_MAP_API_KEY =
      "AIzaSyDHZomR5ozaTualggVoaq5Z2fZIFC_03eQ";

  ////////////////////// Network Image Base Url ///////////////////////////////////
  //Technado CPanel Image URL
  //static const String NETWORK_IMAGE_BASE_URL = "https://server.appsstaging.com/2533/erandz_php/public/uploads/";

  /////// API HEADER TEXT ////////////////////////
  static const String ACCEPT = 'application/json';
  // static const String BEARER_TOKEN = "Bearer Token";

  ////// API STATUS CODE/////////////
  static const int SUCCESS_CODE = 200;
  static const int UNAUTHORIZED_CODE = 401;

  /////////// API MESSAGES /////////////////
  static const int API_SUCCESS_STATUS = 1;
  static const int EMAIL_UNVERIFIED = 0;
  static const int EMAIL_VERIFIED = 1;
  static const int PROFILE_INCOMPLETED = 0;
  static const int PROFILE_COMPLETED = 1;

  ///////////////////// API QUERY PARAMETERS /////////////////
  static const String TERMS_AND_CONDITION_PARAMETER = "tc";
  static const String PRIVACY_POLICY_PARAMETER = "pp";

  ///////////////////// ADD A PET /////////////////
  static const String CREATE_ADD_PET = "pet/create";
  static const String UPDATE_PET = "pet/update";

  // static const String PRIVACY_POLICY_PARAMETER = "pp";

  ///////////////////// GET A PET /////////////////
  static const String GET_ALL_PETS = "pet/profiles";
  static const String GET_MY_ADS = "ad/my-ads";
  static const String GET_ADS_CATEGORY = "ad";
  static const String CONTENT = "content";
  static const String FAQS = "faqs";
  static const String FEEDBACK = "feedback";

  ///////////////////// Creation /////////////////
  static const String CREATE_PET = "ad/create";
  static const String UPDATE_AD = "ad/update";
  ///////////////////// PET UPDATE VISIBILITY /////////////////
  static const String PET_VISIBILITY = "pet/update-visibility";
  static const String MARK_FAVOURITE = "ad/favourite";
  static const String DELETE_AD = "ad/delete";

  ///////////////////// CHATS ENDPOINTS /////////////////
  static const String ALL_CHATS = "chat/conversations";
  static const String CHAT_CONVERSATION = "chat/conversation";

  ///////////////////// SETTINGS ENDPOINTS /////////////////
  static const String SETTINGS_API = "setting";
  // static const String CHAT_CONVERSATION = "chat/conversation";

  ////////////////////// API ENDPOINTS  ////////////////////////
  static const String SIGN_UP_ENDPOINT = "auth/signup";
  static const String OTP_ENDPOINT = "verify-otp";
  static const String VERIFY_EMAIL_ENDPOINT = "verify-email-code";
  static const String RESEND_EMAIL_ENDPOINT = "resend-email-code";
  static const String RESEND_OTP = "auth/signup/resend-otp";
  static const String SIGN_IN_ENDPOINT = "auth/login";
  static const String LOGOUT_ENDPOINT = "auth/logout";
  static const String COMPLETE_PROFILE_ENDPOINT = "profile";
  static const String CHANGE_PASSWORD_ENDPOINT = "update-password";
  static const String SOCIAL_LOGIN_ENDPOINT = "auth/social";
  static const String CONTENT_ENDPOINT = "content";
  static const String FORGET_PASSWORD_ENDPOINT = "auth/password/forgot";
  static const String PASSWORD_CODE_VERIFICATION_ENDPOINT = "verify-pass-code";
  static const String RESEND_PASSWORD_VERIFICATION_CODE_ENDPOINT =
      "resend-reset-code";
  static const String RESET_PASSWORD_ENDPOINT = "auth/password/reset";
  static const String ADD_STORY_ENDPOINT = "add-story";
  static const String STORY_LIST_ENDPOINT = "list-story";
  static const String STORY_DELETE_ENDPOINT = "delete-story";
  static const String SEARCH_STORY_ENDPOINT = "search-story";
  static const String PUBLISH_STORY_ENDPOINT = "publish-request";
  static const String ADD_POST = "add-post";
  static const String ADD_BOOKMARK = "add-bookmark";
  static const String DELETE_BOOKMARK = "delete-bookmark";
  static const String DELETE_SPOT_LIST = "delete-spotlist";
  static const String HEP_CENTER_FAQS = "get-faqs";
  static const String LIST_POST_RESPONSE = "list-post";
  static const String SEARCH_POST_RESPONSE = "search-post";
  static const String SPOT_LISt_RESPONSE = "list-spotlist";
  static const String NEAR_BY_RESPONSE = "nearby-list";
  static const String NOTIFICATIONS_LIST = "list-notification";

  /////////// API TOAST MESSAGES //////////////////
  static const String NO_INTERNET_CONNECTION = "No Internet Connection!";
  static const String SOMETHING_WENT_WRONG = "Something Went Wrong";
}
