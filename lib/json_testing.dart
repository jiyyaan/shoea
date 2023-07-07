import 'package:flutter/material.dart';
import 'package:shoea/utils/helping_functions.dart';
import 'package:shoea/update_color.dart';

class JsonTesting extends StatefulWidget {
  const JsonTesting({Key? key}) : super(key: key);

  @override
  State<JsonTesting> createState() => _JsonTestingState();
}

class _JsonTestingState extends State<JsonTesting> {
  late String colorId;
  var fetchColors;
  final colorNameController = TextEditingController();
  final colorCodeController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchColors = Functions.fetchColors();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CRUD operation',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Center(
                    child: Text(
                      'Add Colors in List',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: (width / 2),
                      height: 40,
                      child: TextField(
                        controller: colorNameController,
                        decoration: const InputDecoration(
                          hintText: 'Color Name',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: (width / 2),
                      height: 40,
                      child: TextField(
                        controller: colorCodeController,
                        decoration: const InputDecoration(
                          hintText: 'Color Code',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () async{
                      var colorName = colorNameController.text;
                      var colorCode = colorCodeController.text;
                      final bool response = await Functions.insertColor(colorName, colorCode);
                      if(response == true){
                        setState(() {
                          fetchColors = Functions.fetchColors();
                          colorNameController.text = "";
                          colorCodeController.text = "";
                        });
                      }
                    },
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      color: Colors.black,
                      child: const Center(
                          child: Text(
                        'Add Color',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    'List Starts from here',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: fetchColors,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  return ListView.builder(
                      itemCount: Functions.listColors.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ListTile(
                            title: Text(
                              Functions.listColors[i].color,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: Container(
                              color: Color(int.parse(
                                  "0xff${Functions.listColors[i].colorCode}")),
                              width: 40,
                              height: 40,
                            ),
                            subtitle: Text(
                              Functions.listColors[i].colorCode,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        colorId = Functions.listColors[i].colorId;
                                        Functions.deleteColor(colorId);
                                        Functions.listColors.removeAt(i);
                                      });
                                    },
                                    child: const Icon(Icons.delete)),
                                GestureDetector(
                                    onTap: () async{
                                      final String update = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            var colorId =
                                                Functions.listColors[i].colorId;
                                            var name =
                                                Functions.listColors[i].color;
                                            var code = Functions
                                                .listColors[i].colorCode;
                                            return UpdateColor(
                                                color: name,
                                                code: code,
                                                colorId: colorId);
                                          },
                                        ),
                                      );
                                      setState(() {
                                        colorId =
                                            Functions.listColors[i].colorId;
                                        if(update=="update") {
                                          setState(() {
                                            fetchColors = Functions.fetchColors();
                                          });
                                        }
                                      });
                                    },
                                    child: const Icon(Icons.edit)),
                              ],
                            ),
                            tileColor: Colors.white54,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
