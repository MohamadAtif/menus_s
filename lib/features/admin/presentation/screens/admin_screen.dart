// import 'package:flutter/material.dart';
// import 'package:menus_shibeen/features/admin/presentation/screens/addPlaceScreen.dart';
// import 'package:menus_shibeen/features/admin/presentation/screens/posts_screen.dart';
// import 'package:menus_shibeen/utils/global_variables.dart';

// class AdminScreen extends StatefulWidget {
//   const AdminScreen({Key? key}) : super(key: key);

//   @override
//   State<AdminScreen> createState() => _AdminScreenState();
// }

// class _AdminScreenState extends State<AdminScreen> {
//   int _page = 0;
//   double bottomBarWidth = 42;
//   double bottomBarBorderWidth = 5;

//   List<Widget> pages = [
//     const PostsScreen(),
//     const AddPlaceScreen(),
//   ];

//   void updatePage(int page) {
//     setState(() {
//       _page = page;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(50),
//         child: AppBar(
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: GlobalVariables.appBarAdmin,
//             ),
//           ),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                   alignment: Alignment.topLeft,
//                   child: const Text(
//                     'DIAMART',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Kanit',
//                         fontWeight: FontWeight.bold),
//                   )),
//               const Text(
//                 'ADMIN',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: 'Kanit',
//                   fontWeight: FontWeight.bold,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       body: pages[_page],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _page,
//         selectedItemColor: GlobalVariables.selectedNavBarColor,
//         unselectedItemColor: GlobalVariables.unselectedNavBarColor,
//         backgroundColor: GlobalVariables.backgroundColor,
//         iconSize: 28,
//         onTap: updatePage,
//         items: [
//           // POSTS
//           BottomNavigationBarItem(
//             icon: Container(
//               width: bottomBarWidth,
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: BorderSide(
//                     color: _page == 0
//                         ? GlobalVariables.selectedNavBarColor
//                         : GlobalVariables.backgroundColor,
//                     width: bottomBarBorderWidth,
//                   ),
//                 ),
//               ),
//               child: const Icon(
//                 Icons.home_outlined,
//               ),
//             ),
//             label: '',
//           ),

//           // ORDERS
//           BottomNavigationBarItem(
//             icon: Container(
//               width: bottomBarWidth,
//               decoration: BoxDecoration(
//                 border: Border(
//                   top: BorderSide(
//                     color: _page == 1
//                         ? GlobalVariables.selectedNavBarColor
//                         : GlobalVariables.backgroundColor,
//                     width: bottomBarBorderWidth,
//                   ),
//                 ),
//               ),
//               child: const Icon(
//                 Icons.inbox,
//               ),
//             ),
//             label: '',
//           ),
//         ],
//       ),
//     );
//   }
// }
