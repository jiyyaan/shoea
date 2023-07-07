import 'package:flutter/material.dart';
import 'package:shoea/utils/helping_functions.dart';
class UpdateColor extends StatefulWidget {
  const UpdateColor({Key? key, required this.color, required this.code, required this.colorId}) : super(key: key);
  final String colorId, color, code;

  @override
  State<UpdateColor> createState() => _UpdateColorState();
}

class _UpdateColorState extends State<UpdateColor> {

  final colorCon = TextEditingController();
  final codeCon = TextEditingController();
  var color_id;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color_id = widget.colorId;
    print('${widget.colorId} ${widget.color} - ${widget.code}');
    colorCon.text = widget.color;
    codeCon.text = widget.code;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Color", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           TextField(
             controller: colorCon,
             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
           ),
           TextField(
             controller: codeCon,
             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
           ),
          GestureDetector(
            onTap: (){
              Functions.updateColor(color_id, colorCon.text, codeCon.text);
              Navigator.pop(context,"update");
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                height: 40,
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Center(
                  child: Text(
                    'UPDATE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
