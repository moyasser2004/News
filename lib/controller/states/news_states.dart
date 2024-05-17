abstract class NewsStates {}

class newsInitialStatus extends NewsStates {}

class businessSuccess extends NewsStates {}

class sinceSuccess extends NewsStates {}

class sportsSuccess extends NewsStates {}

class searchSuccess extends NewsStates {}

class sinceFail extends NewsStates {
  final String error;
  sinceFail(this.error);
}

class businessFail extends NewsStates {
  final String error;
  businessFail(this.error);
}

class sportsFail extends NewsStates {
  final String error;
  sportsFail(this.error);
}

class searchFail extends NewsStates {
  final String error;
  searchFail(this.error);
}

class businessLoading extends NewsStates {}

class sinceLoading extends NewsStates {}

class sportsLoading extends NewsStates {}

class searchLoading extends NewsStates {}

class bottomNavigationBar extends NewsStates {}

class IsDark extends NewsStates {}
