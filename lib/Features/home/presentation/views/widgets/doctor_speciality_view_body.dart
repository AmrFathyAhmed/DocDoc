
import 'package:doc_doc/Features/home/presentation/views/widgets/speciality_all_doctors.dart';

import '../../../../../core/costant/specialityList.dart';
import 'doctor_speciality_item.dart';
import 'package:flutter/material.dart';

class DoctorSpecialityViewBody extends StatelessWidget {
  const DoctorSpecialityViewBody({super.key});

  @override
  Widget build(BuildContext context) {

      return GridView.builder(
                padding: const EdgeInsetsDirectional.only(
                  top: 42,
                  start: 30,
                  end: 30,
                  bottom: 20,
                ),
                itemCount: 10,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 32,
                  crossAxisSpacing: 36,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {

                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SpecialityAllDoctors(index: index+1,sName: specialityList[index].name,) ,));
                    },
                    child: DoctorSpecialityItem(

                      index: index,
                    ),
                  );
                },
      );
  }
}
