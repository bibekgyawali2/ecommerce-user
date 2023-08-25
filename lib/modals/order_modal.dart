class OrderModal {
  final String orderId;
  final String userId;
  final List<Map<String, dynamic>> products;
  final int totalPrice;
  //final String status;
  final String province;
  final String street;
  final String phone;

  OrderModal({
    required this.orderId,
    required this.userId,
    required this.products,
    required this.totalPrice,
    // required this.status,
    required this.phone,
    required this.province,
    required this.street,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'userId': userId,
      'products': products,
      'totalPrice': totalPrice,
      //'status': status,
    };
  }
}
