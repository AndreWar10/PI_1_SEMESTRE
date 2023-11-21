import 'package:apaixonautas_site/core/utils/app_assets.dart';
import 'package:apaixonautas_site/core/utils/app_fonts.dart';
import 'package:apaixonautas_site/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeaderWeb extends PreferredSize {
  const HeaderWeb({super.key})
      : super(
            child: const SizedBox(), preferredSize: const Size.fromHeight(85));

  @override
  Size get preferredSize => const Size.fromHeight(85);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return AppBar(
          toolbarHeight: 85.0,
          backgroundColor: const Color.fromARGB(255, 27, 27, 27),
          automaticallyImplyLeading: sizingInformation.isDesktop ? false : true,
          iconTheme: const IconThemeData(size: 60, color: Colors.white),
          title: Container(
            height: 85,
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (sizingInformation.isDesktop) ...{
                    Expanded(
                      flex: 4,
                      child: Container(
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            menuItem('Sistema', 'Solar', AppRoutes.systemSolar, AppAssets.menuSolarSystem, context),
                            menuItem('Notícias', 'Astronômicas', AppRoutes.news, AppAssets.menuNews, context),
                            menuItem('Lançamentos', 'Espaciais', AppRoutes.systemSolar, AppAssets.menuLaunchs, context),
                            menuItem('Observatórios', 'Astronômicos', AppRoutes.systemSolar, AppAssets.menuObservatories, context),
                          ],
                        ),
                      ),
                    ),
                  },
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/login');
                            },
                            child: Text(
                              'Entre ou ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppFonts.poppins600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/sign-up');
                            },
                            child: Text(
                              'Cadastre-se',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppFonts.poppins700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget menuItem(String text1, String text2, String route, String icon, BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(route),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(
                    icon,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 6),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(route);
              },
              child: Text(
                text1,
                style: textStyleMenu(),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(route);
              },
              child: Text(
                text2,
                style: textStyleMenu(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  textStyleMenu() {
    return TextStyle(
      fontFamily: AppFonts.poppins600,
      fontSize: 14,
      color: Colors.white,
    );
  }
}

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color hoverColor =
        const Color.fromARGB(255, 96, 14, 112).withOpacity(0.05);
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
            sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return SizedBox(
            child: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(
                    height: 80,
                    child: DrawerHeader(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: hoverColor,
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Entrar ou criar uma conta ',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: AppFonts.poppins600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                      hoverColor: hoverColor,
                      leading: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          AppAssets.menuSolarSystem,
                        ),
                      ),
                      title: Text(
                        'Sistema Solar',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFonts.poppins600,
                        ),
                      ),
                      onTap: () => Navigator.of(context).pushNamed(AppRoutes.systemSolar)),
                  ListTile(
                      hoverColor: hoverColor,
                      leading: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          AppAssets.menuNews,
                        ),
                      ),
                      title: Text(
                        'Notícias',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFonts.poppins600,
                        ),
                      ),
                      onTap: () => Navigator.of(context).pushNamed(AppRoutes.news)),
                  ListTile(
                      hoverColor: hoverColor,
                      leading: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset(
                          AppAssets.menuLaunchs,
                        ),
                      ),
                      title: Text(
                        'Lançamentos',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFonts.poppins600,
                        ),
                      ),
                      onTap: () =>
                          Navigator.of(context).pushNamed(AppRoutes.news)),
                  ListTile(
                    hoverColor: hoverColor,
                    leading: SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        AppAssets.menuObservatories,
                      ),
                    ),
                    title: Text(
                      'Observatórios',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: AppFonts.poppins600,
                      ),
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
