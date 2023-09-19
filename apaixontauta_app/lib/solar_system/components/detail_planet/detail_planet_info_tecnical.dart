import 'package:apaixontauta_app/solar_system/models/solar_system_model.dart';
import 'package:flutter/material.dart';

class DetailTecnicalInformationWidget extends StatelessWidget {
  const DetailTecnicalInformationWidget({
    Key? key,
    required this.planet,
  }) : super(key: key);

  final SolarSystemModel planet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              planet.features.diameter,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              planet.features.sunDistance,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Diâmetro',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Spacer(),
            Text(
              'Distância do Sol',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              planet.features.satellites.number.toString(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              planet.features.orbitalPeriod.last,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Satélites',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Spacer(),
            Text(
              'Duração do ano',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              planet.features.rotationDuration.toString(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              planet.features.orbitalSpeed,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Período de rotação',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Spacer(),
            Text(
              'Velocidade da órbita',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            planet.features.temperature != ''
                ? Text(
                    planet.features.temperature.toString(),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  )
                : const Text(
                    'Não informado',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
            const Spacer(),
            Text(
              planet.features.radius,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Temperatura',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Spacer(),
            Text(
              'Raio do planeta',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
