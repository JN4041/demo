import 'package:flutter/material.dart';

class DCode extends StatefulWidget {
  const DCode({Key? key}) : super(key: key);

  @override
  State<DCode> createState() => _DCodeState();
}

class _DCodeState extends State<DCode> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List<detial> elist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 53,
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
                hintText: "Enter email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: password,
            onChanged: (value) {},
            decoration: InputDecoration(
                hintText: "Enter serch",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
          ),
          ElevatedButton(
              onPressed: () {
                String name = email.text;
                setState(() {
                  elist.add(detial(edetial: name));
                });
              },
              child: Text("Submit")),
          Expanded(
            child: ListView.builder(
              itemCount: elist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(elist[index].edetial),
                  trailing: InkWell(
                    onTap: () {
                      setState(() {
                        elist.removeAt(index);
                      });
                    },
                    child: const Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class detial {
  String edetial;
  detial({required this.edetial});
}

// 4.serch

// import 'package:flutter/material.dart';
//
// class SearchScreens extends StatefulWidget {
//   const SearchScreens({Key? key}) : super(key: key);
//
//   @override
//   State<SearchScreens> createState() => _SearchScreensState();
// }
//
// class _SearchScreensState extends State<SearchScreens> {
//   TextEditingController email = TextEditingController();
//   List<String> itemcoun = [];
//   List<String> items = [
//     "cam",
//     "ram",
//     "jaydip",
//     "kit",
//     "vial",
//     "product",
//     "pineal" "sale",
//     "disant"
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 55,
//           ),
//           TextField(
//             controller: email,
//             onChanged: (value) {
//               setState(() {
//                 itemcoun = items
//                     .where((element) =>
//                     element.toLowerCase().contains(value.toLowerCase()))
//                     .toList();
//               });
//             },
//             decoration: InputDecoration(
//                 hintText: "Email",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 )),
//           ),
//           Expanded(
//               child: email.text.isNotEmpty && itemcoun.isEmpty
//                   ? Center(child: Text("Not found"))
//                   : ListView.builder(
//                 itemCount: email.text.isNotEmpty
//                     ? itemcoun.length
//                     : items.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                       title: Text(email.text.isNotEmpty
//                           ? itemcoun[index]
//                           : items[index]));
//                 },
//               ))
//         ],
//       ),
//     );
//   }
// }
