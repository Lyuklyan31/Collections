import UIKit
import SnapKit

class NoDigitsView: UIView {
    
    // MARK: - UI Elements
    
    let textField = UITextField()
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - Setup UI and Constraints
    
    private func setupUI() {
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        
        textField.delegate = self
        
        addSubview(textField)
        textField.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UITextFieldDelegate

extension NoDigitsView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text as NSString? else { return false }
        
        let newString = text.replacingCharacters(in: range, with: string)
        
        if newString.rangeOfCharacter(from: .decimalDigits) != nil {
            return false
        }
        
        textField.text = newString
        return false
    }
    
    
    // Dismisses the keyboard when the return key is pressed.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
