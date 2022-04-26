import 'package:flutter/material.dart';
import 'package:proyecto_final/models/resumen_model.dart';
import 'package:proyecto_final/models/user_data_model.dart';
import 'package:proyecto_final/navigation_tools/menu_lateral.dart';

class Resumen2 extends StatelessWidget {
  const Resumen2({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData user = UserData();
    ResumenModel resumen = ResumenModel(); 

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
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

            actions: [
              IconButton(
                color: const Color.fromARGB(255, 43, 134, 46),
                icon: const Icon(Icons.notifications_outlined,
                  size: 35,
                ),
                onPressed: () {}),
              ],

              expandedHeight: 400.0,
              floating: true,
              pinned: true,
              snap: true,
              flexibleSpace: FlexibleSpaceBar(
                title: ListTile(
                  title: Row(
                children: [
                  const Text('Hola ', 
                    style: TextStyle(
                      color: Colors.blue, 
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ), 
                  ),
                  Text(user.nombre, 
                    style: const TextStyle(
                      color:Color.fromARGB(255, 43, 134, 46),
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              
              subtitle: Text('Última conexión: '+ resumen.ultimaConexion),
                ),

                background: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Image.asset(
                          'assets/foto2.png',
                          fit: BoxFit.cover,
                    )),
                  ],
                ),
              ),
            ),
          ];
        },

        body: ListView(
        padding: const EdgeInsets.all(40),
        children: [
          const SizedBox(height: 30),

          const ListTile(
            leading: Icon(Icons.savings_outlined, color: Color.fromARGB(255, 43, 134, 46), size: 40,),
            title: Text('Cuentas', 
              style: TextStyle(
                color: Color.fromARGB(255, 43, 134, 46),
                fontSize: 30,
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
                fontSize: 30,
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
      ),
    ),
        drawer: const MenuL(),
      ),
    );
  }
  
}