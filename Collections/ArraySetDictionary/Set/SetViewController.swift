import UIKit
import SnapKit

class SetViewController: UIViewController {
    // MARK: - Properties
    private let noDigitsViewFirst = NoDigitsView()
    private let noDigitsViewSecond = NoDigitsView()
    private let stackView = UIStackView()
    private var titleSetViewController: String
    
    // MARK: - Initializers
    init(_ titleSetViewController: String) {
        self.titleSetViewController = titleSetViewController
        super.init(nibName: nil, bundle: nil)
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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.scrollEdgeAppearance = nil
    }
    
    // MARK: - SetupUI
    private func setupUI() {
        setupNavigationBar()
        setupNoDigitsView()
        setupFindMatchesStackView()
    }
    
    // MARK: - Default Configuration
    private func configureDefaults() {
        setupGestures()
    }
    
    // MARK: - Navigation Bar Setup
    private func setupNavigationBar() {
        if let navigationBar = self.navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            navigationBar.scrollEdgeAppearance = appearance
        }
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemBackground
        title = titleSetViewController
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
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(noDigitsViewSecond.snp.bottom).offset(32)
            $0.bottom.lessThanOrEqualToSuperview()
        }

        // Adding buttons to the stack view
        for buttonType in Buttons.allCases {
            let button = ButtonView(buttonType.title)
            stackView.addArrangedSubview(button)
            
            // Setting up the button action
            button.buttonAction = {
                let firstText = self.noDigitsViewFirst.textField.text ?? ""
                let secondText = self.noDigitsViewSecond.textField.text ?? ""
                
                let resultText = buttonType.perform(using: button, firstText: firstText, secondText: secondText)
                
                button.resultLabel.isHidden = false
                button.resultLabel.text = resultText.isEmpty ? "" : resultText
            }
        }
    }
}
