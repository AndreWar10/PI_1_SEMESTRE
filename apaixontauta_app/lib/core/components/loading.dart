import 'package:apaixontauta_app/core/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: 500,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitWave(
              size: 50,
              itemBuilder: (_, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: index.isEven
                        ? const Color(0xff0038a8)
                        : Colors.deepPurpleAccent,
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Text(
              'Carregando dados...',
              style: TextStyle(color: Colors.black, fontSize: 16, fontFamily: AppFonts.poppins400),
            ),
          ],
        )),
      ),
    );
  }
}
