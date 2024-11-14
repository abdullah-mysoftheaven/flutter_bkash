import 'package:bkash/bkash.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';



import '../controller/splash_screen_page_controller.dart';



class SplashScreenPage extends StatelessWidget {
   final pageController = Get.put(SplashScreenPageController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(

          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Row(
                  children: [
                    Expanded(child: InkWell(
                      onTap: () async {
                        final myBkash = Bkash(logResponse: true);

                        // final Bkash = Bkash(
                        //   credentials: BkashCredentials(
                        //     username: "app_username",
                        //     password: "app_password",
                        //     appKey: "app_key",
                        //     appSecret: "app_secret",
                        //     isSandbox: false,
                        //   ),
                        // );

                        try{
                          final response = await myBkash.pay(
                            context: context, // BuildContext context
                            amount: 10.0, // amount as double
                            merchantInvoiceNumber: "invoice123",
                          );
                          print(response. paymentId);
                          print(response.trxId);

                        }
                        on BkashFailure catch(e){
                          print(e.message);
                        }


                      },
                      child:   Container(
                        decoration:   BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        padding: const EdgeInsets.only(top:20,bottom: 20),
                        margin: const EdgeInsets.only(left:20,right: 20),
                        child: const Text("BKash Sand Box",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 18
                        ),
                        ),
                      ),

                    ))
                  ],
                ),

                const SizedBox(height: 40,),

                Row(
                  children: [
                    Expanded(child: InkWell(
                      onTap: () async {
                        final myBkash = Bkash(logResponse: true);

                        // final Bkash = Bkash(
                        //   credentials: BkashCredentials(
                        //     username: "app_username",
                        //     password: "app_password",
                        //     appKey: "app_key",
                        //     appSecret: "app_secret",
                        //     isSandbox: false,
                        //   ),
                        // );

                        try{
                          final myAgreement = await myBkash.createAgreement(
                            context: context, // BuildContext context
                          );

                          final response = await myBkash.payWithAgreement(
                            context: Get.context!, // BuildContext context
                            amount: 100.0, // type as double
                            agreementId: myAgreement.agreementId,
                            marchentInvoiceNumber: "invoice123",
                          );

                           print(response.trxId);
                        //
                        }
                        on BkashFailure catch(e){
                          print(e.message);
                        }


                      },
                      child:   Container(
                        decoration:   BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: const EdgeInsets.only(top:20,bottom: 20),
                        margin: const EdgeInsets.only(left:20,right: 20),
                        child: const Text("BKash Agreement",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 18
                          ),
                        ),
                      ),

                    ))
                  ],
                )

              ],
            ),
          )

      )
    );


  }}

