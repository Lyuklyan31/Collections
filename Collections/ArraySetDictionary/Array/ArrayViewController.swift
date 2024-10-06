import UIKit
import SnapKit

class ArrayViewController: UIViewController {
  
    private let arrayService = ArrayService()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var isArrayCreated = false
    private var titleArrayViewController: String
    private var result: String = ""
    
    private var dataSource: UICollectionViewDiffableDataSource<Int, Buttons>!
    
    init(_ titleArrayViewController: String) {
        self.titleArrayViewController = titleArrayViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.scrollEdgeAppearance = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupNavigationBar()
        setupCollectionView()
        setupDataSource()
        applySnapshot()
    }

    private func setupNavigationBar() {
        if let navigationBar = self.navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            navigationBar.scrollEdgeAppearance = appearance
        }
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemBackground
        title = titleArrayViewController
    }
    
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
    
    private func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Int, Buttons>(collectionView: collectionView) { collectionView, indexPath, button in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArrayCell", for: indexPath) as? ArrayCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.button.setTitle(button.title, for: .normal)
            
            cell.buttonAction = {
                Task {
                    cell.loading.startAnimating()
                    cell.button.isHidden = true
                    
                    let result = await button.perform(using: self.arrayService)
                    cell.button.setTitle(result, for: .normal)
                    
                    cell.loading.stopAnimating()
                    cell.button.isHidden = false
                    
                    if self.isArrayCreated == false {
                        self.isArrayCreated = true
                        self.applySnapshot()
                    }
                }
            }
            
            cell.button.titleLabel?.numberOfLines = 0
            cell.button.titleLabel?.textAlignment = .left
            cell.layer.borderWidth = 0.2
            cell.layer.borderColor = UIColor.black.cgColor
            
            return cell
        }
    }
    
    private func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Int, Buttons>()
        snapshot.appendSections([0])
        let items = isArrayCreated ? Buttons.allCases : [.createArray]
        snapshot.appendItems(items, toSection: 0)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension ArrayViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let height: CGFloat = 80
        
        if indexPath.item == 0 {
            return CGSize(width: collectionViewWidth, height: height)
        } else {
            let width = (collectionViewWidth - 0) / 2
            return CGSize(width: width, height: height)
        }
    }
}

