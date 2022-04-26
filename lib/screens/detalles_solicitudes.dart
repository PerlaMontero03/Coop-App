import 'dart:ui';

import 'package:flutter/material.dart';

class DetallesSolicitudes extends StatelessWidget {
  
  final nombre_solicitud;
  List<dynamic> detalles = [];
  List<dynamic> detalles2 = [];

  DetallesSolicitudes(this.nombre_solicitud,this.detalles);

  void verDetalles(){
    for (int i = 0; i < detalles.length; i++)
    {
      detalles2.add(detalles[i]);
      
    }
  }

  @override
  Widget build(BuildContext context) {

    verDetalles();
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre_solicitud),
        backgroundColor: Colors.transparent,
      ),

      body: ListView(
        padding: const EdgeInsets.all(35),
        children:  [
          const ListTile(
            leading: Icon(Icons.notes_outlined, color: Color.fromARGB(255, 43, 134, 46), size: 40,),
            title: Text('Detalles', 
              style: TextStyle(
                color: Color.fromARGB(255, 43, 134, 46),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        
          ListView.builder(
            padding: const EdgeInsets.only(top: 30),
            shrinkWrap: true,
            itemCount: detalles2.length,
            itemBuilder: (BuildContext context, int index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(detalles2[index][0].toString(),
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(width: 20),

                      Text(detalles2[index][1].toString(), 
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 43, 134, 46)
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          )
        ],
      )
    );
  }
}