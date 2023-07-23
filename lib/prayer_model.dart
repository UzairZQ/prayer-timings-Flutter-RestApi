// To parse this JSON data, do
//
//     final prayers = prayersFromMap(jsonString);

import 'dart:convert';

class Prayers {
    Prayers({
        this.code,
        this.status,
        this.data,
    });

    final int? code;
    final String? status;
    final Data? data;

    factory Prayers.fromJson(String str) => Prayers.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Prayers.fromMap(Map<String, dynamic> json) => Prayers(
        code: json["code"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
    );

    Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "data": data?.toMap(),
    };
}

class Data {
    Data({
        this.timings,
        this.date,
        this.meta,
    });

    final Timings? timings;
    final Date? date;
    final Meta? meta;

    factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Data.fromMap(Map<String, dynamic> json) => Data(
        timings: json["timings"] == null ? null : Timings.fromMap(json["timings"]),
        date: json["date"] == null ? null : Date.fromMap(json["date"]),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
    );

    Map<String, dynamic> toMap() => {
        "timings": timings?.toMap(),
        "date": date?.toMap(),
        "meta": meta?.toMap(),
    };
}

class Date {
    Date({
        this.readable,
        this.timestamp,
        this.hijri,
        this.gregorian,
    });

    final String? readable;
    final String? timestamp;
    final Hijri? hijri;
    final Gregorian? gregorian;

    factory Date.fromJson(String str) => Date.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Date.fromMap(Map<String, dynamic> json) => Date(
        readable: json["readable"],
        timestamp: json["timestamp"],
        hijri: json["hijri"] == null ? null : Hijri.fromMap(json["hijri"]),
        gregorian: json["gregorian"] == null ? null : Gregorian.fromMap(json["gregorian"]),
    );

    Map<String, dynamic> toMap() => {
        "readable": readable,
        "timestamp": timestamp,
        "hijri": hijri?.toMap(),
        "gregorian": gregorian?.toMap(),
    };
}

class Gregorian {
    Gregorian({
        this.date,
        this.format,
        this.day,
        this.weekday,
        this.month,
        this.year,
        this.designation,
    });

    final String? date;
    final String? format;
    final String? day;
    final GregorianWeekday? weekday;
    final GregorianMonth? month;
    final String? year;
    final Designation? designation;

    factory Gregorian.fromJson(String str) => Gregorian.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Gregorian.fromMap(Map<String, dynamic> json) => Gregorian(
        date: json["date"],
        format: json["format"],
        day: json["day"],
        weekday: json["weekday"] == null ? null : GregorianWeekday.fromMap(json["weekday"]),
        month: json["month"] == null ? null : GregorianMonth.fromMap(json["month"]),
        year: json["year"],
        designation: json["designation"] == null ? null : Designation.fromMap(json["designation"]),
    );

    Map<String, dynamic> toMap() => {
        "date": date,
        "format": format,
        "day": day,
        "weekday": weekday?.toMap(),
        "month": month?.toMap(),
        "year": year,
        "designation": designation?.toMap(),
    };
}

class Designation {
    Designation({
        this.abbreviated,
        this.expanded,
    });

    final String? abbreviated;
    final String? expanded;

    factory Designation.fromJson(String str) => Designation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Designation.fromMap(Map<String, dynamic> json) => Designation(
        abbreviated: json["abbreviated"],
        expanded: json["expanded"],
    );

    Map<String, dynamic> toMap() => {
        "abbreviated": abbreviated,
        "expanded": expanded,
    };
}

class GregorianMonth {
    GregorianMonth({
        this.number,
        this.en,
    });

    final int? number;
    final String? en;

    factory GregorianMonth.fromJson(String str) => GregorianMonth.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GregorianMonth.fromMap(Map<String, dynamic> json) => GregorianMonth(
        number: json["number"],
        en: json["en"],
    );

    Map<String, dynamic> toMap() => {
        "number": number,
        "en": en,
    };
}

class GregorianWeekday {
    GregorianWeekday({
        this.en,
    });

    final String? en;

    factory GregorianWeekday.fromJson(String str) => GregorianWeekday.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GregorianWeekday.fromMap(Map<String, dynamic> json) => GregorianWeekday(
        en: json["en"],
    );

    Map<String, dynamic> toMap() => {
        "en": en,
    };
}

class Hijri {
    Hijri({
        this.date,
        this.format,
        this.day,
        this.weekday,
        this.month,
        this.year,
        this.designation,
        this.holidays,
    });

    final String? date;
    final String? format;
    final String? day;
    final HijriWeekday? weekday;
    final HijriMonth? month;
    final String? year;
    final Designation? designation;
    final List<dynamic>? holidays;

    factory Hijri.fromJson(String str) => Hijri.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Hijri.fromMap(Map<String, dynamic> json) => Hijri(
        date: json["date"],
        format: json["format"],
        day: json["day"],
        weekday: json["weekday"] == null ? null : HijriWeekday.fromMap(json["weekday"]),
        month: json["month"] == null ? null : HijriMonth.fromMap(json["month"]),
        year: json["year"],
        designation: json["designation"] == null ? null : Designation.fromMap(json["designation"]),
        holidays: json["holidays"] == null ? [] : List<dynamic>.from(json["holidays"]!.map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "date": date,
        "format": format,
        "day": day,
        "weekday": weekday?.toMap(),
        "month": month?.toMap(),
        "year": year,
        "designation": designation?.toMap(),
        "holidays": holidays == null ? [] : List<dynamic>.from(holidays!.map((x) => x)),
    };
}

class HijriMonth {
    HijriMonth({
        this.number,
        this.en,
        this.ar,
    });

    final int? number;
    final String? en;
    final String? ar;

    factory HijriMonth.fromJson(String str) => HijriMonth.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory HijriMonth.fromMap(Map<String, dynamic> json) => HijriMonth(
        number: json["number"],
        en: json["en"],
        ar: json["ar"],
    );

    Map<String, dynamic> toMap() => {
        "number": number,
        "en": en,
        "ar": ar,
    };
}

class HijriWeekday {
    HijriWeekday({
        this.en,
        this.ar,
    });

    final String? en;
    final String? ar;

    factory HijriWeekday.fromJson(String str) => HijriWeekday.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory HijriWeekday.fromMap(Map<String, dynamic> json) => HijriWeekday(
        en: json["en"],
        ar: json["ar"],
    );

    Map<String, dynamic> toMap() => {
        "en": en,
        "ar": ar,
    };
}

class Meta {
    Meta({
        this.latitude,
        this.longitude,
        this.timezone,
        this.method,
        this.latitudeAdjustmentMethod,
        this.midnightMode,
        this.school,
        this.offset,
    });

    final double? latitude;
    final double? longitude;
    final String? timezone;
    final Method? method;
    final String? latitudeAdjustmentMethod;
    final String? midnightMode;
    final String? school;
    final Map<String, int>? offset;

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        timezone: json["timezone"],
        method: json["method"] == null ? null : Method.fromMap(json["method"]),
        latitudeAdjustmentMethod: json["latitudeAdjustmentMethod"],
        midnightMode: json["midnightMode"],
        school: json["school"],
        offset: Map.from(json["offset"]!).map((k, v) => MapEntry<String, int>(k, v)),
    );

    Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
        "timezone": timezone,
        "method": method?.toMap(),
        "latitudeAdjustmentMethod": latitudeAdjustmentMethod,
        "midnightMode": midnightMode,
        "school": school,
        "offset": Map.from(offset!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    };
}

class Method {
    Method({
        this.id,
        this.name,
        this.params,
        this.location,
    });

    final int? id;
    final String? name;
    final Params? params;
    final Location? location;

    factory Method.fromJson(String str) => Method.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Method.fromMap(Map<String, dynamic> json) => Method(
        id: json["id"],
        name: json["name"],
        params: json["params"] == null ? null : Params.fromMap(json["params"]),
        location: json["location"] == null ? null : Location.fromMap(json["location"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "params": params?.toMap(),
        "location": location?.toMap(),
    };
}

class Location {
    Location({
        this.latitude,
        this.longitude,
    });

    final double? latitude;
    final double? longitude;

    factory Location.fromJson(String str) => Location.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Location.fromMap(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

class Params {
    Params({
        this.fajr,
        this.isha,
    });

    final double? fajr;
    final String? isha;

    factory Params.fromJson(String str) => Params.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Params.fromMap(Map<String, dynamic> json) => Params(
        fajr: json["Fajr"]?.toDouble(),
        isha: json["Isha"],
    );

    Map<String, dynamic> toMap() => {
        "Fajr": fajr,
        "Isha": isha,
    };
}

class Timings {
    Timings({
        this.fajr,
        this.sunrise,
        this.dhuhr,
        this.asr,
        this.sunset,
        this.maghrib,
        this.isha,
        this.imsak,
        this.midnight,
        this.firstthird,
        this.lastthird,
    });

    final String? fajr;
    final String? sunrise;
    final String? dhuhr;
    final String? asr;
    final String? sunset;
    final String? maghrib;
    final String? isha;
    final String? imsak;
    final String? midnight;
    final String? firstthird;
    final String? lastthird;

    factory Timings.fromJson(String str) => Timings.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Timings.fromMap(Map<String, dynamic> json) => Timings(
        fajr: json["Fajr"],
        sunrise: json["Sunrise"],
        dhuhr: json["Dhuhr"],
        asr: json["Asr"],
        sunset: json["Sunset"],
        maghrib: json["Maghrib"],
        isha: json["Isha"],
        imsak: json["Imsak"],
        midnight: json["Midnight"],
        firstthird: json["Firstthird"],
        lastthird: json["Lastthird"],
    );

    Map<String, dynamic> toMap() => {
        "Fajr": fajr,
        "Sunrise": sunrise,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Sunset": sunset,
        "Maghrib": maghrib,
        "Isha": isha,
        "Imsak": imsak,
        "Midnight": midnight,
        "Firstthird": firstthird,
        "Lastthird": lastthird,
    };
}
