import 'package:farmafacil_colaborador/models/product.dart';
import 'package:farmafacil_colaborador/theme/application_colors.dart';
import 'package:farmafacil_colaborador/utils/navigate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigate.goBack(context);
          },
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.edit),
        ),
        type: ExpandableFabType.up,
        distance: 60,
        overlayStyle: ExpandableFabOverlayStyle(
          color: Colors.white.withOpacity(0.9),
        ),
        childrenOffset: Offset(-3, 0),
        children: [
          Row(
            children: [
              Text('Editar produto'),
              FloatingActionButton.small(
                heroTag: null,
                onPressed: null,
                child: Icon(Icons.edit),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text('Excluir produto'),
              ),
              FloatingActionButton.small(
                heroTag: null,
                onPressed: null,
                child: Icon(Icons.delete_forever),
              ),
            ],
          ),
        ],
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                      ),
                    ),
                    child: Center(
                      child: Text("Imagem"),
                    ),
                  ),
                ),
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  "Em estoque: ${product.quantity}",
                  style: TextStyle(
                    fontSize: 20,
                    color: ApplicationColors.secondaryText,
                  ),
                ),
                Text(
                  "R\$ ${product.initialPrice}",
                  style: TextStyle(
                    fontSize: 24,
                    color: ApplicationColors.primaryText,
                  ),
                ),
                Text(product.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
