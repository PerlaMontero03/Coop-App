// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:proyecto_final/models/resumen_model.dart';
import 'package:proyecto_final/navigation_tools/menu_lateral.dart';

class Resumen extends StatefulWidget {
  const Resumen({Key? key}) : super(key: key);

  @override
  State<Resumen> createState() => _ResumenState();
}

class _ResumenState extends State<Resumen> {

  ResumenModel resumen = ResumenModel();

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
        actions: [
          IconButton(
              color: const Color.fromARGB(255, 43, 134, 46),
              icon: const Icon(Icons.notifications_outlined,
                size: 35,
              ),
              onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(35),
        children: [
          const ListTile(
            leading: Icon(Icons.savings_outlined, color: Color.fromARGB(255, 43, 134, 46), size: 40,),
            title: Text('Cuentas', 
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
            itemCount: resumen.cuentas.length,
            itemBuilder: (BuildContext context, int index) { 
              return Column(
                children:  [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(resumen.cuentas[index]["tipo"],
                              style: const TextStyle(
                                color: Color.fromARGB(255, 43, 134, 46),
                                fontSize: 17,
                              ),
                            ),
                            Text(resumen.cuentas[index]["idcuenta"],
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Balance Disponible',
                              style: TextStyle(
                                color: Color.fromARGB(255, 122, 122, 122),
                                fontSize: 16,
                              ),
                            ),
                            Text('DOP | '+resumen.cuentas[index]["balance_disponible"],
                              style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  )
                ]),

                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color:  Color.fromARGB(255, 43, 134, 46),
                    width: 1.5,
                  ))
                ),
              ),
              
              const SizedBox(height: 35,),
            ],
          );
          },
            
          ),

          /////////////////////////////////////////////////////////////////
          
          const ListTile(
            leading: Icon(Icons.monetization_on_outlined, color: Color.fromARGB(255, 43, 134, 46), size: 40,),
            title: Text('Préstamos', 
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
            itemCount: resumen.prestamos.length,
            itemBuilder: (BuildContext context, int index) { 
              return Column(
                children:  [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(resumen.prestamos[index]["descripcion"],
                              style: const TextStyle(
                                color: Color.fromARGB(255, 43, 134, 46),
                                fontSize: 17,
                              ),
                            ),
                            Text(resumen.prestamos[index]["idprestamo"],
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('Balance Disponible',
                              style: TextStyle(
                                color: Color.fromARGB(255, 122, 122, 122),
                                fontSize: 16,
                              ),
                            ),
                            Text('DOP | '+resumen.prestamos[index]["balance_prestamo"],
                              style: const TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  )
                ]),

                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color:  Color.fromARGB(255, 43, 134, 46),
                    width: 2,
                  ))
                ),
              ),
              
              const SizedBox(height: 35,),
            ],
          );
          },
            
          ),
        ],
      ),

      drawer: const MenuL(),
    );
  } 
}