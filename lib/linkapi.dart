// ignore_for_file: nonant_identifier_names

class AppLink {
  static String server = "http://localhost:8012/ecommercecourse-PHP--110";

  // SignUser

  static String signup = "$server/auth/signup.php";
  static String login = "$server/auth/login.php";
  // static String logout = "$server/api/user/logout";

  // HomePage

  static String homepage = "$server/";
  // static String images = "asset/images/";

  // items

  static String items = "$server/items/items.php";
  static String search = "$server/items/search.php";

  // images

  static String images = "$server/upload/";

  // Favorite

  static String favoriteAdd = "$server/favorite/add.php";
  static String favoriteRemove = "$server/favorite/remove.php";
  static String favoriteView = "$server/favorite/view.php";
  static String deletefromfavroite = "$server/favorite/deletefromfavroite.php";

  // Cart
  static String cartview = "$server/cart/view.php";
  static String cartadd = "$server/cart/add.php";
  static String cartdelete = "$server/cart/delete.php";
  static String cartgetcountitems = "$server/cart/getcountitems.php";
}
