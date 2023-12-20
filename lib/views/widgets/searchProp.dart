import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// class SearchPopUpWidget extends StatelessWidget {
//   final SubCategoryModel item;
//   final bool isSelected;
//
//   const SearchPopUpWidget({
//     required this.item,
//     required this.isSelected,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: !isSelected
//           ? null
//           : BoxDecoration(
//         border: Border.all(color: Theme.of(context).primaryColor),
//         borderRadius: BorderRadius.circular(5),
//         color: Colors.white,
//       ),
//       child: Container(
//         decoration: const BoxDecoration(
//           border: Border(
//             bottom: BorderSide(
//               color: Colors.grey,
//               width: 1.0,
//             ),
//           ),
//         ),
//         child: ListTile(
//           selected: isSelected,
//           title: Text(
//             item.sub_category_name != null
//                 ? item.sub_category_name.toString()
//                 : item.sub_sub_category_name!,
//           ),
//         ),
//       ),
//     );
//   }
// }