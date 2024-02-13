import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../Util/app_colors.dart';
import '../../../model/allahname.dart';
import '../controllers/allah_name_controller.dart';

class AllahNameView extends GetView<AllahNameController> {
  const AllahNameView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('আল্লাহ নাম '),
          centerTitle: true,
        ),
        body: Container(
            margin: const EdgeInsets.all(20),
            child: FutureBuilder<List<Allahname>>(
                future: controller.getName(),
                builder: (context, data) {
                  if (data.hasData) {
                    List<Allahname> allahname = data.data!;
                    return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: allahname.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 25.h,
                            width: 25.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.secondaryColor,
                            ),
                            alignment: Alignment.center,
                            child: Column( 
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                Text(allahname[index].arbi!,style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: "arbi"
                                
                                ),),
                                Text(allahname[index].bangla!,style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                
                                ),)
                              ],
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })));
  }
}
