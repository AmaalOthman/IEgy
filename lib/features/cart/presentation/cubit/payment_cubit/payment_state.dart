abstract class PaymentState {}

final class PaymentInitial extends PaymentState {}
final class MoveAPhaseState extends PaymentState {}
final class ShowLocationsState extends PaymentState {}
final class ShowServiceTypesState extends PaymentState {}
