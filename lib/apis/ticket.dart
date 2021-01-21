part of 'client.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: must_be_immutable

@JsonSerializable()
class Ticket extends Equatable {
  int id;
  String serial_no;
  String air_line;
  String air_info;
  String air_class;
  double fare;
  double tax;
  double total;
  String remark;
  bool is_confirm;
  bool is_cancel;
  bool is_booking;
  bool is_complete;
  String date;
  Itinerary itinerary;
  int parent;
  List<Ticket> children;
  List<Comment> comments;
  List<Message> messages;
  List<Upload> uploads;

  Ticket get last => children.length > 0 ? children[children.length - 1] : this;

  static Ticket fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);
  Map<String, dynamic> toJson() => _$TicketToJson(this);

  @override
  List<Object> get props => [
        id,
        serial_no,
        air_line,
        air_info,
        air_class,
        fare,
        tax,
        total,
        remark,
        is_confirm,
        is_cancel,
        is_booking,
        is_complete,
        date,
        comments,
        uploads,
        itinerary,
        children,
        parent
      ];

  Color get color => is_confirm == null
      ? Colors.red
      : !is_confirm
          ? Colors.red
          : is_cancel
              ? Colors.grey
              : is_complete
                  ? Colors.green
                  : Colors.orange;

  String get status_text => is_confirm == null
      ? 'Unconfirmed'
      : !is_confirm
          ? 'Refusal'
          : is_cancel
              ? 'Canceled'
              : is_complete
                  ? 'Completed'
                  : 'Confirmed';
}

@JsonSerializable()
class TicketList extends Equatable {
  int totalCount;
  int pageNo;
  List<Ticket> data;

  static TicketList fromJson(Map<String, dynamic> json) =>
      _$TicketListFromJson(json);
  Map<String, dynamic> toJson() => _$TicketListToJson(this);

  @override
  List<Object> get props => [totalCount, pageNo, data];
}

@JsonSerializable()
class TicketExtra extends Equatable {
  Ticket data;
  Map<String, dynamic> extra;

  static TicketExtra fromJson(Map<String, dynamic> json) =>
      _$TicketExtraFromJson(json);
  Map<String, dynamic> toJson() => _$TicketExtraToJson(this);

  @override
  List<Object> get props => [data, extra];
}

@JsonSerializable()
class TicketListExtra extends Equatable {
  TicketList data;
  Map<String, dynamic> extra;

  static TicketListExtra fromJson(Map<String, dynamic> json) =>
      _$TicketListExtraFromJson(json);
  Map<String, dynamic> toJson() => _$TicketListExtraToJson(this);

  @override
  List<Object> get props => [data, extra];
}
