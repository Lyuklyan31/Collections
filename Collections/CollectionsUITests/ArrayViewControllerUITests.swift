import XCTest
@testable import Collections

// MARK: - ArrayViewControllerUITests
class ArrayViewControllerUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    func testNavigationToArrayViewController() {
        let app = XCUIApplication()
        app.launch()

        // MARK: - Verify Navigation
        verifyNavigationBarExists(app: app)
        navigateToArrayCell(app: app)

        // MARK: - Verify Collection View
        let collectionView = verifyCollectionViewExists(app: app)

        // MARK: - Interact with Cells
        interactWithCellsInCollectionView(collectionView: collectionView)
    }

    // MARK: - Navigation Verification Methods
    private func verifyNavigationBarExists(app: XCUIApplication) {
        XCTAssertTrue(app.navigationBars["Collections"].exists)
    }

    private func navigateToArrayCell(app: XCUIApplication) {
        let arrayCell = app.tables.cells.staticTexts["Array"]
        XCTAssertTrue(arrayCell.exists)
        arrayCell.tap()
    }

    // MARK: - Collection View Verification Methods
    private func verifyCollectionViewExists(app: XCUIApplication) -> XCUIElement {
        let collectionView = app.collectionViews.firstMatch
        XCTAssertTrue(collectionView.exists)
        return collectionView
    }

    // MARK: - Cell Interaction Methods
    private func interactWithCellsInCollectionView(collectionView: XCUIElement) {
        let firstCell = collectionView.cells.firstMatch
        XCTAssertTrue(firstCell.exists)
        firstCell.tap()

        sleep(3) // Consider replacing with a wait for better performance

        let cells = collectionView.cells
        XCTAssertTrue(cells.count > 0, "Collection should contain items")

        for index in 1..<cells.count {
            let cellIdentifier = "ArrayCell_\(index)"
            let cell = app.collectionViews.cells[cellIdentifier]

            XCTAssertTrue(cell.waitForExistence(timeout: 5), "Cell \(index) does not exist")
            cell.tap()
        }
    }
}
