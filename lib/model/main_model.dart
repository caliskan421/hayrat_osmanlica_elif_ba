class MainModel {
  String? konu;
  Icon? icon;
  List<Dersler>? dersler;
  Renkler? renkler;

  MainModel({this.konu, this.icon, this.dersler, this.renkler});

  MainModel.fromJson(Map<String, dynamic> json) {
    konu = json['konu'];
    icon = json['icon'] != null ? Icon.fromJson(json['icon']) : null;
    if (json['dersler'] != null) {
      dersler = <Dersler>[];
      json['dersler'].forEach((v) {
        dersler!.add(Dersler.fromJson(v));
      });
    }
    renkler = json['renkler'] != null ? Renkler.fromJson(json['renkler']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['konu'] = konu;
    if (icon != null) {
      data['icon'] = icon!.toJson();
    }
    if (dersler != null) {
      data['dersler'] = dersler!.map((v) => v.toJson()).toList();
    }
    if (renkler != null) {
      data['renkler'] = renkler!.toJson();
    }
    return data;
  }
}

class Icon {
  String? rika;
  String? matbu;

  Icon({this.rika, this.matbu});

  Icon.fromJson(Map<String, dynamic> json) {
    rika = json['rika'];
    matbu = json['matbu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rika'] = rika;
    data['matbu'] = matbu;
    return data;
  }
}

class Dersler {
  String? dersAdi;
  String? link;

  Dersler({this.dersAdi, this.link});

  Dersler.fromJson(Map<String, dynamic> json) {
    dersAdi = json['dersAdi'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dersAdi'] = dersAdi;
    data['link'] = link;
    return data;
  }
}

class Renkler {
  String? primary;
  String? secondary;

  Renkler({this.primary, this.secondary});

  Renkler.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    secondary = json['secondary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['primary'] = primary;
    data['secondary'] = secondary;
    return data;
  }
}
