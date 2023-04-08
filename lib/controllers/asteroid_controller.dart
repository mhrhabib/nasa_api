import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:nasa_app/models/asteroid.dart';
import 'package:nasa_app/repository/asteroid_repo.dart';

class AsteroidController extends GetxController with StateMixin<Asteroid>{

final AsteroidRepo _asteroidRepo = AsteroidRepo();
 var visible = false.obs;
 List<NearEarthObject> firstOne = <NearEarthObject>[].obs;

 List<Widget> order = <Widget>[
    Text('Accending'),
    Text('Decending'),
  ];

  final List<bool> selecteOrder = <bool>[false, true].obs;
 

 void getAsteroidData()async{
  RxStatus.loading();
  _asteroidRepo.getAsteroidData().then((value){
    change(value, status: RxStatus.success());

  }).catchError((onError){
    change(onError, status:  RxStatus.error());
  });

 } 





  @override
  void onInit() {
    getAsteroidData();
    super.onInit();
  }
}