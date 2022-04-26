import 'package:flutter/material.dart';
import 'package:proyecto_final/models/noticias_model.dart';
import 'package:proyecto_final/navigation_tools/menu_lateral.dart';
import 'package:proyecto_final/screens/detalles_noticias.dart';

class ListaNoticias extends StatefulWidget {
  const ListaNoticias({Key? key}) : super(key: key);

  @override
  State<ListaNoticias> createState() => _ListaNoticias();
}

class _ListaNoticias extends State<ListaNoticias> {
 
  NoticiasModel noticiasModel = NoticiasModel();
 
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
            leading: Icon(Icons.newspaper_outlined, color: Color.fromARGB(255, 43, 134, 46), size: 40,),
            title: Text('Noticias', 
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
            itemCount: noticiasModel.noticias.length,
            itemBuilder: (BuildContext context, int index){

              return Card(
                elevation: 4.0,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(noticiasModel.noticias[index]["date"],
                            style: const TextStyle(
                              fontSize: 19,
                              fontStyle: FontStyle.italic
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Image.network(noticiasModel.noticias[index]["imagen"],
                            width: 200,
                            height: 200,
                          ),
                        ),

                        Expanded(
                          child: ListTile(
                              title: Text(noticiasModel.noticias[index]["title"] ?? "¿?",
                                style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold)
                              ),
                              
                              trailing: const Icon(Icons.read_more_outlined),        
                              onTap: () {
                              // print(listaSolicitudes.solicitudes[index]["datos"]);
                              Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => DetallesNoticia(
                                  noticiasModel.noticias[index]["title"],
                                  noticiasModel.noticias[index]['content'],
                                  noticiasModel.noticias[index]['imagen'],
                                )
                              ));
                            }
                          ),
                        )
      
                      ],
                    ),
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