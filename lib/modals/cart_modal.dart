// ignore_for_file: non_constant_identifier_names

class CartModal {
  String? added_by;
  String? img;
  String? qty;
  String? sellername;
  String? title;
  String? tprice;
  String? cartId;
  String? productId;

  CartModal({
    this.added_by,
    this.img,
    this.qty,
    this.sellername,
    this.title,
    this.tprice,
    this.cartId,
    this.productId,
  });

  CartModal.fromJson(Map<String, dynamic> json)
      : added_by = json['added_by'],
        img = json['img'],
        qty = json['qty'],
        sellername = json['sellername'],
        title = json['title'],
        tprice = json['tprice'],
        cartId = json['cartId'],
        productId = json['ProductId'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['added_by'] = added_by;
    data['img'] = img;
    data['qty'] = qty;
    data['sellername'] = sellername;
    data['title'] = title;
    data['tprice'] = tprice;
    data['cartId'] = cartId;
    data['productId'] = productId;
    return data;
  }
}
