import 'package:apaixonautas_site/core/exceptions.dart';
import 'package:apaixonautas_site/core/functions/functions.dart';
import 'package:flutter/material.dart';

class WithoutNetwork extends StatefulWidget {
  const WithoutNetwork({
    super.key,
    required this.error,
    this.funcUpdate,
  });

  final Function? funcUpdate; //update screen
  final NoInternetException error;

  @override
  State<WithoutNetwork> createState() => _WithoutNetworkState();
}

class _WithoutNetworkState extends State<WithoutNetwork> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '${widget.error.message}  :(',
                style: const TextStyle(fontSize: 16),
              ),
              widget.funcUpdate != null ? buttonRefresh(context) : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonRefresh(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          isLoading = true;
        });

        if (await Functions().testNetwork()) {
          await Future.delayed(const Duration(seconds: 1)).then(
            (value) => setState(() {
              isLoading = false;
            }),
          );

          widget.funcUpdate!(); //connection is OK!
        } else {
          await Future.delayed(const Duration(seconds: 1)).then(
            (value) => setState(() {
              isLoading = false;
            }),
          );

          //show bad feedback to user
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSnackBar(context: context, message: 'Sem conexão com internet');
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          height: 40,
          width: 140,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: isLoading
              ? const Center(
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3.0,
                    ),
                  ),
                )
              : const Center(
                  child: Text(
                    'RECARREGAR',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
        ),
      ),
    );
  }
}

void showSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 4),
    ),
  );
}
