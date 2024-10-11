import UIKit
import SnapKit

// MARK: - ArrayViewController
class ArrayViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel = ArrayViewModel()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var dataSource: UICollectionViewDiffableDataSource<Int, ArrayCellButtons>!
    
    // MARK: - Initializer
    init(_ title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureDefaults()
        
        self.navigationController?.navigationBar.accessibilityIdentifier = "ArrayViewControllerNavBar"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.scrollEdgeAppearance = nil
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.scrollEdgeAppearance = nil
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        setupCollectionView()
        setupDataSource()
    }
    
    // MARK: - Configure Defaults
    private func configureDefaults() {
        applySnapshot()
    }
    
    // MARK: - Collection View Setup
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(ArrayCollectionViewCell.self, forCellWithReuseIdentifier: "ArrayCell")
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    // MARK: - Data Source Setup
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, ArrayCellButtons>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArrayCell", for: indexPath) as? ArrayCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.accessibilityIdentifier = "ArrayCell_\(indexPath.row)"
            cell.configureCell(with: itemIdentifier.title, at: indexPath.row)
            return cell
        }
    }

    // MARK: - Snapshot Application
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, ArrayCellButtons>()
        snapshot.appendSections([0])
        let items = !viewModel.arraySnapshot.isEmpty ? ArrayCellButtons.allCases : [.createArray]
        snapshot.appendItems(items, toSection: 0)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - UICollectionViewDelegate & UICollectionViewDelegateFlowLayout
extension ArrayViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Collection View Cell Sizing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let height: CGFloat = 80
        
        if indexPath.row == 0 {
            return CGSize(width: collectionViewWidth, height: height)
        } else {
            let width = collectionViewWidth / 2
            return CGSize(width: width, height: height)
        }
    }
    
    // MARK: - Collection View Item Selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = ArrayCellButtons.allCases[indexPath.row]
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? ArrayCollectionViewCell else { return }
        
        cell.isUserInteractionEnabled = false
        cell.startLoading()
        
        DispatchQueue.global(qos: .userInitiated).async {
            var result: (message: String, time: Double)
            
            switch selectedItem {
            case .createArray:
                let time = self.viewModel.getTimeForArrayCreation()
                result = ("Creation time", time)
                
            case .insertAtBeginningOneByOne:
                let time = self.viewModel.getTimeForInsertAtBeginningOneByOne()
                result = ("Insertion time", time)
                
            case .insertAtBeginning:
                let time = self.viewModel.getTimeForInsertAtBeginningOnce()
                result = ("Insertion time", time)
                
            case .insertInMiddleOneByOne:
                let time = self.viewModel.getTimeForInsertInMiddleOneByOne()
                result = ("Insertion time", time)
                
            case .insertInMiddle:
                let time = self.viewModel.getTimeForInsertInMiddleOnce()
                result = ("Insertion time", time)
                
            case .insertAtEndOneByOne:
                let time = self.viewModel.getTimeForInsertAtEndOneByOne()
                result = ("Insertion time", time)
                
            case .insertAtEnd:
                let time = self.viewModel.getTimeForInsertAtEndOnce()
                result = ("Insertion time", time)
                
            case .removeAtEndOneByOne:
                let time = self.viewModel.getTimeForRemoveAtEndOneByOne()
                result = ("Removal time", time)
                
            case .removeAtEnd:
                let time = self.viewModel.getTimeForRemoveAtEndOnce()
                result = ("Removal time", time)
                
            case .removeAtBeginningOneByOne:
                let time = self.viewModel.getTimeForRemoveAtBeginningOneByOne()
                result = ("Removal time", time)
                
            case .removeAtBeginning:
                let time = self.viewModel.getTimeForRemoveAtBeginningOnce()
                result = ("Removal time", time)
                
            case .removeInMiddleOneByOne:
                let time = self.viewModel.getTimeForRemoveInMiddleOneByOne()
                result = ("Removal time", time)
                
            case .removeInMiddle:
                let time = self.viewModel.getTimeForRemoveInMiddleOnce()
                result = ("Removal time", time)
            }
            
            let formattedResult = String(format: "\(result.message): %.3f ms.", result.time)
            
            DispatchQueue.main.async {
                cell.configureCellResult(with: formattedResult)
                cell.stopLoading()
                self.applySnapshot()
            }
        }
    }
}
