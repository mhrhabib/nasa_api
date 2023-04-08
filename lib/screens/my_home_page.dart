import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nasa_app/controllers/asteroid_controller.dart';
import 'package:nasa_app/widgets/date_widget.dart';

class MyHomePage extends GetWidget<AsteroidController> {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            controller.obx(
              (state) {
                return SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state!.nearEarthObjects!.keys.toList().length,
                    itemBuilder: (context, index) {
                      List<String> data = state.nearEarthObjects!.keys.toList();
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.visible.value =
                                  !controller.visible.value;
                              if (index == 0)
                                controller.firstOne =
                                    state.nearEarthObjects!.values.first;
                              if (index == 1)
                                controller.firstOne =
                                    state.nearEarthObjects!.values.last;
                            },
                            child: DateWidget(
                              date: data[index],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
              onError: (error) => Text("$error"),
              onLoading: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            ToggleButtons(
              direction: Axis.horizontal,
              onPressed: (int index) {
                // The button that is tapped is set to true, and the others to false.
                for (int i = 0; i < controller.selecteOrder.length; i++) {
                  controller.selecteOrder[i] = i == index;
                  controller.firstOne.sort((a, b) => a.absoluteMagnitudeH.toString().compareTo(b.absoluteMagnitudeH.toString()),);
                }

              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.blue[700],
              selectedColor: Colors.white,
              fillColor: Colors.blue[200],
              color: Colors.blue[400],
              isSelected: controller.selecteOrder,
              children: controller.order,
            ),
            Obx(() => controller.visible.value
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.firstOne.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 20.0,
                              ),
                            ],
                          ),
                          child: Card(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(controller.firstOne[index].name!),
                                      Text(controller
                                          .firstOne[index]
                                          .closeApproachData![0]
                                          .closeApproachDate
                                          .toString())
                                    ],
                                  ),
                                  Text(controller
                                      .firstOne[index].absoluteMagnitudeH
                                      .toString())
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container()),
          ],
        ),
      ),
    );
  }
}
