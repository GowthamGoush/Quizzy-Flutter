class PointsModel {
  int _points = 0;

  void updatePoints() => _points++;

  void resetPoints() => _points = 0;

  int get points => _points;
}
