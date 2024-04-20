// ignore_for_file: unnecessary_this

class MyFavoriteModel {
  dynamic favoriteId;
  dynamic favoriteUsersid;
  dynamic favoriteItemsid;
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
  dynamic usersId;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUsersid,
      this.favoriteItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsDescription,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.itemsCat,
      this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersId'];
    favoriteItemsid = json['favorite_itemsId'];
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
    usersId = json['user_id'];
  }

  Map<String, String?> toJson() {
    final Map<String, String?> data = new Map<String, String?>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_usersId'] = this.favoriteUsersid;
    data['favorite_itemsId'] = this.favoriteItemsid;
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
    data['user_id'] = this.usersId;
    return data;
  }
}