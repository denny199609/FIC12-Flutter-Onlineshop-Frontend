import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/spaces.dart';
import '../bloc/history_order/history_order_bloc.dart';
import '../models/transaction_model.dart';
import '../widgets/order_card.dart';

class HistoryOrderPage extends StatefulWidget {
  const HistoryOrderPage({super.key});

  @override
  State<HistoryOrderPage> createState() => _HistoryOrderPageState();
}

class _HistoryOrderPageState extends State<HistoryOrderPage> {
  @override
  void initState() {
    context.read<HistoryOrderBloc>().add(const HistoryOrderEvent.getHistoryOrder());
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final List<TransactionModel> transactions = [
      TransactionModel(
        noResi: 'QQNSU346JK',
        status: 'Dikirim',
        quantity: 2,
        price: 1900000,
      ),
      TransactionModel(
        noResi: 'SDG1345KJD',
        status: 'Sukses',
        quantity: 2,
        price: 900000,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan'),
      ),
      body: BlocBuilder<HistoryOrderBloc, HistoryOrderState>(
        builder: (context, state) {
          return state.maybeWhen(
              orElse: () => const Center(child: Text('No Data...')),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (history) {
                if (history.data!.isEmpty) {
                  return const Center(child: Text('No Data...'));
                } else {
                  return ListView.separated(
                    padding: const EdgeInsets.all(16.0),
                    separatorBuilder: (context, index) =>
                        const SpaceHeight(16.0),
                    itemCount: history.data!.length,
                    itemBuilder: (context, index) => OrderCard(
                      data: history.data![index],
                    ),
                  );
                }
              });
        },
      ),
    );
  }
}
