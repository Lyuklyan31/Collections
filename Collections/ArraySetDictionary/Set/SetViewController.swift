import UIKit
import SnapKit

class SetViewController: UIViewController {
    private let noDigitsViewFirst = NoDigitsView()
    private let noDigitsViewSecond = NoDigitsView()
    
    private let stackView = UIStackView()
    
    private var titleSetViewController: String
    
    init(_ titleSetViewController: String) {
        self.titleSetViewController = titleSetViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupNoDigitsView()
        setupFindMatchesView()
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
    
    private func setupNavigationBar() {
        if let navigationBar = self.navigationController?.navigationBar {
            let appearance = UINavigationBarAppearance()
            navigationBar.scrollEdgeAppearance = appearance
        }
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemBackground
        title = titleSetViewController
    }
    
    private func setupNoDigitsView() {
        view.addSubview(noDigitsViewFirst)
        
        noDigitsViewFirst.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
        }
        
        view.addSubview(noDigitsViewSecond)
        
        noDigitsViewSecond.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalTo(noDigitsViewFirst.snp.bottom).offset(32)
        }
    }
    
    private func setupFindMatchesView() {
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.top.equalTo(noDigitsViewSecond.snp.bottom).offset(32)
        }

        for buttonType in SetButtons.allCases {
            let button = ButtonView(buttonType.title)
            stackView.addArrangedSubview(button)
            
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
