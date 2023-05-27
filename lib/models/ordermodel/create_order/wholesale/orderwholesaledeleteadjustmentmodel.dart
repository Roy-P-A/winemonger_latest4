class OrderWholesaleDeleteAdjustmentModel {
  int? code;
  String? skutype;
  String? lineTotal;
  String? totalPreOrderlineId;
  int? lineNumber;
  int? delWarehouseId;
  String? delLineNumber;

  OrderWholesaleDeleteAdjustmentModel(
      {this.code,
      this.skutype,
      this.lineTotal,
      this.totalPreOrderlineId,
      this.lineNumber,
      this.delWarehouseId,
      this.delLineNumber});

  OrderWholesaleDeleteAdjustmentModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    skutype = json['skutype'];
    lineTotal = json['line_total'];
    totalPreOrderlineId = json['total_pre_orderline_id'];
    lineNumber = json['line_number'];
    delWarehouseId = json['del_warehouse_id'];
    delLineNumber = json['del_lineNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['skutype'] = this.skutype;
    data['line_total'] = this.lineTotal;
    data['total_pre_orderline_id'] = this.totalPreOrderlineId;
    data['line_number'] = this.lineNumber;
    data['del_warehouse_id'] = this.delWarehouseId;
    data['del_lineNumber'] = this.delLineNumber;
    return data;
  }
}
