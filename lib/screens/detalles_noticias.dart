import 'package:flutter/material.dart';

class DetallesNoticia extends StatelessWidget {
  
  final titulo_noticia;
  final contenido_noticia;
  final image_noticia;

  const DetallesNoticia(this.titulo_noticia,this.contenido_noticia, this.image_noticia);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(titulo_noticia),
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

          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    child: Image.network(image_noticia)
                  ),

                  const SizedBox(height: 20),
                  
                  Text(titulo_noticia,
                    style: const TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(contenido_noticia,
                    style: const TextStyle(
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
            ),
          )
        
          // ListView.builder(
          //   padding: const EdgeInsets.only(top: 30),
          //   shrinkWrap: true,
          //   itemCount: detalles.length,
          //   itemBuilder: (BuildContext context, int index){
          //     return Card(
          //       child: Padding(
          //         padding: const EdgeInsets.all(20),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Expanded(
          //               child: Text(detalles[index]['title'],
          //                 style: TextStyle(
          //                   fontSize: 23,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),

          //             SizedBox(width: 20),

          //             Text(detalles[index]['content'],
          //               style: TextStyle(
          //                 fontSize: 23,
          //                 fontWeight: FontWeight.bold,
          //                 color: Color.fromARGB(255, 43, 134, 46)
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     );
          //   }
          // )
        ],
      )
    );
  }
}