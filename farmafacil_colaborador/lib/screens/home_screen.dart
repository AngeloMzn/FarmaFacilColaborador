import 'package:farmafacil_colaborador/components/product_list_item.dart';
import 'package:farmafacil_colaborador/database/product_operations.dart';
import 'package:farmafacil_colaborador/models/product.dart';
import 'package:farmafacil_colaborador/screens/product_details_screen.dart';
import 'package:farmafacil_colaborador/theme/application_colors.dart';
import 'package:farmafacil_colaborador/utils/navigate.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Overview",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "Resumo de métricas importantes",
                        style: TextStyle(
                          fontSize: 18,
                          color: ApplicationColors.secondaryText,
                        ),
                      ),
                      Divider(
                        color: ApplicationColors.primaryBackground,
                        thickness: 2,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.tune_rounded,
                                  color: ApplicationColors.icon2,
                                  size: 40,
                                ),
                                Text(
                                  "Total semanal",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ApplicationColors.primaryText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_chart_sharp,
                                  color: ApplicationColors.icon2,
                                  size: 40,
                                ),
                                Text(
                                  "Tipo",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ApplicationColors.primaryText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: ApplicationColors.primaryBackground,
                        thickness: 2,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total de vendas",
                                  style: TextStyle(
                                    color: ApplicationColors.primaryText,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "20",
                                  style: TextStyle(
                                    color: ApplicationColors.secondaryText,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lucro",
                                  style: TextStyle(
                                    color: ApplicationColors.primaryText,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  "R\$ 2.000",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  "Mais vendidos",
                  style: TextStyle(
                    fontSize: 18,
                    color: ApplicationColors.secondaryText,
                    height: 1,
                  ),
                ),
              ),
              FutureBuilder(
                future: ProductOperations().getAll(),
                builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                  if (snapshot.hasData) {
                    List<Product>? produtos = snapshot.data;

                    if (produtos == null || produtos.length == 0) {
                      return Column(
                        children: [
                          Icon(
                            Icons.sentiment_dissatisfied,
                            color: ApplicationColors.primary,
                          ),
                          Text("Não há produtos."),
                        ],
                      );
                    } else {
                      return ListView.builder(
                        itemCount: produtos.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return ProductListItem(
                            product: produtos[index],
                            onTap: () {
                              Navigate.to(
                                context,
                                ProductDetailsScreen(
                                  product: produtos[index],
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                  }
                  return CircularProgressIndicator();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  "Últimos adicionados",
                  style: TextStyle(
                    fontSize: 18,
                    color: ApplicationColors.secondaryText,
                    height: 1,
                  ),
                ),
              ),
              FutureBuilder(
                future: ProductOperations().getLastTwo(),
                builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                  if (snapshot.hasData) {
                    List<Product>? produtos = snapshot.data;

                    if (produtos == null || produtos.length == 0) {
                      return Column(
                        children: [
                          Icon(
                            Icons.sentiment_dissatisfied,
                            color: ApplicationColors.primary,
                          ),
                          Text("Não há produtos."),
                        ],
                      );
                    } else {
                      return ListView.builder(
                        itemCount: produtos.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return ProductListItem(
                            product: produtos[index],
                            onTap: () {
                              Navigate.to(
                                context,
                                ProductDetailsScreen(
                                  product: produtos[index],
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                  }
                  return CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
