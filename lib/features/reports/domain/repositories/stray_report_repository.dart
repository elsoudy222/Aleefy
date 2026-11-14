import '../entities/stray_report.dart';

/// Clean Architecture Rule #2:
/// The Repository Contract (Interface).
/// 
/// Why do we write this abstract class?
/// This is the "Contract" that decouples the UI & Cubit from the actual data source.
/// The UI only knows about this abstract class.
/// 
/// Today: Implementation = MockStrayReportRepositoryImpl (local fake data with delay)
/// Tomorrow: Implementation = RemoteStrayReportRepositoryImpl (calls Python FastAPI)
/// -> ZERO changes in the UI or Cubit!
abstract class StrayReportRepository {
  /// Fetches a list of stray animal reports with optional filtering.
  Future<List<StrayReport>> getReports({
    String? animalType,
    String? condition,
  });

  /// Fetches details of a single report by its ID.
  Future<StrayReport> getReportById(String id);

  /// Toggles like/save status for a report.
  Future<StrayReport> toggleLike(String reportId);

  /// Submits a new stray report.
  Future<void> submitReport(StrayReport report);
}
