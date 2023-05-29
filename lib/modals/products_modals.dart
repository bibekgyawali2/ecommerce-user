class Product {
  String? pCatagory;
  String? pDesc;
  String? pImg;
  String? pName;
  String? pPrice;
  String? pQuantity;
  String? pRating;
  String? pSeller;
  String? pSubcatagory;

  Product(
      {this.pCatagory,
      this.pDesc,
      this.pImg,
      this.pName,
      this.pPrice,
      this.pQuantity,
      this.pRating,
      this.pSeller,
      this.pSubcatagory});

  Product.fromJson(Map<String, dynamic> json) {
    pCatagory = json['p_catagory'];
    pDesc = json['p_desc'];
    pImg = json['p_img'];
    pName = json['p_name'];
    pPrice = json['p_price'];
    pQuantity = json['p_quantity'];
    pRating = json['p_rating'];
    pSeller = json['p_seller'];
    pSubcatagory = json['p_subcatagory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['p_catagory'] = pCatagory;
    data['p_desc'] = pDesc;
    data['p_imgs'] = pImg;
    data['p_name'] = pName;
    data['p_price'] = pPrice;
    data['p_quantity'] = pQuantity;
    data['p_rating'] = pRating;
    data['p_seller'] = pSeller;
    data['p_subcatagory'] = pSubcatagory;
    return data;
  }
}
