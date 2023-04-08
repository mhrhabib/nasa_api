import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasa_app/controllers/asteroid_controller.dart';

class DateWidget extends StatefulWidget {
   DateWidget({super.key,  required this.date});
  
  String date;

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
     height: MediaQuery.of(context).size.height *0.08,
      decoration:  const BoxDecoration(
        
        boxShadow: [
           BoxShadow(
            color: Color.fromARGB(255, 185, 204, 164),
            blurRadius: 20.0,
          ),
        ],
      ),
       child:  Card(
        color: Colors.amber,
        child:  Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                  Text(widget.date),
                    IconButton(
                    onPressed: () {
                      setState(() {
                      Get.find<AsteroidController>().visible.value = !Get.find<AsteroidController>().visible.value;
                      });
                    }
                  , icon: Get.find<AsteroidController>().visible.value ? Icon(Icons.expand_more) : Icon(Icons.expand_less),
              ),],
              ),

            
              
            ],

          ),
        ),
      ),
    );
  }
}