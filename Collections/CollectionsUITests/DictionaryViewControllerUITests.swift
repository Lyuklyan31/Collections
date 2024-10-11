import XCTest
@testable import Collections

// MARK: - DictionaryViewControllerUITests
class DictionaryViewControllerUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    func testNavigationToDictionaryViewController() {
        let app = XCUIApplication()
        app.launch()

        // MARK: - Verify Navigation
        verifyNavigationBarExists(app: app)
        navigateToDictionaryCell(app: app)
        
        // MARK: - Verify Collection View
        let collectionView = verifyCollectionViewExists(app: app)

        // MARK: - Verify Loading Indicator
        verifyLoadingIndicatorIsNotVisible(app: app)
        
        // MARK: - Verify Collection Content
        verifyCollectionContainsItems(collectionView: collectionView)

        // MARK: - Interact with Cells
        interactWithCellsInCollectionView(collectionView: collectionView)
    }

    // MARK: - Navigation Verification Methods
    private func verifyNavigationBarExists(app: XCUIApplication) {
        XCTAssertTrue(app.navigationBars["Collections"].exists)
    }

    private func navigateToDictionaryCell(app: XCUIApplication) {
        let dictionaryCell = app.tables.cells.staticTexts["Dictionary"]
        XCTAssertTrue(dictionaryCell.exists)
        dictionaryCell.tap()
        
        sleep(6) // Consider replacing with a wait for better performance
    }

    // MARK: - Collection View Verification Methods
    private func verifyCollectionViewExists(app: XCUIApplication) -> XCUIElement {
        let collectionView = app.collectionViews.firstMatch
        XCTAssertTrue(collectionView.exists)
        return collectionView
    }

    private func verifyLoadingIndicatorIsNotVisible(app: XCUIApplication) {
        let loadingIndicator = app.activityIndicators.firstMatch
        XCTAssertFalse(loadingIndicator.exists)
    }

    private func verifyCollectionContainsItems(collectionView: XCUIElement) {
        let cells = collectionView.cells
        XCTAssertTrue(cells.count > 0, "Collection does not contain items")
    }

    // MARK: - Cell Interaction Methods
    private func interactWithCellsInCollectionView(collectionView: XCUIElement) {
        let cells = collectionView.cells

        for index in 0..<cells.count {
            let cell = cells.element(boundBy: index)
            XCTAssertTrue(cell.exists, "Cell \(index) does not exist")
            cell.tap()

            sleep(1)

            verifyResultLabelAppears(for: cell, atIndex: index)
        }
    }

    private func verifyResultLabelAppears(for cell: XCUIElement, atIndex index: Int) {
        let resultLabel = cell.staticTexts.firstMatch
        XCTAssertTrue(resultLabel.exists, "Result did not appear after tapping cell \(index)")
        
        let resultText = resultLabel.label
        XCTAssertFalse(resultText.isEmpty, "Result text should not be empty for cell \(index)")
    }
}
