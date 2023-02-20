class Availtime {
  late String servicetime;
  Availtime(this.servicetime);

  static List<Availtime> tojson(List<dynamic> data) {
    List<Availtime> res = [];
    for (var item in data) {
      res.add(Availtime(item["ServiceTime"].toString()));
    }
    return res;
  }
}
