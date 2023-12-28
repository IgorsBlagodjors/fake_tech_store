import 'package:fake_tech_store/domain/electronics_class.dart';

abstract class ElectronicsRepository {
  Future<List<Electronics>> getAllElectronics(String category, int offset);
}