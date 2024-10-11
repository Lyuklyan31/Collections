import UIKit
import SwiftUI
import SnapKit

// MARK: - DictionaryViewController
class DictionaryViewController: UIViewController {
  
    private let array = UILabel()
    private let dictionary = UILabel()
    private var loadingIndicator = UIActivityIndicatorView()
    
    private var viewModel = DictionaryViewModel()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(_ title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.scrollEdgeAppearance = nil
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        setupLabels()
        setupCollectionView()
        setupLoading()
        creatingContacts()
    }
    
    // MARK: - Contact Creation
    private func creatingContacts() {
        self.loadingIndicator.startAnimating()
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.viewModel.createArrayDictionary()
            
            DispatchQueue.main.async {
                self.loadingIndicator.stopAnimating()
                self.collectionView.isHidden = false
                self.array.isHidden = false
                self.dictionary.isHidden = false
            }
        }
    }
    
    // MARK: - Loading Indicator Setup
    private func setupLoading() {
        view.addSubview(loadingIndicator)
        loadingIndicator.style = .medium
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.isHidden = false
        view.backgroundColor = .systemBackground
        
        loadingIndicator.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.width.equalTo(200)
        }
    }
    
    // MARK: - Labels Setup
    private func setupLabels() {
        array.text = "Array"
        array.font = .systemFont(ofSize: 17)
        array.textColor = .black
        array.textAlignment = .center
        array.isHidden = true
        
        view.addSubview(array)
        array.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.leading.equalToSuperview().offset(64)
            $0.trailing.lessThanOrEqualToSuperview()
        }
        
        dictionary.text = "Dictionary"
        dictionary.font = .systemFont(ofSize: 17)
        dictionary.textColor = .black
        dictionary.textAlignment = .center
        dictionary.isHidden = true
        
        view.addSubview(dictionary)
        dictionary.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.trailing.equalToSuperview().offset(-64)
            $0.leading.greaterThanOrEqualToSuperview()
        }
    }
    
    // MARK: - Collection View Setup
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .systemBackground
        collectionView.isHidden = true
        
        collectionView.register(DictionaryCollectionViewCell.self, forCellWithReuseIdentifier: "DictionaryCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(array.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.greaterThanOrEqualToSuperview()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DictionaryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2
        return CGSize(width: width, height: 80)
    }
}

// MARK: - UICollectionViewDataSource
extension DictionaryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CellDictionaryButtons.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DictionaryCell", for: indexPath) as? DictionaryCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(with: CellDictionaryButtons.allCases[indexPath.row].title )
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = CellDictionaryButtons.allCases[indexPath.row]
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? DictionaryCollectionViewCell else { return }
        
        cell.isUserInteractionEnabled = false
        cell.startLoading()
        
        DispatchQueue.global(qos: .userInitiated).async {
            var result: (message: String, number: Int, time: Double)
            
            switch selectedItem {
            case .findFirstContactArray:
                let (number, time) = self.viewModel.findFirstContactInArrayAndMeasureTime()
                result = ("First element search time", number, time)
                
            case .findFirstContactDictionary:
                let (number, time) = self.viewModel.findFirstContactInDictionaryAndMeasureTime()
                result = ("First element search time", number, time)
                
            case .findLastContactArray:
                let (number, time) = self.viewModel.findLastContactInArrayAndMeasureTime()
                result = ("Last element search time", number, time)
                
            case .findLastContactDictionary:
                let (number, time) = self.viewModel.findLastContactInDictionaryAndMeasureTime()
                result = ("Last element search time", number, time)
                
            case .searchNonExistingArray:
                let (number, time) = self.viewModel.findNonExistingContactInArrayAndMeasureTime()
                result = ("Non-existing element search time", number, time)
                
            case .searchNonExistingDictionary:
                let (number, time) = self.viewModel.findNonExistingContactInDictionaryAndMeasureTime()
                result = ("Non-existing element search time", number, time)
            }
            
            let formattedResult = String(format: "\(result.message): %.3f ms. Result number: \(result.number)", result.time)
            
            DispatchQueue.main.async {
                cell.configureCellResult(with: formattedResult)
                cell.stopLoading()
            }
        }
    }
}
