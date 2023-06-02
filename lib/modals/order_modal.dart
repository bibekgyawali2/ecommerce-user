class Order {
  final String orderId;
  final String userId;
  final List<Map<String, dynamic>> products;
  final double totalPrice;
  final String status;

  Order({
    required this.orderId,
    required this.userId,
    required this.products,
    required this.totalPrice,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'userId': userId,
      'products': products,
      'totalPrice': totalPrice,
      'status': status,
    };
  }
}