import 'package:flaconi_case_study/core/common_models/api_result_model.dart';
import 'package:flaconi_case_study/core/common_models/error_model.dart';
import 'package:flaconi_case_study/core/exceptions/generic_exception.dart';
import 'package:flaconi_case_study/core/exceptions/server_exception.dart';
import 'package:flaconi_case_study/core/utils/connectivity/network_info.dart';
import 'package:flaconi_case_study/modules/weather_information/data/data_source/weather_remote_data_source.dart';
import 'package:flaconi_case_study/modules/weather_information/data/model/weather_response_model.dart';
import 'package:flaconi_case_study/modules/weather_information/domain/entity/weather_information_entity.dart';
import 'package:flaconi_case_study/modules/weather_information/domain/repository/weather_information_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: WeatherInformationRepository)
class WeatherInformationRepositoryImpl implements WeatherInformationRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const WeatherInformationRepositoryImpl(
      this.remoteDataSource, this.networkInfo);

  @override
  Future<ApiResultModel<WeatherInformationEntity>> getCurrentWeatherByCity(
      String name) async {
    final bool isDeviceConnected = await networkInfo.isConnected;
    if (isDeviceConnected) {
      try {
        final WeatherResponseModel result =
            await remoteDataSource.getCurrentWeatherByCity(name);
        final WeatherInformationEntity weatherInformationEntity =
            result.mapToEntity();
        return Success(weatherInformationEntity);
      } on ServerException catch (serverException) {
        return Failure(
          ErrorModel(message: serverException.info),
        );
      } on GenericException catch (serverException) {
        return Failure(
          ErrorModel(
            message: serverException.message,
            statusCode: serverException.statusCode,
          ),
        );
      } catch (e) {
        return Failure(ErrorModel());
      }
    } else {
      return Failure(ErrorModel());
    }
  }
}
