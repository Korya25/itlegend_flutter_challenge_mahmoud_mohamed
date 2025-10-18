import 'package:itlegend_flutter_challenge/features/plans_selected/data/models/plan_model.dart';

enum PlansStatus { initial, loading, success, error }

class PlansState {
  final PlansStatus status;
  final List<PlanModel> plans;
  final String? error;

  const PlansState({required this.status, this.plans = const [], this.error});

  factory PlansState.initial() => const PlansState(status: PlansStatus.initial);

  PlansState copyWith({
    PlansStatus? status,
    List<PlanModel>? plans,
    String? error,
  }) {
    return PlansState(
      status: status ?? this.status,
      plans: plans ?? this.plans,
      error: error ?? this.error,
    );
  }
}
