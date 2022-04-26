import 'package:flutter/material.dart';
import 'package:proyecto_final/models/resumen_model.dart';
import 'package:proyecto_final/navigation_tools/menu_lateral.dart';

class Prestamos extends StatelessWidget {
  const Prestamos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ResumenModel resumen = ResumenModel();

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
        elevation: 0.0
      ),

      
      body: ListView(
        padding: const EdgeInsets.all(35),
        children:  [
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
            itemBuilder: (BuildContext context, int index){

              return Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(resumen.prestamos[index]["descripcion"],
                              style: const TextStyle(
                                fontSize: 20, 
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 43, 134, 46)
                              )
                            ),
                          ),
                          Text('ID Préstamo: '+resumen.prestamos[index]["idprestamo"],
                            style: const TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            )
                          ),
                        ],
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Monto Préstamo:',
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                          Text('DOP | '+ resumen.prestamos[index]['monto_prestamo'],
                            style: const TextStyle(
                              fontSize: 20,
                            )
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Tasa de Interés:',
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                          Text(resumen.prestamos[index]['tasa_interes'],
                            style: const TextStyle(
                              fontSize: 20,
                            )
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Fecha Préstamo:',
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                          Text(resumen.prestamos[index]['fecha_prestamo'],
                            style: const TextStyle(
                              fontSize: 20,
                            )
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Plazo:',
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                          Text(resumen.prestamos[index]['plazo'],
                            style: const TextStyle(
                              fontSize: 20,
                            )
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child:  Text('Fecha de Vencimiento:',
                              style: TextStyle(
                                fontSize: 20,
                              )
                            ),
                          ),
                          Text(resumen.prestamos[index]['fecha_vencimiento'],
                            style: const TextStyle(
                              fontSize: 20,
                            )
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Monto Seguro Pagado:',
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                          Text('DOP | '+ resumen.prestamos[index]['monto_seguro_pagado'],
                            style: const TextStyle(
                              fontSize: 20,
                            )
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Fecha Último Cálculo:   ',
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                          Expanded(
                            child: Text(' '+resumen.prestamos[index]['fecha_ultimo_calculo'],
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Monto Interés Calculado:',
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                          Text('DOP | '+ resumen.prestamos[index]['monto_interes_calculado'],
                            style: const TextStyle(
                              fontSize: 20,
                            )
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Valor Por Cuota:',
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                          Text('DOP | '+ resumen.prestamos[index]['valor_cuota'],
                            style: const TextStyle(
                              fontSize: 20,
                            )
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Consecutivo Cuota:',
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                          Text(resumen.prestamos[index]['consecutivo_cuota'],
                            style: const TextStyle(
                              fontSize: 20,
                            )
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Balance Préstamo:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          Text('DOP | '+ resumen.prestamos[index]['balance_prestamo'],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ],
                      ),
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