import UIKit
import SnapKit

class ArrayViewController: UIViewController {
  
    private let arrayService = ArrayService()

    private var isArrayCreated = false
    private var randomNumber: Int
    private var buttonStates: [String]
    private var isEnabled: [Bool]

    
    init(_ randomNumber: Int) {
        self.randomNumber = randomNumber
        self.buttonStates = Array(repeating: "", count: buttonTitles.count)
        self.isEnabled = Array(repeating: true, count: buttonTitles.count)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
        buttonStates = buttonTitles
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
    
    let buttonTitles = [
        "Create Int array with 10_000_000 elements",
        "Insert 1000 elements at the beginning of the array one-by-one.",
        "Insert 1000 elements at the beginning of the array.",
        "Insert 1000 elements in the middle of the array one-by-one.",
        "Insert 1000 elements in the middle of the array.",
        "Insert 1000 elements at the end of the array one-by-one.",
        "Insert 1000 elements at the end of the array all at once.",
        "Remove 1000 elements at the end of the array one-by-one.",
        "Remove 1000 elements at the end of the array.",
        "Remove 1000 elements at the begining of the array one-by-one.",
        "Remove 1000 elements at the begining of the array.",
        "Remove 1000 elements in the middle of the array one-by-one.",
        "Remove 1000 elements in the middle of the array.",
        "Remove 1000 elements at the end of the array one-by-one.",
        "Remove 1000 elemebts at the end of the array."
    ]
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
        return isArrayCreated ? buttonTitles.count : 1
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
        
        cell.button.setTitle(buttonStates[indexPath.item], for: .normal)
        
        if isEnabled[indexPath.item] == false {
            cell.button.isUserInteractionEnabled = false
            cell.button.setTitleColor(.black, for: .normal)
        } else {
            cell.button.isUserInteractionEnabled = true
            cell.button.setTitleColor(.systemBlue, for: .normal)
        }
        
        cell.buttonAction = {
            Task {
                cell.loading.startAnimating()
                cell.button.isUserInteractionEnabled = false
                cell.button.isHidden = true
                
                switch indexPath.item {
                   
                   
                case 0:
                    self.isArrayCreated = true
                    self.isEnabled[0] = false
                    self.buttonStates[0] = await self.arrayService.createArray()
                case 1:
                    self.isEnabled[1] = false
                    self.buttonStates[1] = await self.arrayService.insertAtBeginningArrayOneByOne()
                case 2:
                    self.isEnabled[2] = false
                    self.buttonStates[2] = await self.arrayService.insertAtBeginningArray()
                case 3:
                    self.isEnabled[3] = false
                    self.buttonStates[3] = await self.arrayService.insertInMiddleArrayOneByOne()
                case 4:
                    self.isEnabled[4] = false
                    self.buttonStates[4] = await self.arrayService.insertInMiddleArray()
                default:
                    print("Action for button \(indexPath.item) not implemented")
                }
                
                cell.loading.stopAnimating()
                cell.button.isHidden = false
                cell.button.isUserInteractionEnabled = true
                collectionView.reloadData()
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
