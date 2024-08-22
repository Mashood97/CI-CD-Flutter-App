# flutter_ci_cd

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:space_x_project/features/rockets/domain/entities/launch_entity.dart';
import 'package:space_x_project/features/rockets/domain/entities/rocket_entity.dart';
import 'package:space_x_project/features/rockets/presentation/manager/launch/launch_list_bloc.dart';
import 'package:space_x_project/model/pagination_request_entity.dart';

import '../../../../core/test_helper.mocks.dart';

void main() {
  late MockFetchLaunchesUseCase mockFetchLaunchesUseCase;
  late MockRocketRepository mockRocketRepository;

  late LaunchListBloc bloc;

  const PaginationRequestEntity entity = PaginationRequestEntity(
    limit: 2,
    offset: 0,
  );
  setUp(() {
    mockFetchLaunchesUseCase = MockFetchLaunchesUseCase();
    mockRocketRepository = MockRocketRepository();
    bloc = LaunchListBloc(fetchLaunchesUseCase: mockFetchLaunchesUseCase);

    when(mockRocketRepository.fetchLaunches(rocketRequestEntity: entity))
        .thenAnswer(
      (_) async => const Right(
        [
          LaunchEntity(
              launchDetails: "Test Launch Detais",
              launchId: "Launch_ID_1",
              missionName: "Test Mission 1",
              missionId: ["Mission-ID-1"],
              launchYear: "2024",
              launchEventLinksEntity:
                  LaunchEventLinksEntity(wikipediaUrl: "www.google.com"),
              launchDate: "2024-03-25T10:30:00+12:00",
              isUpcomingLaunch: false,
              launchRocketEntity:
                  LaunchRocketEntity(rocketEntity: RocketEntity())),
          LaunchEntity(
            launchDetails: "Test Launch Details 2",
            launchId: "Launch_ID_2",
            missionName: "Test Mission 2",
            missionId: ["Mission-ID-2"],
            launchYear: "2024",
            launchEventLinksEntity:
                LaunchEventLinksEntity(wikipediaUrl: "www.google.com"),
            launchDate: "2024-06-25T10:30:00+12:00",
            isUpcomingLaunch: false,
            launchRocketEntity: LaunchRocketEntity(
              rocketEntity: RocketEntity(),
            ),
          ),
        ],
      ),
    );

    // Stub the fetchLaunches method
    when(
      mockFetchLaunchesUseCase.call(
        argThat(
          isA<PaginationRequestEntity>().having(
            (p) => p.limit,
            'limit',
            10,
          ),
        ),
      ),
    ).thenAnswer(
      (_) async => const Right(
        [
          LaunchEntity(
              launchDetails: "Test Launch Detais",
              launchId: "Launch_ID_1",
              missionName: "Test Mission 1",
              missionId: ["Mission-ID-1"],
              launchYear: "2024",
              launchEventLinksEntity:
                  LaunchEventLinksEntity(wikipediaUrl: "www.google.com"),
              launchDate: "2024-03-25T10:30:00+12:00",
              isUpcomingLaunch: false,
              launchRocketEntity:
                  LaunchRocketEntity(rocketEntity: RocketEntity())),
          LaunchEntity(
            launchDetails: "Test Launch Details 2",
            launchId: "Launch_ID_2",
            missionName: "Test Mission 2",
            missionId: ["Mission-ID-2"],
            launchYear: "2024",
            launchEventLinksEntity:
                LaunchEventLinksEntity(wikipediaUrl: "www.google.com"),
            launchDate: "2024-06-25T10:30:00+12:00",
            isUpcomingLaunch: false,
            launchRocketEntity: LaunchRocketEntity(
              rocketEntity: RocketEntity(),
            ),
          ),
        ],
      ),
    );
  });

  tearDown(() {
    bloc.close();
  });

  const List<LaunchEntity> launches = [
    LaunchEntity(
        launchDetails: "Test Launch Detais",
        launchId: "Launch_ID_1",
        missionName: "Test Mission 1",
        missionId: ["Mission-ID-1"],
        launchYear: "2024",
        launchEventLinksEntity:
            LaunchEventLinksEntity(wikipediaUrl: "www.google.com"),
        launchDate: "2024-03-25T10:30:00+12:00",
        isUpcomingLaunch: false,
        launchRocketEntity: LaunchRocketEntity(rocketEntity: RocketEntity())),
    LaunchEntity(
      launchDetails: "Test Launch Details 2",
      launchId: "Launch_ID_2",
      missionName: "Test Mission 2",
      missionId: ["Mission-ID-2"],
      launchYear: "2024",
      launchEventLinksEntity:
          LaunchEventLinksEntity(wikipediaUrl: "www.google.com"),
      launchDate: "2024-06-25T10:30:00+12:00",
      isUpcomingLaunch: false,
      launchRocketEntity: LaunchRocketEntity(
        rocketEntity: RocketEntity(),
      ),
    ),
  ];
  test("initial state is empty", () {
    expect(
      bloc.state,
      const LaunchListInitial(
        launches: [],
        hasReachedMax: false,
      ),
    );
  });

  blocTest<LaunchListBloc, LaunchListState>(
    'emits [Loading, Loaded] when fetchLaunches is successful',
    build: () => bloc,
    act: (bloc) {
      return bloc.add(const FetchLaunchesEvent(launchRequestEntity: entity));
    },
    expect: () => const [
      LaunchListLoading(launches: [], hasReachedMax: false),
      LaunchListLoaded(launches: launches, hasReachedMax: false),
    ],
    verify: (_) {
      verify(mockFetchLaunchesUseCase.call(entity)).called(1);
    },
  );
}



