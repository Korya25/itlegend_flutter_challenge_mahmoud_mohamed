import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/controller/plans_cubit.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/controller/plans_state.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/contact_with_support.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_card.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_next_button.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/widgets/plans_view_header.dart';

class PlansView extends StatelessWidget {
  const PlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const PlansNextButton(),
      body: BlocBuilder<PlansCubit, PlansState>(
        builder: (context, state) {
          if (state.status == PlansStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.status == PlansStatus.error) {
            return Center(child: Text('Error: ${state.error}'));
          }
          final plans = state.plans;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 30),
                      PlansViewHeader(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                SliverList.builder(
                  itemCount: plans.length,
                  itemBuilder: (context, index) {
                    final plan = plans[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: PlansCard(plan: plan),
                    );
                  },
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: const ContactWithSupport(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
