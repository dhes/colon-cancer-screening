function expectOK(testCase) {
  return true;
}

function expectCards(testCase) {
  if (testCase.expected != null) {
    return testCase.expected.ColorectalCancerScreeningRecommendation != null;
  }
}

function expectCardsContent(testCase) {
  if (expectCards(testCase)) {
    return {
      summary: 'Screening for Colorectal Cancer',
      indicator: 'info',
      detail: testCase.expected.ColorectalCancerScreeningRecommendation,
      source: {
        label: 'USPSTF Colorectal cancer screening',
        url: 'https://www.uspreventiveservicestaskforce.org/uspstf/recommendation/colorectal-cancer-screening'
      }
    };
  }
}

module.exports = { expectOK, expectCards, expectCardsContent };