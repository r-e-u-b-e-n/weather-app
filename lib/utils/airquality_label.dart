String getAirQualityLabel(int index) {
  switch (index) {
    case 1:
      return '$index-Good';
    case 2:
      return '$index-Moderate';
    case 3:
      return '$index-Low Health Risk';
    case 4:
      return '$index-Unhealthy';
    case 5:
      return '$index-Very Unhealthy';
    case 6:
      return '$index-Hazardous';
    default:
      return '$index-Moderate';
  }
}
