import 'dart:convert';

import 'package:flutter/material.dart';

List<SolarSystemModel> systemSolarModelFromJson(String str) =>
    List<SolarSystemModel>.from(
        json.decode(str).map((x) => SolarSystemModel.fromJson(x)));

String systemSolarModelToJson(List<SolarSystemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SolarSystemModel {
  SolarSystemModel({
    required this.id,
    required this.name,
    required this.type,
    required this.resume,
    required this.introduction,
    required this.images,
    required this.searchTags,
    required this.features,
    required this.geography,
  });

  String id;
  String name;
  String type;
  String resume;
  String introduction;
  Images images;
  List<String> searchTags;
  Features features;
  String geography;

  Color? get baseColor => _color(id: id[0]);
  static Color? _color({required String id}) {
    switch (id) {
      case '0':
        return const Color(0xFFb17c0c);
      case '1':
        return const Color(0xFF6c6c6c);
      case '2':
        return const Color(0xFF733508);
      case '3':
        return const Color(0xFF055643);
      case '4':
        return const Color(0xFF431b10);
      case '5':
        return const Color(0xFF402009);
      case '6':
        return const Color(0xFF6d4c23);
      case '7':
        return const Color.fromARGB(255, 1, 59, 82);
      case '8':
        return const Color(0xFF1a1d4d);
      case '9':
        return const Color(0xFF694e31);
      default:
        return const Color(0xFFFFFFFF);
    }
  }

  Color? get baseColor2 => _color2(id: id[0]);

  static Color? _color2({required String id}) {
    switch (id) {
      case '0':
        return const Color(0xFFf9e831);

      case '1':
        return const Color(0xFFe8b99d);
      case '2':
        return const Color(0xFFdd8a3c);
      case '3':
        return const Color(0xFF2f308e);
      case '4':
        return const Color(0xFFd16b3a);
      case '5':
        return const Color(0xFFae8b56);
      case '6':
        return const Color(0xFFf0ca81);
      case '7':
        return const Color.fromARGB(255, 56, 175, 230);
      case '8':
        return const Color(0xFF7187db);
      case '9':
        return const Color(0xFFe6bd87);
      default:
        return const Color(0xFFFFFFFF);
    }
  }

  String? get cardtext => _string(id: id[0]);

  static String? _string({required String id}) {
    switch (id) {
      case '0':
        return 'Nosso Sol é uma estrela de 4,5 bilhões de anos – uma bola quente e brilhante de hidrogênio e hélio no centro do';
      case '1':
        return 'O menor planeta do nosso sistema solar e mais próximo do Sol, Mercúrio é apenas um pouco maior que a';
      case '2':
        return 'Vênus é o segundo planeta a partir do Sol e é o vizinho planetário mais próximo do planeta Terra. Vênus';
      case '3':
        return 'Nosso planeta natal é o terceiro planeta a partir do Sol, e o único lugar que conhecemos até agora que é habitado';
      case '4':
        return 'Marte é o quarto planeta a partir do Sol, o segundo menor do Sistema Solar. Batizado em homenagem ao';
      case '5':
        return 'Júpiter tem uma longa história de cientistas surpreendentes desde 1610, quando Galileu Galilei encontrou';
      case '6':
        return 'Saturno é o sexto planeta a partir do Sol e o segundo maior planeta do nosso sistema solar. Adornado';
      case '7':
        return 'Urano é o sétimo planeta a partir do Sol e tem o terceiro maior diâmetro do nosso sistema solar. Foi o';
      case '8':
        return 'Escuro, frio e açoitado por ventos supersônicos, o gigante de gelo Netuno é o oitavo e mais distante';
      case '9':
        return 'Em 2006, Plutão foi reclassificado como planeta anão. Basicamente, o principal parâmetro ';
      default:
        return '';
    }
  }

  String? get video => _video(id: id[0]);

  static String? _video({required String id}) {
    switch (id) {
      case '0':
        return 'https://www.youtube.com/watch?v=nAdj9an6N24';
      case '1':
        return 'https://www.youtube.com/watch?v=Nt1roYm0jPQ';
      case '2':
        return 'https://www.youtube.com/watch?v=T5bDge0m6FI';
      case '3':
        return 'https://www.youtube.com/watch?v=lEePi92HCuI';
      case '4':
        return 'https://www.youtube.com/watch?v=_O47N1cGybA';
      case '5':
        return 'https://www.youtube.com/watch?v=NP0ymdPeW7w';
      case '6':
        return 'https://www.youtube.com/watch?v=i0YzfunCz3A';
      case '7':
        return 'https://www.youtube.com/watch?v=e8bdtCgCoNY';
      case '8':
        return 'https://www.youtube.com/watch?v=xO-fBNKjOzs';
      case '9':
        return 'https://www.youtube.com/watch?v=-rG1e3FQUpI';
      default:
        return '';
    }
  }

  String? get description => _stringDes(id: id[0]);

  static String? _stringDes({required String id}) {
    switch (id) {
      case '0':
        return 'Estrela Central do Sistema Solar';
      case '1':
        return 'Menor e mais interno do Sistema Solar';
      case '2':
        return 'Segundo planeta do Sistema Solar';
      case '3':
        return 'Nosso grande Planeta Azul';
      case '4':
        return 'O grande Planeta Vermelho';
      case '5':
        return 'O maior planeta do Sistema Solar';
      case '6':
        return 'O planeta com mais Luas';
      case '7':
        return 'O planeta mais frio ';
      case '8':
        return 'O último planeta do sistema solar';
      case '9':
        return 'O planeta Anão ';
      default:
        return '';
    }
  }

  factory SolarSystemModel.fromJson(Map<String, dynamic> json) =>
      SolarSystemModel(
        id: json["id"],
        name: json["name"] == 'Vênus'
            ? 'Venus'
            : json["name"] == 'Mercúrio'
                ? 'Mercurio'
                : json["name"] == 'Júpiter'
                    ? 'Jupiter'
                    : json["name"] == 'Plutão'
                        ? 'Plutao'
                        : json['name'],
        type: json["type"],
        resume: json["resume"],
        introduction: json["introduction"],
        images: Images.fromJson(json["images"]),
        searchTags: List<String>.from(json["searchTags"].map((x) => x)),
        features: Features.fromJson(json["features"]),
        geography: json["geography"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "resume": resume,
        "introduction": introduction,
        "images": images.toJson(),
        "searchTags": List<dynamic>.from(searchTags.map((x) => x)),
        "features": features.toJson(),
        "geography": geography,
      };
}

class Features {
  Features({
    required this.orbitalPeriod,
    required this.orbitalSpeed,
    required this.rotationDuration,
    required this.radius,
    required this.diameter,
    required this.sunDistance,
    required this.oneWayLightToTheSun,
    required this.satellites,
    required this.temperature,
    required this.gravity,
  });

  List<String> orbitalPeriod;
  String orbitalSpeed;
  String rotationDuration;
  String radius;
  String diameter;
  String sunDistance;
  String oneWayLightToTheSun;
  Satellites satellites;
  String temperature;
  String gravity;

  factory Features.fromJson(Map<String, dynamic> json) => Features(
        orbitalPeriod: List<String>.from(json["orbitalPeriod"].map((x) => x)),
        orbitalSpeed: json["orbitalSpeed"],
        rotationDuration: json["rotationDuration"],
        radius: json["radius"],
        diameter: json["Diameter"],
        sunDistance: json["sunDistance"],
        oneWayLightToTheSun: json["oneWayLightToTheSun"],
        satellites: Satellites.fromJson(json["satellites"]),
        temperature: json["temperature"],
        gravity: json["gravity"],
      );

  Map<String, dynamic> toJson() => {
        "orbitalPeriod": List<dynamic>.from(orbitalPeriod.map((x) => x)),
        "orbitalSpeed": orbitalSpeed,
        "rotationDuration": rotationDuration,
        "radius": radius,
        "Diameter": diameter,
        "sunDistance": sunDistance,
        "oneWayLightToTheSun": oneWayLightToTheSun,
        "satellites": satellites.toJson(),
        "temperature": temperature,
        "gravity": gravity,
      };
}

class Satellites {
  Satellites({
    required this.number,
    required this.names,
  });

  int number;
  List<String> names;

  factory Satellites.fromJson(Map<String, dynamic> json) => Satellites(
        number: json["number"],
        names: List<String>.from(json["names"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "names": List<dynamic>.from(names.map((x) => x)),
      };
}

class Images {
  Images({
    required this.svg,
    required this.png,
  });

  String svg;
  String png;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        svg: json["svg"],
        png: json["png"],
      );

  Map<String, dynamic> toJson() => {
        "svg": svg,
        "png": png,
      };
}
