import 'package:flutter/material.dart';

class DetallesDescuentos extends StatelessWidget {
  
  final mes;
  List<dynamic> detalles = [];
  List<dynamic> detalles2 = [];

  DetallesDescuentos(this.mes,this.detalles);

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
        title: Text(mes),
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

          // Card(
          //   child: Column(
          //     children: [
          //       Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Expanded(
          //                   child: Text('Año:',
          //                     style: const TextStyle(
          //                       fontSize: 23,
          //                       fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 ),
                  
          //                 const SizedBox(width: 20),
                  
          //                 Text(detalles2['ano'].toString(), 
          //                   style: const TextStyle(
          //                     fontSize: 23,
          //                     fontWeight: FontWeight.bold,
          //                     color: const Color.fromARGB(255, 43, 134, 46)
          //                   ),
          //                 )
          //               ],
          //             ),
          //     ],
          //   ),
          // )
        
          ListView.builder(
            padding: const EdgeInsets.only(top: 30),
            shrinkWrap: true,
            itemCount: detalles2.length,
            itemBuilder: (BuildContext context, int index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text('Mes:',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  
                          const SizedBox(width: 20),
                  
                          Text(detalles2[index]['mes_str'].toString(), 
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color:  Color.fromARGB(255, 43, 134, 46)
                            ),
                          )
                        ],
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text('Año:',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  
                          const SizedBox(width: 20),
                  
                          Text(detalles2[index]['ano'].toString(), 
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color:  Color.fromARGB(255, 43, 134, 46)
                            ),
                          )
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text('Descripción:',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  
                          const SizedBox(width: 20),
                  
                          Text(detalles2[index]['descripcion'].toString(), 
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color:  Color.fromARGB(255, 43, 134, 46)
                            ),
                          )
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text('Monto:',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  
                          const SizedBox(width: 20),
                  
                          Text('DOP | '+detalles2[index]['monto'].toString(), 
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color:  Color.fromARGB(255, 43, 134, 46)
                            ),
                          )
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text('Fecha de Aplicación:',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                  
                          const SizedBox(width: 20),
                  
                          Text(detalles2[index]['fecha_aplicacion'].toString(), 
                            style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color:  Color.fromARGB(255, 43, 134, 46)
                            ),
                          )
                        ],
                      ),

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