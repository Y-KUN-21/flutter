// To parse this JSON data, do
//
//     final districtwise = districtwiseFromJson(jsonString);

import 'dart:convert';

List<Districtwise> districtwiseFromJson(String str) => List<Districtwise>.from(json.decode(str).map((x) => Districtwise.fromJson(x)));

String districtwiseToJson(List<Districtwise> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Districtwise {
    String state;
    String statecode;
    List<DistrictDatum> districtData;

    Districtwise({
        this.state,
        this.statecode,
        this.districtData,
    });

    factory Districtwise.fromJson(Map<String, dynamic> json) => Districtwise(
        state: json["state"],
        statecode: json["statecode"],
        districtData: List<DistrictDatum>.from(json["districtData"].map((x) => DistrictDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "state": state,
        "statecode": statecode,
        "districtData": List<dynamic>.from(districtData.map((x) => x.toJson())),
    };
}

class DistrictDatum {
    String district;
    int active;
    int confirmed;
    int deceased;
    int recovered;

    DistrictDatum({
        this.district,
        this.active,
        this.confirmed,
        this.deceased,
        this.recovered,
    });

    factory DistrictDatum.fromJson(Map<String, dynamic> json) => DistrictDatum(
        district: json["district"],
        active: json["active"],
        confirmed: json["confirmed"],
        deceased: json["deceased"],
        recovered: json["recovered"],
    );

    Map<String, dynamic> toJson() => {
        "district": district,
        "active": active,
        "confirmed": confirmed,
        "deceased": deceased,
        "recovered": recovered,
    };
}
