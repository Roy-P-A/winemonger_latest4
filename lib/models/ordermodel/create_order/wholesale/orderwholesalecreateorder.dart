class OrderWholeSaleCreateOrderModel {
  int? code;
  String? orderId;
  String? orderPaymentId;
  String? message;

  OrderWholeSaleCreateOrderModel(
      {this.code, this.orderId, this.orderPaymentId, this.message});

  OrderWholeSaleCreateOrderModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    orderId = json['order_id'];
    orderPaymentId = json['order_payment_id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['order_id'] = this.orderId;
    data['order_payment_id'] = this.orderPaymentId;
    data['message'] = this.message;
    return data;
  }
}
