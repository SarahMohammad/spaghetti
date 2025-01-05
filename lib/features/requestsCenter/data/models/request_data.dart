class RequestData {
  final String categoryTitle;
  final String title;
  final String date;
  final RequestState state;

  RequestData({
    required this.categoryTitle,
    required this.title,
    required this.date,
    required this.state,
  });
}
class RequestState {
  final String status;
  final String? requestId;
  final String? pendingOn;
  final String? statusTime;

  RequestState({
    required this.status,
    this.requestId,
    this.pendingOn,
    this.statusTime
  });
}