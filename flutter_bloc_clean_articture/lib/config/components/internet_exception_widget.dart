
import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress, });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * .15,),
       const Icon(
            Icons.cloud_off,
            color: Colors.red,
             size: 50,
        ),
       Padding(
           padding: EdgeInsets.only(top: 30),
         child: Center(
           child: Text(
             "We're unable to show results. \nPlease check your\nconnection",
             textAlign: TextAlign.center,
             style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20),
           ),
         ),
       ),
        SizedBox(height: 30,),
        ElevatedButton(
            onPressed: onPress,
            child: Center(
              child: Center(
                child: Text(
                  "Retry",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              )
            )
        )
      ],
    );
  }
}
