import 'package:apaixontauta_app/solar_system/components/detail_planet/detail_planet_info_tecnical.dart';
import 'package:apaixontauta_app/solar_system/models/solar_system_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlanetDetailPage extends StatefulWidget {
  const PlanetDetailPage({super.key, required this.planet});

  final SolarSystemModel planet;

  @override
  State<PlanetDetailPage> createState() => _PlanetDetailPageState();
}

class _PlanetDetailPageState extends State<PlanetDetailPage> {
  YoutubePlayerController? _youtubeController;

  @override
  void initState() {
    final String link = YoutubePlayer.convertUrlToId(widget.planet.video!)!;
    _youtubeController = YoutubePlayerController(
      initialVideoId: link,
      flags: const YoutubePlayerFlags(
        mute: true,
        autoPlay: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _youtubeController!.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _youtubeController!.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //controller: scrollController,
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true, //appBar fixa
            elevation: 0,
            backgroundColor: widget.planet.baseColor2,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.chevron_left,
                size: 30,
              ),
            ),
            centerTitle: false,
            title: Text(
              widget.planet.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [widget.planet.baseColor!, widget.planet.baseColor2!],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
        //          image: DecorationImage(
        //   image: AssetImage(AppAssets.backgroundMax ),
        //   fit: BoxFit.cover,
        // ),
              ),
              child: Center(
                child: SizedBox(
                  height: 500,
                  width: 500,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child:   Cube(
                          onSceneCreated: (Scene s) {
                            Object earth = Object(fileName: 'planets_3d/${widget.planet.name}.obj', scale: Vector3.all(10));
                            earth.updateTransform();
                            s.world.add(earth);
                                
                          },
                          interactive: true,
                        ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: widget.planet.baseColor,
              child: Stack(
                children: [
                  //DetailColorBackgroundWidget(widget: widget),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            const Text(
                              '__________',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black54),
                            ),
                            const SizedBox(height: 25),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Overview',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.planet.name,
                                  style: const TextStyle(
                                    fontSize: 44,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: IconButton(
                                    icon: const Icon(Icons.share),
                                    color: const Color.fromARGB(
                                        255, 109, 108, 108),
                                    iconSize: 40,
                                    onPressed: () async {
                                      var urlPreview =
                                          widget.planet.video!.toString();
                                      await Share.share(
                                          'Veja que vídeo interessante que obtive gratuitamente no App Keep Looking Up 👇 \n\n$urlPreview');
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  //era desscription
                                  widget.planet.description!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              children: [
                                Text(
                                  widget.planet.resume,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 20),
                            DetailTecnicalInformationWidget(planet: widget.planet),
                            const SizedBox(height: 25),

                            YoutubePlayer(
                              controller: _youtubeController!,
                              showVideoProgressIndicator: true,
                              onReady: () {
                                debugPrint('Player is ready.');
                              },
                            ),
                            const SizedBox(height: 50),

                            // GestureDetector(
                            //   onTap: () async {
                            //     final Uri url = Uri.parse(widget.planet.video!);
                            //     await launchUrl(url);
                            //   },
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(bottom: 14),
                            //     child: Row(
                            //       children: const [
                            //         Icon(
                            //           Icons.play_arrow,
                            //           color: Colors.deepPurpleAccent,
                            //           size: 30,
                            //         ),
                            //         Text(
                            //           'Assistir Vídeo',
                            //           style: TextStyle(
                            //               fontSize: 18,
                            //               fontWeight: FontWeight.bold,
                            //               color: Colors.deepPurpleAccent),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
