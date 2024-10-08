
import UIKit
import SwiftUI
import SnapKit

class DictionaryViewController: UIViewController {
  
    private let array = UILabel()
    private let dictionary = UILabel()
    private var loading = UIActivityIndicatorView()
    
    private var titleDictionaryViewController: String
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private var dictionaryService = DictionaryService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(_ titleDictionaryViewController: String) {
        self.titleDictionaryViewController = titleDictionaryViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.scrollEdgeAppearance = nil
    }
    
    private func setupUI() {
        setupNavigationBar()
        setupLabels()
        setupCollectionView()
        creatingContacts()
    }
    
    private func creatingContacts() {
        Task {
            loading.startAnimating()
            await dictionaryService.createContactsArray()
            await dictionaryService.createContactsDictionary()
            loading.stopAnimating()
        }
    }

    private func setupNavigationBar() {
        if let navigationBar = self.navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            navigationBar.scrollEdgeAppearance = appearance
        }
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemBackground
        title = titleDictionaryViewController
    }
    
    private func setupLoading() {
        view.addSubview(loading)
        loading.style = .medium
        loading.hidesWhenStopped = true
        view.backgroundColor = .systemBackground
        
        loading.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.width.equalTo(100)
        }
    }
    
    private func setupLabels() {
        array.text = "Array"
        array.font = .systemFont(ofSize: 17)
        array.textColor = .black
        array.textAlignment = .center
        
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
        
        view.addSubview(dictionary)
        dictionary.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.trailing.equalToSuperview().offset(-64)
            $0.leading.greaterThanOrEqualToSuperview()
        }
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .systemBackground
        
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

extension DictionaryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 2
        return CGSize(width: width, height: 80)
    }
}


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
        
        let buttons = CellDictionaryButtons.allCases[indexPath.item]
        
        cell.button.setTitle(buttons.title, for: .normal)
        
        cell.buttonAction = {
            Task {
                let result = await buttons.perform(using: self.dictionaryService)
                cell.button.setTitle(result, for: .normal)
            }
        }
        
        cell.button.titleLabel?.numberOfLines = 0
        cell.button.titleLabel?.textAlignment = .left
        cell.layer.borderWidth = 0.2
        cell.layer.borderColor = UIColor.black.cgColor
        
        return cell
    }
}
