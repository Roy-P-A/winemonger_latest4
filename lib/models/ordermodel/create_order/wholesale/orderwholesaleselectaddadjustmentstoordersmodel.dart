class OrderWholesaleSelectAddAdjustmentsToOrdersModel {
  int? code;
  int? noqty;
  Data10 data10;
  String? message;

  OrderWholesaleSelectAddAdjustmentsToOrdersModel(
      {this.code, this.noqty, required this.data10, this.message});

  factory OrderWholesaleSelectAddAdjustmentsToOrdersModel.fromJson(
          Map<String, dynamic> json) =>
      OrderWholesaleSelectAddAdjustmentsToOrdersModel(
        code: json['code'],
        noqty: json['noqty'],
        data10: Data10.fromJson(json['data']),
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'noqty': noqty,
        'data': data10.toJson(),
        'message': message,
      };
}

class Data10 {
  String? lineDsc;
  String? sku;
  String? value;
  int? qty;
  int? total;
  String? id;
  String? totalPreOrderlineId;
  String? preOrderlineId;
  String? productWareHouseId;
  int? lineNumber;

  Data10(
      {this.lineDsc,
      this.sku,
      this.value,
      this.qty,
      this.total,
      this.id,
      this.totalPreOrderlineId,
      this.preOrderlineId,
      this.productWareHouseId,
      this.lineNumber});

  factory Data10.fromJson(Map<String, dynamic> json) => Data10(
        lineDsc: json['line_dsc'],
        sku: json['sku'],
        value: json['value'],
        qty: json['qty'],
        total: json['total'],
        id: json['id'],
        totalPreOrderlineId: json['total_pre_orderline_id'],
        preOrderlineId: json['pre_orderline_id'],
        productWareHouseId: json['product_ware_house_id'],
        lineNumber: json['line_number'],
      );

  Map<String, dynamic> toJson() => {
        'line_dsc': lineDsc,
        'sku': sku,
        'value': value,
        'qty': qty,
        'total': total,
        'id': id,
        'total_pre_orderline_id': totalPreOrderlineId,
        'pre_orderline_id': preOrderlineId,
        'product_ware_house_id': productWareHouseId,
        'line_number': lineNumber,
      };
}
