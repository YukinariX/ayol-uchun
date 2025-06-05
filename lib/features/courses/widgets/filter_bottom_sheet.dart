import 'package:ayol_uchun/common/widgets/app_button.dart';
import 'package:ayol_uchun/data/models/categories/categories_model.dart';
import 'package:ayol_uchun/features/home/blocs/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'category_filter_item.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key, required this.categories});

  final List<CategoriesModel> categories;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  int? selectedId; // Move this here

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      height: 450.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "FILTER",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Text("Kategoriyalar"),
          SizedBox(height: 10),
          Expanded(
            // To make ListView work inside Column
            child: ListView.builder(
              itemCount: widget.categories.length,
              itemBuilder: (context, index) {
                final category = widget.categories[index];
                final isSelected = selectedId == category.id;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedId = category.id;
                    });
                  },
                  child: CategoryFilterItem(
                    title: category.title,
                    image: category.icon,
                    courses: category.totalCourses,
                    isSelected: isSelected,
                  ),
                );
              },
            ),
          ),
          AppButton(
            callback: () {
              context.pop(HomeLoad(categoryId: selectedId));
            },
            title: "Tasdiqlash",
          ),
        ],
      ),
    );
  }
}
