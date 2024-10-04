import UIKit
import SnapKit

class ArrayViewController: UIViewController {
  
    private let arrayService = ArrayService()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private var isArrayCreated = false
    private var randomNumber: Int
    private var result: String = ""
    
    init(_ randomNumber: Int) {
        self.randomNumber = randomNumber
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.scrollEdgeAppearance = nil
    }

    private func setupNavigationBar() {
        if let navigationBar = self.navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            navigationBar.scrollEdgeAppearance = appearance
        }
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemBackground
        title = "Arrays: \(randomNumber)"
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .systemBackground
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ArrayCollectionViewCell.self, forCellWithReuseIdentifier: "ArrayCell")
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
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

extension ArrayViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isArrayCreated ? Buttons.allCases.count : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArrayCell", for: indexPath) as? ArrayCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let buttons = Buttons.allCases[indexPath.item]
        
        cell.button.setTitle(buttons.title, for: .normal)
        
        cell.buttonAction = {
            Task {
        
                cell.loading.startAnimating()
                cell.button.isHidden = true
                
                self.result = await buttons.perform(using: self.arrayService)
                cell.button.setTitle(self.result, for: .normal)
                
                cell.loading.stopAnimating()
                cell.button.isHidden = false
                
                
            }
            if self.isArrayCreated == false {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                    self.isArrayCreated = true
                    collectionView.reloadData()
                    cell.button.setTitle(self.result, for: .normal)
                }
            }
        }
        
        
        cell.button.titleLabel?.numberOfLines = 0
        cell.button.titleLabel?.textAlignment = .left
        cell.backgroundColor = .systemBackground
        cell.layer.borderWidth = 0.2
        cell.layer.borderColor = UIColor.black.cgColor
        
        return cell
    }
}

enum Buttons: CaseIterable {
    case createArray
    case insertAtBeginningOneByOne
    case insertAtBeginning
    case insertInMiddleOneByOne
    case insertInMiddle
    case insertAtEndOneByOne
    case insertAtEnd
//    case removeAtEndOneByOne(count: Int)
//    case removeAtEnd(count: Int)
//    case removeAtBeginningOneByOne(count: Int)
//    case removeAtBeginning(count: Int)
//    case removeInMiddleOneByOne(count: Int)
//    case removeInMiddle(count: Int)
    
    var title: String {
        switch self {
        case .createArray:
            return "Create Int array with 10,000,000 elements"
        case .insertAtBeginningOneByOne:
            return "Insert 1000 elements at the beginning of the array one-by-one."
        case .insertAtBeginning:
            return "Insert 1000 elements at the beginning of the array."
        case .insertInMiddleOneByOne:
            return "Insert 1000 elements in the middle of the array one-by-one."
        case .insertInMiddle:
            return "Insert 1000 elements in the middle of the array."
        case .insertAtEndOneByOne:
            return "Insert 1000 elements at the end of the array one-by-one."
        case .insertAtEnd:
            return "Insert 1000 elements at the end of the array all at once."
        }
    }
    
    func perform(using service: ArrayService) async -> String {
        switch self {
        case .createArray:
            return await service.createArray()
        case .insertAtBeginningOneByOne:
            return await service.insertAtBeginningArrayOneByOne()
        case .insertAtBeginning:
            return await service.insertAtBeginningArray()
        case .insertInMiddleOneByOne:
            return await service.insertInMiddleArrayOneByOne()
        case .insertInMiddle:
            return await service.insertInMiddleArray()
        case .insertAtEndOneByOne:
            return await service.insertAtEndArrayOneByOne()
        case .insertAtEnd:
            return await service.insertAtEndArray()
        }
    }
}
