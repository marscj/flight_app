import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saadiyat/index/index.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({
    Key key,
    @required IndexBloc indexBloc,
  })  : _indexBloc = indexBloc,
        super(key: key);

  final IndexBloc _indexBloc;

  @override
  IndexScreenState createState() {
    return IndexScreenState();
  }
}

class IndexScreenState extends State<IndexScreen> {
  IndexScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, IndexState>(
        cubit: widget._indexBloc,
        builder: (
          BuildContext context,
          IndexState currentState,
        ) {
          if (currentState is UnIndexState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void _load([bool isError = false]) {
    widget._indexBloc.add(LoadIndexEvent(isError));
  }
}
