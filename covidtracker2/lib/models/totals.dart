// To parse this JSON data, do
//
//     final data = dataFromJson(jsonString);

import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
    bool success;
    DataClass data;
    DateTime lastRefreshed;
    DateTime lastOriginUpdate;

    Data({
        this.success,
        this.data,
        this.lastRefreshed,
        this.lastOriginUpdate,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        success: json["success"],
        data: DataClass.fromJson(json["data"]),
        lastRefreshed: DateTime.parse(json["lastRefreshed"]),
        lastOriginUpdate: DateTime.parse(json["lastOriginUpdate"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "lastRefreshed": lastRefreshed.toIso8601String(),
        "lastOriginUpdate": lastOriginUpdate.toIso8601String(),
    };
}

class DataClass {
    Summary summary;
    List<UnofficialSummary> unofficialSummary;
    List<Regional> regional;

    DataClass({
        this.summary,
        this.unofficialSummary,
        this.regional,
    });

    factory DataClass.fromJson(Map<String, dynamic> json) => DataClass(
        summary: Summary.fromJson(json["summary"]),
        unofficialSummary: List<UnofficialSummary>.from(json["unofficial-summary"].map((x) => UnofficialSummary.fromJson(x))),
        regional: List<Regional>.from(json["regional"].map((x) => Regional.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "summary": summary.toJson(),
        "unofficial-summary": List<dynamic>.from(unofficialSummary.map((x) => x.toJson())),
        "regional": List<dynamic>.from(regional.map((x) => x.toJson())),
    };
}

class Regional {
    String loc;
    int confirmedCasesIndian;
    int discharged;
    int deaths;
    int confirmedCasesForeign;
    int totalConfirmed;

    Regional({
        this.loc,
        this.confirmedCasesIndian,
        this.discharged,
        this.deaths,
        this.confirmedCasesForeign,
        this.totalConfirmed,
    });

    factory Regional.fromJson(Map<String, dynamic> json) => Regional(
        loc: json["loc"],
        confirmedCasesIndian: json["confirmedCasesIndian"],
        discharged: json["discharged"],
        deaths: json["deaths"],
        confirmedCasesForeign: json["confirmedCasesForeign"],
        totalConfirmed: json["totalConfirmed"],
    );

    Map<String, dynamic> toJson() => {
        "loc": loc,
        "confirmedCasesIndian": confirmedCasesIndian,
        "discharged": discharged,
        "deaths": deaths,
        "confirmedCasesForeign": confirmedCasesForeign,
        "totalConfirmed": totalConfirmed,
    };
}

class Summary {
    int total;
    int confirmedCasesIndian;
    int confirmedCasesForeign;
    int discharged;
    int deaths;
    int confirmedButLocationUnidentified;

    Summary({
        this.total,
        this.confirmedCasesIndian,
        this.confirmedCasesForeign,
        this.discharged,
        this.deaths,
        this.confirmedButLocationUnidentified,
    });

    factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        total: json["total"],
        confirmedCasesIndian: json["confirmedCasesIndian"],
        confirmedCasesForeign: json["confirmedCasesForeign"],
        discharged: json["discharged"],
        deaths: json["deaths"],
        confirmedButLocationUnidentified: json["confirmedButLocationUnidentified"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "confirmedCasesIndian": confirmedCasesIndian,
        "confirmedCasesForeign": confirmedCasesForeign,
        "discharged": discharged,
        "deaths": deaths,
        "confirmedButLocationUnidentified": confirmedButLocationUnidentified,
    };
}

class UnofficialSummary {
    String source;
    int total;
    int recovered;
    int deaths;
    int active;

    UnofficialSummary({
        this.source,
        this.total,
        this.recovered,
        this.deaths,
        this.active,
    });

    factory UnofficialSummary.fromJson(Map<String, dynamic> json) => UnofficialSummary(
        source: json["source"],
        total: json["total"],
        recovered: json["recovered"],
        deaths: json["deaths"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "source": source,
        "total": total,
        "recovered": recovered,
        "deaths": deaths,
        "active": active,
    };
}
