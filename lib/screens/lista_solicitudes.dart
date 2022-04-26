import 'package:flutter/material.dart';
import 'package:proyecto_final/models/lista_solicitudes_model.dart';
import 'package:proyecto_final/navigation_tools/menu_lateral.dart';
import 'package:proyecto_final/screens/detalles_solicitudes.dart';

class ListaSolicitudes extends StatefulWidget {
  const ListaSolicitudes({Key? key}) : super(key: key);

  @override
  State<ListaSolicitudes> createState() => _ListaSolicitudesState();
}

class _ListaSolicitudesState extends State<ListaSolicitudes> {
 
  ListaSolicitudesModel listaSolicitudes = ListaSolicitudesModel();
 
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
                color: Color.fromARGB(255, 43, 134, 46),
                size: 40
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(35),
        children:  [
          const ListTile(
            leading: Icon(Icons.view_list_outlined, color: Color.fromARGB(255, 43, 134, 46), size: 40,),
            title: Text('Solicitudes', 
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
            itemCount: listaSolicitudes.solicitudes.length,
            itemBuilder: (BuildContext context, int index){

              return Card(
                elevation: 4.0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(listaSolicitudes.solicitudes[index]["codigo"],
                            style: const TextStyle(fontSize: 19)
                          ),
                          Text(listaSolicitudes.solicitudes[index]["fecha"],
                            style: const TextStyle(fontSize: 19)
                          ),
                        ],
                      ),
                    ),

                    ListTile(
                      title: Text(listaSolicitudes.solicitudes[index]["nombre"] ?? "¿?",
                        style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold)
                      ),
                      trailing: const Icon(Icons.read_more_outlined),
                      subtitle: Text(listaSolicitudes.solicitudes[index]["estado"],
                        style: const TextStyle(fontSize: 19)
                      ),
                      onTap: () {
                        // print(listaSolicitudes.solicitudes[index]["datos"]);
                        Navigator.push(
                        context, 
                         MaterialPageRoute(
                          builder: (context) => DetallesSolicitudes(
                            listaSolicitudes.solicitudes[index]["nombre"],
                            listaSolicitudes.solicitudes[index]["datos"],
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
