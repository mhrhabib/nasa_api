import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:nasa_app/controllers/asteroid_controller.dart';

class MyHomePage extends GetWidget<AsteroidController> {
   MyHomePage({Key? key}) : super(key: key);

  
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height:  MediaQuery.of(context).size.height * .20,
            child: controller.obx((state) {
        return ListView.builder(
          itemCount: state!.length,
          itemBuilder: (context, index) {
            List data = state.keys.toList();
             
           
          return GestureDetector(
            onTap: () {
              controller.visible.value = true;
              if(index==0){
                 controller.firstOne.value = state.values.first;
              }
              if(index == 1) {
                 controller.firstOne.value = state.values.last;
              }
             
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                margin: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("Date :"),
                    Text(data[index]),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                      ),
                      child: Text("Click Here to see the List of Asteroid")),
                  ],
                ),
              ),
            ),
          );
          
          
        },
      );
        
      },
      onError: (error) => Text("$error"),
      onLoading: const Center(child: CircularProgressIndicator(),),
      )
      
      ,
          ),
          controller.visible.value ? SizedBox(
            height: MediaQuery.of(context).size.height * .80,
            child: Obx(()=>  ListView.builder(
                itemCount: controller.firstOne.length,
                itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Container(child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(controller.firstOne[index]['name']),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(controller.firstOne[index]['absolute_magnitude_h'].toString()),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(controller.firstOne[index]['close_approach_data'][0]['close_approach_date'].toString()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(controller.firstOne[index]['is_potentially_hazardous_asteroid'].toString()),
                    ),
                  ],
                ) ),);
              },),)
          ): Container(),
        ],
      ),
    );
  }
}