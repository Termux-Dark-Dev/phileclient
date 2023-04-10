class OrderModel {
  late String storename,
      address,
      contact,
      servicedate,
      servicetime,
      servicesopted,
      orderdate,
      shopimage;

  OrderModel(
      {required this.storename,
      required this.address,
      required this.contact,
      required this.servicedate,
      required this.servicetime,
      required this.servicesopted,
      required this.orderdate,
      required this.shopimage});

  static List<OrderModel> tojson(List<dynamic> data) {
    List<OrderModel> ordermodelobjlist = [];

    for (var item in data.reversed) {
      ordermodelobjlist.add(OrderModel(
          storename: item["StoreName"].toString(),
          address: item["Address"].toString(),
          contact: item["Contact"].toString(),
          servicedate: item["ServiceDate"].toString(),
          servicetime: item["ServiceTime"].toString(),
          servicesopted: item["ServicesOpted"].toString(),
          orderdate: item["DateOfOrder"].toString(),
          shopimage: item["StoreFrontImagePath"].toString()));
    }

    return ordermodelobjlist;
  }
}
