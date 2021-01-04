import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';

class BtaState extends Equatable {
  final List<Upload> list;

  BtaState({this.list});

  factory BtaState.initial() => BtaState(list: List<Upload>());

  BtaState copyWith({List<Upload> list}) => BtaState(list: list ?? this.list);

  @override
  List<Object> get props => [
        list,
      ];
}
