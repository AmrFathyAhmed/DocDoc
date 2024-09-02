
import '../../../../../core/theming/colors.dart';
import 'recommendation_doctor_search.dart';
import 'package:flutter/material.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar(
      {super.key, this.onTap, this.onChanged, this.controller});
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RecommendationDoctorSearch(
            onChanged: onChanged,
            controller: controller,
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: onTap,
          child: const Icon(
            Icons.filter_list_rounded,
            color: AppColors.black2,
          ),
        ),
      ],
    );
  }
}

void openModalSheet(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30.0),
      ),
    ),
    builder: (context) {
      return Container();
    },
  );
}
