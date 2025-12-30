import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catalog Screen',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF0D6EFD),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar Producto...',
                prefixIcon: Icon(Icons.search_sharp),
                filled: true,
                fillColor: Color(0xFFF2F2F2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintStyle: GoogleFonts.roboto(),
              ),
            ),
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 32,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8),
              children: [
                //Aca llamo al metodo de las cartas
                _card('Todo', true, 54, 32),
                _card('Accesorios', false, 92, 32),
                _card('Motor', false, 60, 32),
                _card('Llantas', false, 69, 32),
                _card('Suspensión', false, 74, 32),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.70,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

//Se crea esta funcion de tipo widget para crear las cartas de categorias
Widget _card(String text, bool chosen, double width, double height) {
  return Padding(
    padding: EdgeInsets.only(right: 8),
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: chosen ? Color(0xFF0D6EFD) : Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          text,
          softWrap: false, // 👈 NO ajusta
          maxLines: 1, // 👈 una sola línea
          overflow: TextOverflow.fade,
          style: GoogleFonts.roboto(
            color: chosen ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}

//Se crea una clase producto para manejar los productos del catalogo
class Product {
  final String name;
  final String price;

  Product(this.name, this.price);
}

//Se crea una lista de productos de ejemplo
final products = [
  Product('Filtro aire Chevrolet Spark', '92.000'),
  Product('Pastillas freno Mazda 3', '140.000'),
  Product('Llanta Hankook 215-55 R17', '420.000'),
  Product('Aceite Motul 5W40', '65.000'),
  Product('Amortiguador delantero Renault Logan', '310.000'),
  Product('Batería MAC SilverPlus', '395.000'),
];

//Se crea el widget de la tarjeta de producto, para reutilizar cada una de las tarjetas en el gridview
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 272,
      width: 173,
      // padding: EdgeInsets.fromLTRB(12, 12, 12, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEDEDED)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Imagen
          Container(
            height: 119,
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
            child: Center(child: Icon(Icons.inventory_2_outlined, size: 50)),
          ),

          const SizedBox(height: 8),

          /// Nombre
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 8),

                /// Precio
                Text(
                  '\$${product.price}',
                  style: GoogleFonts.roboto(
                    color: Color(0xFF0066FF),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),

          /// Botón
          Center(
            child: SizedBox(
              width: 149,
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0066FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Agregar',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
