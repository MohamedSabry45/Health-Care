import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gp/features/archive/data/datasource/archive_datasource.dart';
import 'package:gp/features/archive/data/datasource/archive_datasource_imp.dart';
import 'package:gp/features/archive/data/repository/archive_repo_imp.dart';
import 'package:gp/features/archive/domain/repository/archive_repository.dart';
import 'package:gp/features/archive/domain/usecases/add_diseases_usecase.dart';
import 'package:gp/features/archive/domain/usecases/get_diseases_usecase.dart';
import 'package:gp/features/archive/domain/usecases/update_disease_usecase.dart';
import 'package:gp/features/archive/presentation/cubit/archive_cubit.dart';
import 'package:gp/features/auth/data/datasources/auth_datasource.dart';
import 'package:gp/features/auth/data/datasources/auth_datasource_impl.dart';
import 'package:gp/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:gp/features/auth/domain/repositories/auth_repository.dart';
import 'package:gp/features/auth/domain/usecases/forget_use_case.dart';
import 'package:gp/features/auth/domain/usecases/login_use_case.dart';
import 'package:gp/features/auth/domain/usecases/register_use_case.dart';
import 'package:gp/features/auth/presentation/cubit/cubit/auth_cubit.dart';
import 'package:gp/features/diagnosis/data/datasource/diag_datasource.dart';
import 'package:gp/features/diagnosis/data/datasource/diag_datasource_impl.dart';
import 'package:gp/features/diagnosis/data/repository/diagnosis_repo_imp.dart';
import 'package:gp/features/diagnosis/domain/repository/diagnosis_repository.dart';
import 'package:gp/features/diagnosis/domain/usecaase/get_diagnosis_usecase.dart';
import 'package:gp/features/diagnosis/domain/usecaase/predict_use_case.dart';
import 'package:gp/features/diagnosis/presentstion/cubit/diagnosis_cubit.dart';
import 'package:gp/features/reports/data/datasources/report_datasource.dart';
import 'package:gp/features/reports/data/datasources/report_datasource_imp.dart';
import 'package:gp/features/reports/data/repositories/report_repo_imp.dart';
import 'package:gp/features/reports/domain/repositories/report_repo.dart';
import 'package:gp/features/reports/domain/usecases/delete_report_use_case.dart';
import 'package:gp/features/reports/domain/usecases/get_dataPDF_usecase.dart';
import 'package:gp/features/reports/domain/usecases/get_reports_use_case.dart';
import 'package:gp/features/reports/domain/usecases/upload_use_case.dart';
import 'package:gp/features/reports/presentation/cubit/reports_cubit.dart';
import 'package:gp/features/user/data/datasources/user_data_source.dart';
import 'package:gp/features/user/data/datasources/user_data_source_impl.dart';
import 'package:gp/features/user/data/repositories/user_repository_imp.dart';
import 'package:gp/features/user/domain/repositories/user_repo.dart';
import 'package:gp/features/user/domain/usecases/get_user_data_usecase.dart';
import 'package:gp/features/user/domain/usecases/update_pass_usecase.dart';
import 'package:gp/features/user/domain/usecases/update_profile_usecase.dart';
import 'package:gp/features/user/domain/usecases/upload_profile_image.dart';
import 'package:gp/features/user/presentation/cubit/user_cubit.dart'; // ignore: depend_on_referenced_packages, implementation_imports

final List<Bind<Object>> modularBinds = <Bind<Object>>[
  // Bind.singleton((i) => HomeStore()),
  //third Packages
  Bind.singleton<FirebaseAuth>((i) => FirebaseAuth.instance),
  Bind.singleton<FirebaseFirestore>((i) => FirebaseFirestore.instance),
  Bind.singleton<FirebaseStorage>((i) => FirebaseStorage.instance),
  //DataSources
  Bind.singleton<UserDataSource>(
      (i) => UserDataSourceImpl(Modular.get<FirebaseAuth>(), Modular.get<FirebaseFirestore>(), Modular.get<FirebaseStorage>())),
  Bind.singleton<DiagnosisDataSource>((i) => DiagDataSourceImp()),
  Bind.singleton<AuthDataSource>((i) => AuthDataSourceImpl(Modular.get<FirebaseAuth>())),
  Bind.singleton<ArchiveDataSource>(
      (i) => ArchiveDataSourceImp(Modular.get<FirebaseFirestore>(), Modular.get<FirebaseAuth>())),
  Bind.singleton<ReportDataSource>((i) => ReportDataSourceImp(
      Modular.get<FirebaseStorage>(), Modular.get<FirebaseAuth>(), Modular.get<FirebaseFirestore>())),
  //Repositories
  Bind.singleton<UserRepositroy>((i) => UserRepositroyImpl(Modular.get<UserDataSource>())),
  Bind.singleton<DiagnosisRepository>((i) => DiagnosisRepositoryImp(Modular.get<DiagnosisDataSource>())),
  Bind.singleton<AuthRepository>((i) => AuthRepositoryImpl(Modular.get<AuthDataSource>())),
  Bind.singleton<ArchiveRepository>((i) => ArchiveRepositoryImp(Modular.get<ArchiveDataSource>())),
  Bind.singleton<ReportRepository>((i) => ReportRepositoryImp(reportDataSource: Modular.get<ReportDataSource>())),
  //Use Cases
  Bind.singleton<UpdatePasswordUseCase>((i) => UpdatePasswordUseCase(Modular.get<UserRepositroy>())),
  Bind.singleton<GetProifleUseCase>((i) => GetProifleUseCase(Modular.get<UserRepositroy>())),
  Bind.singleton<UploadProfileImage>((i) => UploadProfileImage(Modular.get<UserRepositroy>())),
  Bind.singleton<UpdateProfileUsecase>((i) => UpdateProfileUsecase(Modular.get<UserRepositroy>())),
  Bind.singleton<LoginUseCase>((i) => LoginUseCase(Modular.get<AuthRepository>())),
  Bind.singleton<RegisterUseCase>((i) => RegisterUseCase(Modular.get<AuthRepository>())),
  Bind.singleton<ForgetUseCase>((i) => ForgetUseCase(Modular.get<AuthRepository>())),
  Bind.singleton<GetDiagnosisUseCase>((i) => GetDiagnosisUseCase(Modular.get<DiagnosisRepository>())),
  Bind.singleton<PredictUseCase>((i) => PredictUseCase(Modular.get<DiagnosisRepository>())),
  Bind.singleton<AddDiseaseArchiveUseCase>((i) => AddDiseaseArchiveUseCase(Modular.get<ArchiveRepository>())),
  Bind.singleton<GetDiseasesUsecase>((i) => GetDiseasesUsecase(Modular.get<ArchiveRepository>())),
  Bind.singleton<UpdateDiseaseUsecase>(
      (i) => UpdateDiseaseUsecase(archiveRepository: Modular.get<ArchiveRepository>())),
  Bind.singleton<UploadUseCase>((i) => UploadUseCase(reportRepository: Modular.get<ReportRepository>())),
  Bind.singleton<GetReportsUseCase>((i) => GetReportsUseCase(reportRepository: Modular.get<ReportRepository>())),
  Bind.singleton<DeleteReportUseCase>((i) => DeleteReportUseCase(reportRepository: Modular.get<ReportRepository>())),
  Bind.singleton<GetPDFUseCase>((i) => GetPDFUseCase(repository: Modular.get<ReportRepository>())),
  //State Managment
  Bind.singleton(
      (i) => AuthCubit(Modular.get<LoginUseCase>(), Modular.get<RegisterUseCase>(), Modular.get<ForgetUseCase>())),
  Bind.singleton((i) => DiagnosisCubit(Modular.get<GetDiagnosisUseCase>(), Modular.get<PredictUseCase>())),
  Bind.singleton<UserCubit>((i) => UserCubit(
        Modular.get<UpdatePasswordUseCase>(),
        Modular.get<UpdateProfileUsecase>(),
        Modular.get<GetProifleUseCase>(),
        Modular.get<UploadProfileImage>(),
      )),
  Bind.singleton<ArchiveCubit>(
    (i) => ArchiveCubit(
      Modular.get<AddDiseaseArchiveUseCase>(),
      Modular.get<GetDiseasesUsecase>(),
      Modular.get<UpdateDiseaseUsecase>(),
    ),
  ),
  Bind.singleton<ReportsCubit>(
    (i) => ReportsCubit(
      Modular.get<UploadUseCase>(),
      Modular.get<GetReportsUseCase>(),
      Modular.get<DeleteReportUseCase>(),
      Modular.get<GetPDFUseCase>(),
    ),
  )
];
