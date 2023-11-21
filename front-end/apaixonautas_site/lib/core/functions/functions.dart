import 'dart:io';
class Functions {
  Future<bool> testNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  // validador de senha
  bool validaCaracterIndentico(String pass) {
    RegExp regExp = RegExp(
      r"([a-zA-Z0-9])\1\1\1+",
      multiLine: false,
      caseSensitive: true,
    );
    return regExp.hasMatch(pass);
  }

  bool validaCaracterNumSeq(String pass) {
    RegExp regExp = RegExp(
      r"(012345|123456|234567|345678|456789)|(987654|876543|765432|654321|543210)",
      multiLine: false,
    );
    return regExp.hasMatch(pass);
  }

  bool validaCaracterLetrasSeq(String pass) {
    RegExp regExp = RegExp(
      r"(abcdef|bcdefg|cdefgh|defghi|efghij|fghijk|ghijkl|hijklm|ijklmn|jklmno|klmnop|lmnopq|mnopqr|nopqrs|opqrst|pqrstu|qrstuv|rstuvw|stuvwx|tuvwxy|uvwxyz)|(zyxwvu|yxwvut|xwvuts|wvutsr|vutsrq|utsrqp|tsrqpo|srqpon|rqponm|qponml|ponmlk|onmlkj|nmlkji|mlkjih|lkjihg|kjihgf|jihgfe|ihgfed|hgfedc|gfedcb|fedcba)",
      multiLine: false,
      caseSensitive: true,
    );
    return regExp.hasMatch(pass);
  }

  bool isValidDate(String date) {
    try {
      String formatedDate = date;

      if (date.contains('/')) {
        formatedDate = date.replaceAll("/", "-");
      }
      formatedDate = reverse(formatedDate);
      DateTime.parse(formatedDate);

      final int year = int.parse(formatedDate.substring(0, 4)); 
      final int month = int.parse(formatedDate.substring(5, 7)); 
      final int day = int.parse(formatedDate.substring(8, 10)); 

      if(day < 1 || day > 31) {
        return false;
      } else if (month < 1 || month > 12) {
        return false;
      } else if (year < 1900) {
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  bool isNotFutureDate(String date) {
    try {
      String formatedDate = date;

      if (date.contains('/')) {
        formatedDate = date.replaceAll("/", "-");
      }

      formatedDate = reverse(formatedDate);

      final dateTime = DateTime.parse(formatedDate);
      if (dateTime.isAfter(DateTime.now())) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  String reverse(String string) {
    final String day = string.substring(0, 2);
    final String month = string.substring(3, 5);
    final String year = string.substring(6, 10);

    return '$year-$month-$day';
  }
}
