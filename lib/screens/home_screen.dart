import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRadioListTile(
                ref: ref,
                title: 'Name',
                value: ProductSortType.name,
              ),
              _buildRadioListTile(
                ref: ref,
                title: 'Price',
                value: ProductSortType.price,
              ),
              _buildRadioListTile(
                ref: ref,
                title: 'CreatedAt',
                value: ProductSortType.createdAt,
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 30),
          _buildCard(ref: ref),
        ],
      ),
    );
  }

  Widget _buildRadioListTile({
    required WidgetRef ref,
    required String title,
    required ProductSortType value,
  }) {
    return RadioListTile<ProductSortType>(
      title: Text(title),
      value: value,
      groupValue: ref.watch(productSortTypeProvider),
      onChanged: (value) =>
          ref.read(productSortTypeProvider.notifier).state = value!,
    );
  }

  Widget _buildCard({required WidgetRef ref}) {
    final products = ref.watch(productsProvider);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          child: ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
          ),
        );
      },
    );
  }
}
