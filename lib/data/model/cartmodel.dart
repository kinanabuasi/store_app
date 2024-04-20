// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class CartModel {
  dynamic itemsprice;
  dynamic countitems;
  dynamic cartId;
  dynamic cartUsersid;
  dynamic cartItemsid;
  dynamic itemsId;
  String? itemsName;
  String? itemsDescription;
  String? itemsImage;
  dynamic itemsCount;
  dynamic itemsActive;
  dynamic itemsPrice;
  dynamic itemsDiscount;
  String? itemsDate;
  dynamic itemsCat;

  CartModel(
      {this.itemsprice,
      this.countitems,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsDescription,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_userid'];
    cartItemsid = json['cart_itemid'];
    itemsId = json['item_id'];
    itemsName = json['item_name'];
    itemsDescription = json['item_description'];
    itemsImage = json['item_image'];
    itemsCount = json['item_count'];
    itemsActive = json['item_active'];
    itemsPrice = json['item_price'];
    itemsDiscount = json['item_discount'];
    itemsDate = json['item_date'];
    itemsCat = json['item_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['item_id'] = this.itemsId;
    data['item_name'] = this.itemsName;
    data['item_desc'] = this.itemsDescription;
    data['item_image'] = this.itemsImage;
    data['item_count'] = this.itemsCount;
    data['item_active'] = this.itemsActive;
    data['item_price'] = this.itemsPrice;
    data['item_discount'] = this.itemsDiscount;
    data['item_date'] = this.itemsDate;
    data['item_cat'] = this.itemsCat;
    return data;
  }
}
