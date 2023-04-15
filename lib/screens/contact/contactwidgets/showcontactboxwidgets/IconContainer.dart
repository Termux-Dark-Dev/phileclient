import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:phileclientapp/common/snackbars/snackbars.dart';
import 'package:url_launcher/url_launcher.dart';

class IconContainer extends StatelessWidget {
  // const RightContainer({super.key});
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amberAccent,
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 340.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () async {
                    final Uri emailUri = Uri(
                        scheme: 'mailto',
                        path: "sagarvishal85@gmail.com",
                        query: encodeQueryParameters(<String, String>{
                          'subject': 'Regarding Query On Looks App',
                        }));
                    launchUrl(emailUri);
                  },
                  icon: Icon(
                    Icons.email_rounded,
                    color: Colors.teal[500],
                    size: 34.sp,
                  )),
              IconButton(
                  onPressed: () async {
                    final Uri phoneUri = Uri(
                      scheme: 'tel',
                      path: "+918999523696",
                    );
                    if (await canLaunchUrl(phoneUri)) {
                      await launchUrl(phoneUri);
                    } else {
                      SnackBars.customsnack(
                          "Something Unexpected Occured While Opening Phone Caller",
                          Icons.close,
                          Colors.red);
                    }
                  },
                  icon: Icon(
                    Icons.call,
                    color: Colors.blue[500],
                    size: 34.sp,
                  )),
              Container(
                child: GestureDetector(
                  onTap: () {
                    FlutterWebBrowser.openWebPage(
                      url: "https://wa.me/918999523696?text=Looks%20",
                    );
                  },
                  child: Image.asset(
                    'assets/img/whatsapp.png',
                    width: 40.w,
                    height: 60.h,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
