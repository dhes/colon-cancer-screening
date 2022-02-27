function expectOK(testCase) {
  return true;
}

function expectCards(testCase) {
  if (testCase.expected != null) {
    return testCase.expected.Recommendation != null;
  }
}

function expectCardsContent(testCase) {
  if (expectCards(testCase)) {
    return {
      summary: 'My CDS Hook Summary',
      indicator: 'info',
      detail: testCase.expected.Recommendation,
      source: {
        label: 'My CDS Source',
        url: 'https://www.example.org/my-cds-source'
      }
    };
  }
}

module.exports = { expectOK, expectCards, expectCardsContent };