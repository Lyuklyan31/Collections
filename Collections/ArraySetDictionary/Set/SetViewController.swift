import UIKit
import SnapKit

// MARK: - SetViewController
class SetViewController: UIViewController {
    // MARK: - Properties
    private let noDigitsViewFirst = NoDigitsView()
    private let noDigitsViewSecond = NoDigitsView()
    private let stackView = UIStackView()
    
    private let viewModel = SetViewModel()
    
    // MARK: - Initializers
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
        navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.scrollEdgeAppearance = nil
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        setupNoDigitsView()
        setupFindMatchesStackView()
    }
    
    // MARK: - Default Configuration
    private func configureDefaults() {
        setupGestures()
    }
    
    // MARK: - No Digits View Setup
    private func setupNoDigitsView() {
        // Adding the first NoDigitsView to the main view
        view.addSubview(noDigitsViewFirst)
        
        noDigitsViewFirst.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
        }
        
        // Adding the second NoDigitsView to the main view
        view.addSubview(noDigitsViewSecond)
        
        noDigitsViewSecond.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(noDigitsViewFirst.snp.bottom).offset(32)
        }
    }
    
    // MARK: - Find Matches StackView Setup
    private func setupFindMatchesStackView() {
        // Configuring the stack view for buttons
        view.backgroundColor = .systemBackground
        
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(noDigitsViewSecond.snp.bottom).offset(32)
            $0.bottom.lessThanOrEqualToSuperview()
        }
        
        for buttonType in SetButtons.allCases {
            let button = ButtonView(buttonType.title)
            stackView.addArrangedSubview(button)
            
            let currentButtonType = buttonType
            
            button.buttonAction = {
                let firstText = self.noDigitsViewFirst.textField.text ?? ""
                let secondText = self.noDigitsViewSecond.textField.text ?? ""
                
                var resultText = ""
                
                switch currentButtonType {
                case .matchingLetters:
                    resultText = self.viewModel.findMatchingLetters(firstText: firstText, secondText: secondText)
                case .nonMatchingLetters:
                    resultText = self.viewModel.findNonMatchingLetters(firstText: firstText, secondText: secondText)
                case .nonMatchingUniqueChars:
                    resultText = self.viewModel.findUniqueNonMatchingChars(firstText: firstText, secondText: secondText)
                }
                
                DispatchQueue.main.async {
                    button.configure(with: resultText)
                }
            }
        }
    }
}
