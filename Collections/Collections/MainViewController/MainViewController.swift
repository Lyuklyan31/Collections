import UIKit
import SnapKit

// MARK: - MainViewController
class MainViewController: UIViewController {
    
    // MARK: - Properties
    private let tableView = UITableView()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - UI Setup
    private func setupUI() {
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Collections"
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Collections.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        let collection = Collections.allCases[indexPath.row]
        cell.configure(with: collection.title)
        return cell
    }

}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
     
        let selectedCollection = Collections.allCases[indexPath.row]
        let destinationVC: UIViewController
        let title = "\(selectedCollection.title): \(Int.random(in: 0...9_999_999))"
        switch selectedCollection {
        case .array:
            destinationVC = ArrayViewController(title)
        case .set:
            destinationVC = SetViewController(title)
        case .dictionary:
            destinationVC = DictionaryViewController(title)
        }

        navigationController?.pushViewController(destinationVC, animated: true)
    }
}
