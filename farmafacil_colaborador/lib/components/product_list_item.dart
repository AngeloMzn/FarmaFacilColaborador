import 'package:farmafacil_colaborador/models/product.dart';
import 'package:farmafacil_colaborador/theme/application_colors.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  final void Function() onTap;
  const ProductListItem({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text("imagem"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          color: ApplicationColors.primaryText,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        product.category,
                        style: TextStyle(
                          color: ApplicationColors.primaryText,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.edit,
                  size: 30,
                  color: ApplicationColors.icon2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
