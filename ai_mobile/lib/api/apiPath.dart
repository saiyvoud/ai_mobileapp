class ApiPath {
  static const String baseUrl = "https://mobile.homefind.la/api/v1";
  //------- Auth -----
  static const String login = "${baseUrl}/user/login";
  static const String register = "${baseUrl}/user/register";
  static const String forgot = "${baseUrl}/user/forgot";
  static const String updateProfile = "${baseUrl}/user/update";
  static const String chagePassword = "${baseUrl}/user/changePassword";
  static const String refreshToken = "${baseUrl}/user/refreshToken";
  static const String getBannerAll = "${baseUrl}/banner/getAll";
  //-------- category ------
  static const String getCategoryAll = "${baseUrl}/category/getAll";
  //-------- product ----
  static const String getProductAll = "${baseUrl}/product/getAll";
  static const String getProductBy = "${baseUrl}/product/getByCategory/";
  //------- delivery ------
  static const String createDelivery = "${baseUrl}/delivery/create";
  //----- order ----
  static const String createOrder = "${baseUrl}/order/insert";
  static const String getOrderByUser = "${baseUrl}/order/user";
  static const String getOrderByStatusAwait =
      "${baseUrl}/order/getOrderStatusAwait/";
  static const String getOrderByStatusPadding =
      "${baseUrl}/order/getOrderStatusPadding/";
  static const String getOrderByStatusSuccess =
      "${baseUrl}/order/getOrderStatusSuccess/";
  //----- history ----
  static const String getHistoryByUser = "${baseUrl}/history/user/";
  // ----- address ---
  static const String createAddress = "${baseUrl}/address/insert";
  static const String updateAddress = "${baseUrl}/address/update/";
  static const String deleteAddress = "${baseUrl}/address/delete/";
  static const String getAddressByUser = "${baseUrl}/address/getByUser";
}
