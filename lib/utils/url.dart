class URLS {
  // static String baseUrl ="http://51.89.21.83:8001";

  static String baseUrl = "https://jayanthi12.pythonanywhere.com";
  static String login = "/api/v1/accounts/login/";
  static String verifyOTP = "/api/v1/accounts/verify_otp/";
  static String tokenRefresh = "/api/v1/token_refresh/";


  static String categoryList = "/api/v1/datarepo/category/list/";
  //static String categoryproduct(int categoryId,String? query) => "/api/v1/datarepo/category/details/?category_id=$categoryId&search_text=$query";
  static String categoryproductsList(int categoryId,String? query, int? veg, int? nonveg) => "/api/v1/datarepo/category/details/?category_id=$categoryId&search_text=$query&";


  static String cartList="/api/v1/cart/carts/";
  static String addCart="/api/v1/cart/carts/";
  static String updateCart="/api/v1/cart/carts/";
  static String deleteCart="/api/v1/cart/carts/";
   static String placeOrder = "/api/v1/orders/place_order/";

  static String tablesList ="/api/v1/orders/tables/list/";
  static String tableDetails(int tableId) => "/api/v1/orders/order/details/?table_id=$tableId";

  static String updateOrder = "/api/v1/orders/order/update/";
  static String updateFoodItem = "/api/v1/datarepo/category/food_item/update/";

  static String ongoingOrders = "/api/v1/orders/list/?status=1";
  static String completedOrders = "/api/v1/orders/list/?status=2";




  static String ordersList = "/api/v1/orders/list/";
  static String orderDetails(int orderId) => "/api/v1/orders/order/details/?order_id=$orderId";
  static String feedback = "/api/v1/orders/order/feed_back/";





  static String checkout = "/api/v1/orders/checkout/";
  static String cart = "/api/v1/cart/";




  static String parseImage(String? url) {
    if(url == null) return "";
    // return  url;
    return baseUrl + url;
  }

}