import 'package:bloc/bloc.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/data/data/repo/plans_repository.dart';
import 'package:itlegend_flutter_challenge/features/plans_selected/presentation/controller/plans_state.dart';

class PlansCubit extends Cubit<PlansState> {
  final PlansRepository repository;

  PlansCubit(this.repository) : super(PlansState.initial());

  Future<void> getPlans() async {
    if (state.status == PlansStatus.loading) return;
    emit(state.copyWith(status: PlansStatus.loading));
    try {
      final plans = await repository.getAllPlans();
      emit(state.copyWith(status: PlansStatus.success, plans: plans));
    } catch (e) {
      emit(state.copyWith(status: PlansStatus.error, error: e.toString()));
    }
  }
}
