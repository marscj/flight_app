import 'package:equatable/equatable.dart';
import 'package:saadiyat/apis/client.dart';

class SupportState extends Equatable {
  /// notify change state without deep clone state
  final int version;

  final List<Comment> list;

  SupportState({this.version, this.list});

  factory SupportState.initial() => SupportState(version: 0, list: []);

  SupportState copyWith({int version, List<Comment> list}) =>
      SupportState(version: this.version + 1, list: list ?? this.list);

  @override
  List<Object> get props => [version, list];
}
