import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:database/database.dart';
import 'package:flutter/material.dart';
import 'package:keg_line/keg_line.dart';
import 'package:line_one/line_one.dart';
import 'package:line_two/line_two.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:routing/routing.dart';

List<SingleChildWidget> buildProviders(
  SembastDatabase sembastDatabase,
  SharedPreferencesService sharedPreferencesService,
) {
  return <SingleChildWidget>[
    ...buildCoreProviders(sembastDatabase, sharedPreferencesService),
    ...buildAppRouterProviders(),
    ...buildKegLineProviders(),
    ...buildLineOneProviders(),
    ...buildLineTwoProviders(),
  ];
}

List<SingleChildWidget> buildCoreProviders(
  SembastDatabase sembastDatabase,
  SharedPreferencesService sharedPreferencesService,
) {
  return <SingleChildWidget>[
    Provider<SembastDatabase>.value(value: sembastDatabase),
    Provider<SharedPreferencesService>.value(value: sharedPreferencesService),
  ];
}

List<SingleChildWidget> buildAppRouterProviders() {
  return <SingleChildWidget>[
    Provider<AppRouter>(
      create: (BuildContext context) => AppRouter(),
    ),
  ];
}

List<SingleChildWidget> buildKegLineProviders() {
  return <SingleChildWidget>[
    Provider<KegLineDatabaseService>(
      create: (BuildContext context) => KegLineDatabaseService(
        sembastDatabase: Provider.of<SembastDatabase>(context, listen: false),
      ),
    ),
    Provider<KegLineMapper>(create: (_) => KegLineMapper()),
    Provider<LineRepository<KegLineEntity>>(
      create: (BuildContext context) => KegLineRepositoryImpl(
        kegLineDatabaseService: Provider.of<KegLineDatabaseService>(
          context,
          listen: false,
        ),
        kegLineMapper: Provider.of<KegLineMapper>(context, listen: false),
      ),
    ),
    Provider<InsertKegLine>(
      create: (BuildContext context) => InsertKegLine(
        kegLineRepository: Provider.of<LineRepository<KegLineEntity>>(
          context,
          listen: false,
        ),
      ),
    ),
    Provider<GetAllKegLines>(
      create: (BuildContext context) => GetAllKegLines(
        kegLineRepository: Provider.of<LineRepository<KegLineEntity>>(
          context,
          listen: false,
        ),
      ),
    ),
    Provider<DeleteKegLine>(
      create: (BuildContext context) => DeleteKegLine(
        kegLineRepository: Provider.of<LineRepository<KegLineEntity>>(
          context,
          listen: false,
        ),
      ),
    ),
    Provider<UpdateKegLine>(
      create: (BuildContext context) => UpdateKegLine(
        kegLineRepository: Provider.of<LineRepository<KegLineEntity>>(
          context,
          listen: false,
        ),
      ),
    ),
  ];
}

List<SingleChildWidget> buildLineOneProviders() {
  return <SingleChildWidget>[
    Provider<LineOneDatabaseService>(
      create: (BuildContext context) => LineOneDatabaseService(
        sembastDatabase: Provider.of<SembastDatabase>(context, listen: false),
      ),
    ),
    Provider<LineOneMapper>(create: (_) => LineOneMapper()),
    Provider<LineRepository<LineOneEntity>>(
      create: (BuildContext context) => LineOneRepositoryImpl(
        lineOneDatabaseService: Provider.of<LineOneDatabaseService>(
          context,
          listen: false,
        ),
        lineOneMapper: Provider.of<LineOneMapper>(context, listen: false),
      ),
    ),
    Provider<InsertLineOne>(
      create: (BuildContext context) => InsertLineOne(
        lineOneRepository: Provider.of<LineRepository<LineOneEntity>>(
          context,
          listen: false,
        ),
      ),
    ),
    Provider<GetAllLineOnes>(
      create: (BuildContext context) => GetAllLineOnes(
        lineOneRepository: Provider.of<LineRepository<LineOneEntity>>(
          context,
          listen: false,
        ),
      ),
    ),
    Provider<DeleteLineOne>(
      create: (BuildContext context) => DeleteLineOne(
        lineOneRepository: Provider.of<LineRepository<LineOneEntity>>(
          context,
          listen: false,
        ),
      ),
    ),
    Provider<UpdateLineOne>(
      create: (BuildContext context) => UpdateLineOne(
        lineOneRepository: Provider.of<LineRepository<LineOneEntity>>(
          context,
          listen: false,
        ),
      ),
    ),
  ];
}

List<SingleChildWidget> buildLineTwoProviders() {
  return <SingleChildWidget>[
    Provider<LineTwoDatabaseService>(
      create: (BuildContext context) => LineTwoDatabaseService(
        sembastDatabase: Provider.of<SembastDatabase>(context, listen: false),
      ),
    ),
    Provider<LineTwoMapper>(create: (_) => LineTwoMapper()),
    Provider<LineRepository<LineTwoEntity>>(
      create: (BuildContext context) => LineTwoRepositoryImpl(
        lineTwoDatabaseService: Provider.of<LineTwoDatabaseService>(
          context,
          listen: false,
        ),
        lineTwoMapper: Provider.of<LineTwoMapper>(context, listen: false),
      ),
    ),
    Provider<InsertLineTwo>(
      create: (BuildContext context) => InsertLineTwo(
        lineTwoRepository: Provider.of<LineRepository<LineTwoEntity>>(
          context,
          listen: false,
        ),
      ),
    ),
    Provider<GetAllLineTwos>(
      create: (BuildContext context) => GetAllLineTwos(
        lineTwoRepository: Provider.of<LineRepository<LineTwoEntity>>(
          context,
          listen: false,
        ),
      ),
    ),
    Provider<DeleteLineTwo>(
      create: (BuildContext context) => DeleteLineTwo(
        lineTwoRepository: Provider.of<LineRepository<LineTwoEntity>>(
          context,
          listen: false,
        ),
      ),
    ),
    Provider<UpdateLineTwo>(
      create: (BuildContext context) => UpdateLineTwo(
        lineTwoRepository: Provider.of<LineRepository<LineTwoEntity>>(
          context,
          listen: false,
        ),
      ),
    ),
  ];
}
