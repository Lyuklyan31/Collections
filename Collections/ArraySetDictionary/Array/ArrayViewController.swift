import UIKit
import SnapKit

// MARK: - ArrayViewController
class ArrayViewController: UIViewController {
    
    // MARK: - Properties
    private var viewModel = ArrayViewModel()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var dataSource: UICollectionViewDiffableDataSource<Int, CellButtons>!
    
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
        dataSource = UICollectionViewDiffableDataSource<Int, CellButtons>(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArrayCell", for: indexPath) as? ArrayCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(with: itemIdentifier.title, indexPath: indexPath.row)
            return cell
        }
    }

    // MARK: - Snapshot Application
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CellButtons>()
        snapshot.appendSections([0])
        let items = !viewModel.arraySnapshot.isEmpty ? CellButtons.allCases : [.createArray]
        snapshot.appendItems(items, toSection: 0)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

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
    
    // MARK: - Collection View Cell Tap Action (As Button)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = CellButtons.allCases[indexPath.row]
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? ArrayCollectionViewCell else { return }
        
        cell.isUserInteractionEnabled = false
        cell.startLoading()
        
        DispatchQueue.global(qos: .userInitiated).async {
            var result: String = ""
            switch selectedItem {
            case .createArray:
                result = self.viewModel.createArray()
            case .insertAtBeginningOneByOne:
                result = self.viewModel.insertAtBeginningArrayOneByOne()
            case .insertAtBeginning:
                result = self.viewModel.insertAtBeginningArrayOnce()
            case .insertInMiddleOneByOne:
                result = self.viewModel.insertInMiddleArrayOneByOne()
            case .insertInMiddle:
                result = self.viewModel.insertInMiddleArrayOnce()
            case .insertAtEndOneByOne:
                result = self.viewModel.insertInEndArrayOneByOne()
            case .insertAtEnd:
                result = self.viewModel.insertInEndArrayOnce()
            case .removeAtEndOneByOne:
                result = self.viewModel.removeAtEndArrayOneByOne()
            case .removeAtEnd:
                result = self.viewModel.removeAtEndArrayOnce()
            case .removeAtBeginningOneByOne:
                result = self.viewModel.removeAtBeginningArrayOneByOne()
            case .removeAtBeginning:
                result = self.viewModel.removeAtBeginningArrayOnce()
            case .removeInMiddleOneByOne:
                result = self.viewModel.removeInMiddleArrayOneByOne()
            case .removeInMiddle:
                result = self.viewModel.removeInMiddleArrayOnce()
            }
            
            DispatchQueue.main.async {
                cell.configureCellResult(with: result)
                cell.stopLoading()
                self.applySnapshot()
            }
        }
    }
}
