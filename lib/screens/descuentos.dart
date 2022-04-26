import 'package:flutter/material.dart';
import 'package:proyecto_final/models/descuentos_model.dart';
import 'package:proyecto_final/navigation_tools/menu_lateral.dart';
import 'package:proyecto_final/screens/detalles_descuentos.dart';

class Descuentos extends StatefulWidget {
  const Descuentos({Key? key}) : super(key: key);

  @override
  State<Descuentos> createState() => _Descuentos();
}

class _Descuentos extends State<Descuentos> {

  DescuentosModel descuentos = DescuentosModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu_outlined,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
              color: Colors.black,
              icon: const Icon(Icons.search),
              onPressed: () {
                
              }),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(35),
        children:  [
          const ListTile(
            leading: Icon(Icons.calculate_outlined, color: Color.fromARGB(255, 43, 134, 46), size: 40,),
            title: Text('Descuentos', 
              style: TextStyle(
                color: Color.fromARGB(255, 43, 134, 46),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            shrinkWrap: true,
            itemCount: descuentos.descuentos.length,
            itemBuilder: (BuildContext context, int index){

              return Card(
                elevation: 4.0,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(descuentos.descuentos[index]["mes_str"] ?? "¿?",
                        style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold)
                      ),
                      trailing: const Icon(Icons.read_more_outlined),
                      onTap: () {
                        // print(listaSolicitudes.solicitudes[index]["datos"]);
                        Navigator.push(
                        context, 
                         MaterialPageRoute(
                          builder: (context) => DetallesDescuentos(
                            descuentos.descuentos[index]["mes_str"],
                            descuentos.descuentos[index]["det"],
                          )
                        ));
                      }
                    )
                  ],
                ),
              );

            }
          )
        ],
      ),
  
      drawer: const MenuL(),
  
  
  
    );
  } 
}
