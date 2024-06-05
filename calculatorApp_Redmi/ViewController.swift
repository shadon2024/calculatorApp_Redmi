//
//  AppDelegate.swift
//  calculatorApp_Redmi
//
//  Created by Admin on 19/05/24...
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var isNewValue = true
    var operation: MathOperation? = nil
    var previousOperation: MathOperation? = nil
    var result: Int = 0
    var newValue: Int = 0
    var number: Double?



    lazy var labelOne: UILabel = {
        let label = UILabel()
        label.text = "7 + 7"
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()

    lazy var labelTwo: UILabel = {
        let label = UILabel()
        label.text = "= 14"
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()

    lazy var stackViewOne: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .systemPink
        return stack
    }()


    lazy var stackViewTwo: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .systemCyan
        return stack
    }()

    lazy var buttonOne: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("2nd", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(twoNdButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func twoNdButton() {
        
    }


    lazy var buttonTwo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("deg", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(degButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func degButton() {
        
    }


    lazy var buttonThree: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("sin", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(sinButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func sinButton() {
        
    }
    

    lazy var buttonFour: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("cos", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(cosButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func cosButton() {
        
    }


    lazy var buttonFive: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("tan", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(tanButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func tanButton() {
        
    }
    

    lazy var buttonSix: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("x^", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(squaredButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func squaredButton() {
        
    }

    lazy var buttonSeven: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("lg", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(lgButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func lgButton() {
        
    }

    lazy var buttonEight: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ln", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(lnButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func lnButton() {
        
    }

    lazy var buttonNine: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("(", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(roundBracketsButton1), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func roundBracketsButton1() {
        
    }


    lazy var buttonTen: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(")", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(roundBracketsButton2), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func roundBracketsButton2() {
        
    }

    lazy var buttonEleven: UIButton = {
        let button = UIButton(type: .system)
        //button.setImage(UIImage(systemName: "x.squareroot"), for: .normal)
        button.setTitle("√x", for: .normal)
        button.addTarget(nil, action: #selector(xSquareroot), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    @objc func xSquareroot() {
        
    }

    lazy var buttonTwolfe: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("AC", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(nil, action: #selector(singButtonTaped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()

    @objc func singButtonTaped () {
        isNewValue = true
        result = 0
        newValue = 0
        operation = nil
        previousOperation = nil
        labelTwo.text = "0"
    }

    lazy var buttonThreeten: UIButton = {
        let button = UIButton(type: .system)
        //button.setImage(UIImage(systemName: "delete.left"), for: .normal)
        button.setTitle("⌫", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(nil, action: #selector(singButtonTaped), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()

    lazy var buttonFourten: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("%", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(nil, action: #selector(singButtonProcent), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()

    @objc func singButtonProcent () {
        // %
        var number1 = Double(labelTwo.text!)
        number1 = number1! / 100
        labelTwo.text = String(number1!)
        isNewValue = true
    }


    lazy var buttonFiveten: UIButton = {
        let button = UIButton(type: .system)
        //button.setImage(UIImage(systemName: "divide"), for: .normal)
        button.setTitle("÷", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(nil, action: #selector(singButtonDivide), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 38, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonDivide () {
        // 4/2 = 2
        operation = .divide
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }



    lazy var buttonSixten: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("x!", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(factorialButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func factorialButton () {

    }

    lazy var buttonSeventen: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("7", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(singButtonSeven), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonSeven () {
        addDigit("7")
    }


    lazy var buttonEightten: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("8", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonEight), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonEight () {
        addDigit("8")
    }


    lazy var buttonNineten: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("9", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonNine), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonNine () {
        addDigit("9")
    }


    lazy var buttonTwenty: UIButton = {
        let button = UIButton(type: .system)
        //button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.setTitle("×", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(self, action: #selector(singButtonmultiply), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 38, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonmultiply () {
        // *
        operation = .multiply
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }


    lazy var buttonTwentyOne: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("1/x", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(oneInXButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func oneInXButton () {
    }

    lazy var buttonTwentyTwo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("4", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonFour), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonFour () {
        addDigit("4")
    }



    lazy var buttonTwentyThree: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("5", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonFive), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonFive () {
        addDigit("5")
    }


    lazy var buttonTwentyFour: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("6", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonSix), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonSix () {
        addDigit("6")
    }


    lazy var buttonTwentyFive: UIButton = {
        let button = UIButton(type: .system)
        //button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.setTitle("-", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(self, action: #selector(singButtonMinus), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 38, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonMinus () {
        // -
        operation = .substract
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }


    lazy var buttonTwentySix: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("π", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonPi), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonPi () {
    }


    lazy var buttonTwentySeven: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("1", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonOne), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonOne() {
        addDigit("1")
    }

    lazy var buttonTwentyEight: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("2", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonTwo), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonTwo() {
        addDigit("2")
    }

    lazy var buttonTwentyNine: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("3", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonThree), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonThree() {
        addDigit("3")
    }

    lazy var buttonTherty: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        //button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(self, action: #selector(singButtonPlus), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 38, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonPlus() {
        // +
        operation = .sum
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }

    lazy var buttonThertyOne: UIButton = {
        let button = UIButton(type: .system)
        //button.setTitle("⇨", for: .normal)
        button.setTitle("⟲", for: .normal)
        //button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(squarepathButton), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 38, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func squarepathButton() {
    }


    lazy var buttonThertyTwo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("e", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonE), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonE() {
    }


    lazy var buttonThertyThree: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("0", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonZero), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonZero() {
        addDigit("0")
    }

    lazy var buttonThertyFour: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(".", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonComma), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 42, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonComma() {
    }

//    lazy var buttonThertyFive: UIButton = {
//        let button = UIButton()
//        //button.setTitle("п", for: .normal)
//        button.setImage(UIImage(systemName: "equal.circle.fill"), for: .normal)
//        button.backgroundColor = .green
//        button.setTitleColor(.black, for: .normal)
//        button.addTarget(self, action: #selector(singButtonEqual), for: .touchUpInside)
//        button.imageView?.contentMode = .scaleAspectFit
//        return button
//    }()
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Определяем новый размер
        let newSize = CGSize(width: size.width * widthRatio, height: size.height * heightRatio)

        // Создаем графический контекст и рисуем новое изображение
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }

    lazy var buttonThertyFive: UIButton = {
        let button = UIButton(type: .system)
//        if let image = UIImage(systemName: "equal.circle.fill") {
//            let coloredImage = image.withTintColor(.red, renderingMode: .alwaysOriginal)
//            button.setImage(coloredImage, for: .normal)
//            let resizedImage = resizeImage(image: image, targetSize: CGSize(width: 30, height: 30))
//            button.setImage(resizedImage, for: .normal)
//        }
        button.setTitle("=", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(self, action: #selector(singButtonEqual), for: .touchUpInside)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 38, weight: .medium)
        button.layer.cornerRadius = 5
        return button
    }()
    @objc func singButtonEqual() {
        // =
        calculate()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        constrainsUI()
        labelTwo.text = ConstansString.CalculatorTitle
        labelOne.text = ConstansString.CalculatorTitle
    }


    func addDigit(_ digit: String) {
        if isNewValue {
            labelTwo.text = ""
            labelOne.text = ""
            isNewValue = false
        }
        var digits = labelTwo.text
        digits?.append(digit)
        labelTwo.text = digits
    }


    func getInteger() -> Int {
        return Int(labelTwo.text ?? "0") ?? 0
    }


    func calculate() {
        guard let operation = operation else {
            return
        }

        if previousOperation != operation {
            newValue = getInteger()
        }

        result = operation.makeOperation(result: result, newValue: newValue)

        previousOperation = operation
        labelTwo.text = "\(result)"
        labelOne.text = "\(result)"
        isNewValue = true
    }

    private func configUI() {
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        view.addSubview(stackViewOne)
        view.addSubview(stackViewTwo)

        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
        view.addSubview(buttonThree)
        view.addSubview(buttonFour)
        view.addSubview(buttonFive)
        view.addSubview(buttonSix)
        view.addSubview(buttonSeven)
        view.addSubview(buttonEight)
        view.addSubview(buttonNine)
        view.addSubview(buttonTen)
        view.addSubview(buttonEleven)
        view.addSubview(buttonTwolfe)
        view.addSubview(buttonThreeten)
        view.addSubview(buttonFourten)
        view.addSubview(buttonFiveten)
        view.addSubview(buttonSixten)
        view.addSubview(buttonSeventen)
        view.addSubview(buttonEightten)
        view.addSubview(buttonNineten)
        view.addSubview(buttonTwenty)
        view.addSubview(buttonTwentyOne)
        view.addSubview(buttonTwentyTwo)
        view.addSubview(buttonTwentyThree)
        view.addSubview(buttonTwentyFour)
        view.addSubview(buttonTwentyFive)
        view.addSubview(buttonTwentySix)
        view.addSubview(buttonTwentySeven)
        view.addSubview(buttonTwentyEight)
        view.addSubview(buttonTwentyNine)
        view.addSubview(buttonTherty)
        view.addSubview(buttonThertyOne)
        view.addSubview(buttonThertyTwo)
        view.addSubview(buttonThertyThree)
        view.addSubview(buttonThertyFour)
        view.addSubview(buttonThertyFive)


        stackViewOne.addSubview(labelOne)
        stackViewOne.addSubview(labelTwo)

        stackViewTwo.addSubview(buttonOne)
        stackViewTwo.addSubview(buttonTwo)
        stackViewTwo.addSubview(buttonThree)
        stackViewTwo.addSubview(buttonFour)
        stackViewTwo.addSubview(buttonFive)
        stackViewTwo.addSubview(buttonSix)
        stackViewTwo.addSubview(buttonSeven)
        stackViewTwo.addSubview(buttonEight)
        stackViewTwo.addSubview(buttonNine)
        stackViewTwo.addSubview(buttonTen)
        stackViewTwo.addSubview(buttonEleven)
        stackViewTwo.addSubview(buttonTwolfe)
        stackViewTwo.addSubview(buttonThreeten)
        stackViewTwo.addSubview(buttonFourten)
        stackViewTwo.addSubview(buttonFiveten)
        stackViewTwo.addSubview(buttonSixten)
        stackViewTwo.addSubview(buttonSeventen)
        stackViewTwo.addSubview(buttonEightten)
        stackViewTwo.addSubview(buttonNineten)
        stackViewTwo.addSubview(buttonTwenty)
        stackViewTwo.addSubview(buttonTwentyOne)
        stackViewTwo.addSubview(buttonTwentyTwo)
        stackViewTwo.addSubview(buttonTwentyThree)
        stackViewTwo.addSubview(buttonTwentyFour)
        stackViewTwo.addSubview(buttonTwentyFive)
        stackViewTwo.addSubview(buttonTwentySix)
        stackViewTwo.addSubview(buttonTwentySeven)
        stackViewTwo.addSubview(buttonTwentyEight)
        stackViewTwo.addSubview(buttonTwentyNine)
        stackViewTwo.addSubview(buttonTherty)
        stackViewTwo.addSubview(buttonThertyOne)
        stackViewTwo.addSubview(buttonThertyTwo)
        stackViewTwo.addSubview(buttonThertyThree)
        stackViewTwo.addSubview(buttonThertyFour)
        stackViewTwo.addSubview(buttonThertyFive)
    }

    private func constrainsUI() {
        stackViewOne.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(200)
        }

        labelOne.snp.makeConstraints { make in
            make.top.equalTo(60)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            //make.height.equalTo(60)
        }

        labelTwo.snp.makeConstraints { make in
            make.top.equalTo(140)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
        }


        stackViewTwo.snp.makeConstraints { make in
            make.top.equalTo(stackViewOne.snp.bottom).offset(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)

        }


        // MARK: - line one

        buttonOne.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(30)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonTwo.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(buttonOne.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonThree.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(buttonTwo.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)

        }

        buttonFour.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(buttonThree.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonFive.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(buttonFour.snp.trailing).offset(8)
            //make.trailing.equalTo(-30)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }



        // MARK: - line two

        buttonSix.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(30)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonSeven.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(buttonSix.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonEight.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(buttonSeven.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonNine.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(buttonEight.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonTen.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(buttonNine.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        // MARK: - line three

        buttonEleven.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.leading.equalTo(30)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonTwolfe.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.leading.equalTo(buttonEleven.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonThreeten.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.leading.equalTo(buttonTwolfe.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonFourten.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.leading.equalTo(buttonThreeten.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonFiveten.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.leading.equalTo(buttonFourten.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }



        // MARK: - line four

        buttonSixten.snp.makeConstraints { make in
            make.top.equalTo(190)
            make.leading.equalTo(30)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonSeventen.snp.makeConstraints { make in
            make.top.equalTo(190)
            make.leading.equalTo(buttonSixten.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonEightten.snp.makeConstraints { make in
            make.top.equalTo(190)
            make.leading.equalTo(buttonSeventen.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonNineten.snp.makeConstraints { make in
            make.top.equalTo(190)
            make.leading.equalTo(buttonEightten.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonTwenty.snp.makeConstraints { make in
            make.top.equalTo(190)
            make.leading.equalTo(buttonNineten.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }



        // MARK: - line five

        buttonTwentyOne.snp.makeConstraints { make in
            make.top.equalTo(250)
            make.leading.equalTo(30)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonTwentyTwo.snp.makeConstraints { make in
            make.top.equalTo(250)
            make.leading.equalTo(buttonTwentyOne.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonTwentyThree.snp.makeConstraints { make in
            make.top.equalTo(250)
            make.leading.equalTo(buttonTwentyTwo.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonTwentyFour.snp.makeConstraints { make in
            make.top.equalTo(250)
            make.leading.equalTo(buttonTwentyThree.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonTwentyFive.snp.makeConstraints { make in
            make.top.equalTo(250)
            make.leading.equalTo(buttonTwentyFour.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }




        // MARK: - line six

        buttonTwentySix.snp.makeConstraints { make in
            make.top.equalTo(310)
            make.leading.equalTo(30)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonTwentySeven.snp.makeConstraints { make in
            make.top.equalTo(310)
            make.leading.equalTo(buttonTwentySix.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonTwentyEight.snp.makeConstraints { make in
            make.top.equalTo(310)
            make.leading.equalTo(buttonTwentySeven.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonTwentyNine.snp.makeConstraints { make in
            make.top.equalTo(310)
            make.leading.equalTo(buttonTwentyEight.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }


        buttonTherty.snp.makeConstraints { make in
            make.top.equalTo(310)
            make.leading.equalTo(buttonTwentyNine.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }




        // MARK: - line seven

        buttonThertyOne.snp.makeConstraints { make in
            make.top.equalTo(370)
            make.leading.equalTo(30)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonThertyTwo.snp.makeConstraints { make in
            make.top.equalTo(370)
            make.leading.equalTo(buttonThertyOne.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonThertyThree.snp.makeConstraints { make in
            make.top.equalTo(370)
            make.leading.equalTo(buttonThertyTwo.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonThertyFour.snp.makeConstraints { make in
            make.top.equalTo(370)
            make.leading.equalTo(buttonThertyThree.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }

        buttonThertyFive.snp.makeConstraints { make in
            make.top.equalTo(370)
            make.leading.equalTo(buttonThertyFour.snp.trailing).offset(8)
            make.height.equalTo(50)
            make.width.equalTo(60)
        }


    }

}



enum MathOperation {
    case sum, substract, multiply, divide

    func makeOperation(result: Int, newValue: Int) -> Int {
        switch self {
        case .sum:
            return (result + newValue)
        case .substract:
            return (result - newValue)
        case .multiply:
            return (result * newValue)
        case .divide:
            return (result / newValue)
        }
    }

}



//import UIKit
//
//class ViewController: UIViewController {
//
//    var displayLabel1: UILabel!
//    var displayLabel2: UILabel!
//    var currentInput: String = ""
//    var firstOperand: Double?
//    var secondOperand: Double?
//    var operation: String?
//    var fullExpression: String = ""
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupCalculatorLayout()
//    }
//
//    func setupCalculatorLayout() {
//        // Настройка дисплея
//        displayLabel1 = UILabel()
//        displayLabel1.textAlignment = .right
//        displayLabel1.font = UIFont.systemFont(ofSize: 32)
//        displayLabel1.backgroundColor = .darkGray
//        displayLabel1.textColor = .white
//        view.addSubview(displayLabel1)
//        //view.addSubview(displayLabel2)
//
//        // Настройка ограничений для дисплея
//        displayLabel1.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            displayLabel1.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
//            displayLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            displayLabel1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            displayLabel1.heightAnchor.constraint(equalToConstant: 60)
//        ])
//
//        // Настройка дисплея для результата
//            displayLabel2 = UILabel()
//            displayLabel2.textAlignment = .right
//            displayLabel2.font = UIFont.systemFont(ofSize: 32)
//            displayLabel2.backgroundColor = .darkGray
//            displayLabel2.textColor = .white
//            view.addSubview(displayLabel2)
//
//            // Настройка ограничений для дисплея результата
//            displayLabel2.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                displayLabel2.topAnchor.constraint(equalTo: displayLabel1.bottomAnchor, constant: 20),
//                displayLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                displayLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//                displayLabel2.heightAnchor.constraint(equalToConstant: 60)
//            ])
//
//        // Названия кнопок
//        let buttons: [[String]] = [
//            ["sin", "cos", "tan", "log", "ln"],
//            ["7", "8", "9", "/", "("],
//            ["4", "5", "6", "*", ")"],
//            ["1", "2", "3", "-", "^"],
//            ["0", ".", "=", "+", "C"]
//        ]
//
//        // Создание и добавление кнопок на экран
//        let buttonWidth: CGFloat = 60
//        let buttonHeight: CGFloat = 60
//        let buttonSpacing: CGFloat = 10
//
//        for (rowIndex, row) in buttons.enumerated() {
//            for (colIndex, title) in row.enumerated() {
//                let button = UIButton(type: .system)
//                button.setTitle(title, for: .normal)
//                button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
//                button.backgroundColor = .black
//                button.setTitleColor(.white, for: .normal)
//
//                // Настройка цвета для определенных кнопок
//                if ["sin", "cos", "tan", "log", "ln"].contains(title) {
//                    button.setTitleColor(.orange, for: .normal)
//                } else if ["7", "8", "9", "4", "5", "6", "1", "2", "3", "0", "."].contains(title) {
//                    button.setTitleColor(.magenta, for: .normal)
//                }
//
//                button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
//
//                view.addSubview(button)
//
//                // Установка рамки для кнопки
//                button.frame = CGRect(
//                    x: CGFloat(colIndex) * (buttonWidth + buttonSpacing) + 20,
//                    y: CGFloat(rowIndex) * (buttonHeight + buttonSpacing) + 300,
//                    width: buttonWidth,
//                    height: buttonHeight
//                )
//            }
//        }
//    }
//
//    @objc func buttonPressed(_ sender: UIButton) {
//        guard let title = sender.currentTitle else { return }
//
//        switch title {
//        case "C":
//            clear()
//        case "=":
//            calculateResult()
//        case "+", "-", "*", "/", "^":
//            setOperation(title)
//            //calculateResult()
//        case "sin", "cos", "tan", "log", "ln":
//            performScientificOperation(title)
//        default:
//            appendNumber(title)
//            //calculateResult()
//        }
//
//        calculateResult()
//    }
//
//    func clear() {
//        currentInput = ""
//        firstOperand = nil
//        secondOperand = nil
//        operation = nil
//        fullExpression = ""
//        displayLabel1.text = ""
//        displayLabel2.text = ""
//    }
//
//    func calculateResult() {
//        guard let first = firstOperand, let operation = operation else { return }
//        secondOperand = Double(currentInput)
//        currentInput = ""
//
//        var result: Double?
//
//        if let second = secondOperand {
//            switch operation {
//            case "+":
//                result = first + second
//            case "-":
//                result = first - second
//            case "*":
//                result = first * second
//            case "/":
//                result = first / second
//            case "^":
//                result = pow(first, second)
//            default:
//                break
//            }
//        }
//
//        if let result = result {
//            displayLabel2.text = String(result)
//            firstOperand = result
//            secondOperand = nil
//            self.operation = nil
//        }
//        // Используйте NSExpression для вычисления полного выражения
//        let expression = NSExpression(format: fullExpression)
//        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
//            displayLabel2.text = String(result)
//        }
//    }
//
//    func setOperation(_ operation: String) {
////        if firstOperand == nil {
////            firstOperand = Double(currentInput)
////            currentInput = ""
////        }
////        self.operation = operation
////        displayLabel1.text = "\(firstOperand ?? 0) \(operation)"
//        if !currentInput.isEmpty {
//            fullExpression += currentInput
//            currentInput = ""
//        }
//        fullExpression += " \(operation) "
//        displayLabel1.text = fullExpression
//    }
//
//    func performScientificOperation(_ operation: String) {
//        guard let value = Double(currentInput) else { return }
//        var result: Double?
//
//        switch operation {
//        case "sin":
//            result = sin(value)
//        case "cos":
//            result = cos(value)
//        case "tan":
//            result = tan(value)
//        case "log":
//            result = log10(value)
//        case "ln":
//            result = log(value)
//        default:
//            break
//        }
//
//        if let result = result {
//            fullExpression = String(result)
//            displayLabel1.text = fullExpression
//            displayLabel2.text = String(result)
//            currentInput = String(result)
//        }
//    }
//
//    func appendNumber(_ number: String) {
//        currentInput.append(number)
//        fullExpression += number
//        displayLabel1.text = fullExpression
//    }
//}


//
//import UIKit
//
//class ViewController: UIViewController {
//
//    var displayLabel: UILabel!
//    var currentInput: String = ""
//    var firstOperand: Double?
//    var secondOperand: Double?
//    var operation: String?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupCalculatorLayout()
//    }
//
//    func setupCalculatorLayout() {
//        view.backgroundColor = .black
//
//        // Настройка дисплея
//        displayLabel = UILabel()
//        displayLabel.textAlignment = .right
//        displayLabel.font = UIFont.systemFont(ofSize: 32)
//        displayLabel.backgroundColor = .black
//        displayLabel.textColor = .white
//        displayLabel.text = "0"
//        displayLabel.numberOfLines = 0
//        view.addSubview(displayLabel)
//
//        // Настройка ограничений для дисплея
//        displayLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            displayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            displayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            displayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            displayLabel.heightAnchor.constraint(equalToConstant: 80)
//        ])
//
//        // Названия кнопок
//        let buttons: [[String]] = [
//            ["2nd", "deg", "sin", "cos", "tan"],
//            ["xʸ", "lg", "ln", "(", ")"],
//            ["√x", "AC", "⌫", "%", "÷"],
//            ["x!", "7", "8", "9", "×"],
//            ["1/x", "4", "5", "6", "−"],
//            ["π", "1", "2", "3", "+"],
//            ["↔", "e", "0", ",", "="]
//        ]
//
//        // Создание и добавление кнопок на экран
//        let buttonWidth: CGFloat = 70
//        let buttonHeight: CGFloat = 70
//        let buttonSpacing: CGFloat = 10
//
//        for (rowIndex, row) in buttons.enumerated() {
//            for (colIndex, title) in row.enumerated() {
//                let button = UIButton(type: .system)
//                button.setTitle(title, for: .normal)
//                button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
//                button.backgroundColor = .darkGray
//                button.setTitleColor(.white, for: .normal)
//
//                // Настройка цвета для определенных кнопок
//                if ["AC", "⌫", "%", "÷", "×", "−", "+", "="].contains(title) {
//                    button.setTitleColor(.orange, for: .normal)
//                }
//
//                button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
//
//                view.addSubview(button)
//
//                // Установка рамки для кнопки
//                button.translatesAutoresizingMaskIntoConstraints = false
//                NSLayoutConstraint.activate([
//                    button.widthAnchor.constraint(equalToConstant: buttonWidth),
//                    button.heightAnchor.constraint(equalToConstant: buttonHeight),
//                    button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(colIndex) * (buttonWidth + buttonSpacing) + 20),
//                    button.topAnchor.constraint(equalTo: displayLabel.bottomAnchor, constant: CGFloat(rowIndex) * (buttonHeight + buttonSpacing) + 20)
//                ])
//            }
//        }
//    }
//
//    @objc func buttonPressed(_ sender: UIButton) {
//        guard let title = sender.currentTitle else { return }
//
//        switch title {
//        case "AC":
//            clear()
//        case "⌫":
//            deleteLast()
//        case "=":
//            calculateResult()
//        case "+", "−", "×", "÷", "xʸ":
//            setOperation(title)
//        case "sin", "cos", "tan", "lg", "ln", "√x", "x!":
//            performScientificOperation(title)
//        case "2nd", "deg", "(", ")", "π", "1/x", "e", ",":
//            // В данном примере не обрабатывается
//            break
//        default:
//            appendNumber(title)
//        }
//    }
//
//    func clear() {
//        currentInput = ""
//        firstOperand = nil
//        secondOperand = nil
//        operation = nil
//        displayLabel.text = "0"
//    }
//
//    func deleteLast() {
//        if !currentInput.isEmpty {
//            currentInput.removeLast()
//            displayLabel.text = currentInput.isEmpty ? "0" : currentInput
//        }
//    }
//
//    func calculateResult() {
//        guard let first = firstOperand, let operation = operation else { return }
//        secondOperand = Double(currentInput)
//        currentInput = ""
//
//        var result: Double?
//
//        if let second = secondOperand {
//            switch operation {
//            case "+":
//                result = first + second
//            case "−":
//                result = first - second
//            case "×":
//                result = first * second
//            case "÷":
//                result = first / second
//            case "xʸ":
//                result = pow(first, second)
//            default:
//                break
//            }
//        }
//
//        if let result = result {
//            displayLabel.text = String(result)
//            firstOperand = result
//            secondOperand = nil
//            self.operation = nil
//        }
//    }
//
//    func setOperation(_ operation: String) {
//        if firstOperand == nil {
//            firstOperand = Double(currentInput)
//            currentInput = ""
//        }
//        self.operation = operation
//    }
//
//    func performScientificOperation(_ operation: String) {
//        guard let value = Double(currentInput) else { return }
//        var result: Double?
//
//        switch operation {
//        case "sin":
//            result = sin(value)
//        case "cos":
//            result = cos(value)
//        case "tan":
//            result = tan(value)
//        case "lg":
//            result = log10(value)
//        case "ln":
//            result = log(value)
//        case "√x":
//            result = sqrt(value)
//        case "x!":
//            result = factorial(value)
//        default:
//            break
//        }
//
//        if let result = result {
//            displayLabel.text = String(result)
//            currentInput = String(result)
//        }
//    }
//
//    func factorial(_ n: Double) -> Double {
//        return (n == 0) ? 1 : (1...Int(n)).map(Double.init).reduce(1.0, *)
//    }
//
//    func appendNumber(_ number: String) {
//        if number == "," {
//            currentInput.append(".")
//        } else {
//            currentInput.append(number)
//        }
//        displayLabel.text = currentInput
//    }
//}
