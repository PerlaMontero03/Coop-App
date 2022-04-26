import 'package:flutter/material.dart';
import 'package:proyecto_final/models/resumen_model.dart';
import 'package:proyecto_final/navigation_tools/menu_lateral.dart';

class Cuentas extends StatelessWidget {
  const Cuentas({Key? key}) : super(key: key);

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
            itemBuilder: (BuildContext context, int index){

              return Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(resumen.cuentas[index]["tipo"],
                              style: const TextStyle(
                                fontSize: 20, 
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 43, 134, 46)
                              )
                            ),
                          ),
                          Text('No. de Cuenta: '+resumen.cuentas[index]["idcuenta"],
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
                          const Text('Balance Disponible:',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                            )
                          ),
                          Text('DOP | '+ resumen.cuentas[index]['balance_disponible'],
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
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
                          const Text('Monto Último Depósito:',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          Text('DOP | '+ resumen.cuentas[index]['monto_ult_deposito'],
                            style: const TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
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
                          const Text('Monto Último Retiro:',
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                          Text('DOP | '+ resumen.cuentas[index]['monto_ult_retiro'],
                            style: const TextStyle(
                              fontSize: 19,
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