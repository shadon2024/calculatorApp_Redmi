//
//  AppDelegate.swift
//  calculatorApp_Redmi
//
//  Created by Admin on 19/05/24.
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
        let button = UIButton()
        button.setTitle("2nd", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()


    lazy var buttonTwo: UIButton = {
        let button = UIButton()
        button.setTitle("deg", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()


    lazy var buttonThree: UIButton = {
        let button = UIButton()
        button.setTitle("sin", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    lazy var buttonFour: UIButton = {
        let button = UIButton()
        button.setTitle("cos", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()


    lazy var buttonFive: UIButton = {
        let button = UIButton()
        button.setTitle("tan", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    lazy var buttonSix: UIButton = {
        let button = UIButton()
        button.setTitle("x^", for: .normal)
        //button.setImage(UIImage(systemName: "person"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    lazy var buttonSeven: UIButton = {
        let button = UIButton()
        button.setTitle("lg", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    lazy var buttonEight: UIButton = {
        let button = UIButton()
        button.setTitle("ln", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    lazy var buttonNine: UIButton = {
        let button = UIButton()
        button.setTitle("(", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()


    lazy var buttonTen: UIButton = {
        let button = UIButton()
        button.setTitle(")", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    lazy var buttonEleven: UIButton = {
        let button = UIButton()
        //button.setTitle(")", for: .normal)
        button.setImage(UIImage(systemName: "x.squareroot"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    lazy var buttonTwolfe: UIButton = {
        let button = UIButton()
        button.setTitle("AC", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(nil, action: #selector(singButtonTaped), for: .touchUpInside)
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
        let button = UIButton()
        //button.setTitle(")", for: .normal)
        button.setImage(UIImage(systemName: "delete.left"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(nil, action: #selector(singButtonTaped), for: .touchUpInside)
        return button
    }()

    lazy var buttonFourten: UIButton = {
        let button = UIButton()
        button.setTitle("%", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(nil, action: #selector(singButtonProcent), for: .touchUpInside)
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
        let button = UIButton()
        //button.setTitle(")", for: .normal)
        button.setImage(UIImage(systemName: "divide"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(nil, action: #selector(singButtonDivide), for: .touchUpInside)
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
        let button = UIButton()
        button.setTitle("x!", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    lazy var buttonSeventen: UIButton = {
        let button = UIButton()
        button.setTitle("7", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(nil, action: #selector(singButtonSeven), for: .touchUpInside)
        return button
    }()
    @objc func singButtonSeven () {
        addDigit("7")
    }


    lazy var buttonEightten: UIButton = {
        let button = UIButton()
        button.setTitle("8", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonEight), for: .touchUpInside)
        return button
    }()
    @objc func singButtonEight () {
        addDigit("8")
    }


    lazy var buttonNineten: UIButton = {
        let button = UIButton()
        button.setTitle("9", for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonNine), for: .touchUpInside)
        return button
    }()
    @objc func singButtonNine () {
        addDigit("9")
    }


    lazy var buttonTwenty: UIButton = {
        let button = UIButton()
        //button.setTitle(")", for: .normal)
        button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonmultiply), for: .touchUpInside)
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
        let button = UIButton()
        button.setTitle("1/x", for: .normal)
        //button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    lazy var buttonTwentyTwo: UIButton = {
        let button = UIButton()
        button.setTitle("4", for: .normal)
        //button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonFour), for: .touchUpInside)
        return button
    }()
    @objc func singButtonFour () {
        addDigit("4")
    }



    lazy var buttonTwentyThree: UIButton = {
        let button = UIButton()
        button.setTitle("5", for: .normal)
        //button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonFive), for: .touchUpInside)
        return button
    }()
    @objc func singButtonFive () {
        addDigit("5")
    }


    lazy var buttonTwentyFour: UIButton = {
        let button = UIButton()
        button.setTitle("6", for: .normal)
        //button.setImage(UIImage(systemName: "multiply"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonSix), for: .touchUpInside)
        return button
    }()
    @objc func singButtonSix () {
        addDigit("6")
    }


    lazy var buttonTwentyFive: UIButton = {
        let button = UIButton()
        //button.setTitle("6", for: .normal)
        button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonMinus), for: .touchUpInside)
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
        let button = UIButton()
        button.setTitle("п", for: .normal)
        //button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()


    lazy var buttonTwentySeven: UIButton = {
        let button = UIButton()
        button.setTitle("1", for: .normal)
        //button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonOne), for: .touchUpInside)
        return button
    }()
    @objc func singButtonOne() {
        addDigit("1")
    }

    lazy var buttonTwentyEight: UIButton = {
        let button = UIButton()
        button.setTitle("2", for: .normal)
        //button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonTwo), for: .touchUpInside)
        return button
    }()
    @objc func singButtonTwo() {
        addDigit("2")
    }

    lazy var buttonTwentyNine: UIButton = {
        let button = UIButton()
        button.setTitle("3", for: .normal)
        //button.setImage(UIImage(systemName: "minus"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonThree), for: .touchUpInside)
        return button
    }()
    @objc func singButtonThree() {
        addDigit("3")
    }

    lazy var buttonTherty: UIButton = {
        let button = UIButton()
        //button.setTitle("п", for: .normal)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonPlus), for: .touchUpInside)
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
        let button = UIButton()
        //button.setTitle("п", for: .normal)
        button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()


    lazy var buttonThertyTwo: UIButton = {
        let button = UIButton()
        button.setTitle("e", for: .normal)
        //button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()


    lazy var buttonThertyThree: UIButton = {
        let button = UIButton()
        button.setTitle("0", for: .normal)
        //button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonZero), for: .touchUpInside)
        return button
    }()
    @objc func singButtonZero() {
        addDigit("0")
    }

    lazy var buttonThertyFour: UIButton = {
        let button = UIButton()
        button.setTitle(",", for: .normal)
        //button.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    lazy var buttonThertyFive: UIButton = {
        let button = UIButton()
        //button.setTitle("п", for: .normal)
        button.setImage(UIImage(systemName: "equal.circle.fill"), for: .normal)
        button.backgroundColor = .green
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(singButtonEqual), for: .touchUpInside)
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
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonTwo.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(buttonOne.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonThree.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(buttonTwo.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonFour.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(buttonThree.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonFive.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.leading.equalTo(buttonFour.snp.trailing).offset(8)
            //make.trailing.equalTo(-30)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }



        // MARK: - line two

        buttonSix.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(30)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonSeven.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(buttonSix.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonEight.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(buttonSeven.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonNine.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(buttonEight.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonTen.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(buttonNine.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        // MARK: - line three

        buttonEleven.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.leading.equalTo(30)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonTwolfe.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.leading.equalTo(buttonEleven.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonThreeten.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.leading.equalTo(buttonTwolfe.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonFourten.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.leading.equalTo(buttonThreeten.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonFiveten.snp.makeConstraints { make in
            make.top.equalTo(130)
            make.leading.equalTo(buttonFourten.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }



        // MARK: - line four

        buttonSixten.snp.makeConstraints { make in
            make.top.equalTo(190)
            make.leading.equalTo(30)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonSeventen.snp.makeConstraints { make in
            make.top.equalTo(190)
            make.leading.equalTo(buttonSixten.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonEightten.snp.makeConstraints { make in
            make.top.equalTo(190)
            make.leading.equalTo(buttonSeventen.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonNineten.snp.makeConstraints { make in
            make.top.equalTo(190)
            make.leading.equalTo(buttonEightten.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonTwenty.snp.makeConstraints { make in
            make.top.equalTo(190)
            make.leading.equalTo(buttonNineten.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }



        // MARK: - line five

        buttonTwentyOne.snp.makeConstraints { make in
            make.top.equalTo(250)
            make.leading.equalTo(30)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonTwentyTwo.snp.makeConstraints { make in
            make.top.equalTo(250)
            make.leading.equalTo(buttonTwentyOne.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonTwentyThree.snp.makeConstraints { make in
            make.top.equalTo(250)
            make.leading.equalTo(buttonTwentyTwo.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonTwentyFour.snp.makeConstraints { make in
            make.top.equalTo(250)
            make.leading.equalTo(buttonTwentyThree.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonTwentyFive.snp.makeConstraints { make in
            make.top.equalTo(250)
            make.leading.equalTo(buttonTwentyFour.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }




        // MARK: - line six

        buttonTwentySix.snp.makeConstraints { make in
            make.top.equalTo(310)
            make.leading.equalTo(30)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonTwentySeven.snp.makeConstraints { make in
            make.top.equalTo(310)
            make.leading.equalTo(buttonTwentySix.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonTwentyEight.snp.makeConstraints { make in
            make.top.equalTo(310)
            make.leading.equalTo(buttonTwentySeven.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonTwentyNine.snp.makeConstraints { make in
            make.top.equalTo(310)
            make.leading.equalTo(buttonTwentyEight.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }


        buttonTherty.snp.makeConstraints { make in
            make.top.equalTo(310)
            make.leading.equalTo(buttonTwentyNine.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }




        // MARK: - line seven

        buttonThertyOne.snp.makeConstraints { make in
            make.top.equalTo(370)
            make.leading.equalTo(30)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonThertyTwo.snp.makeConstraints { make in
            make.top.equalTo(370)
            make.leading.equalTo(buttonThertyOne.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonThertyThree.snp.makeConstraints { make in
            make.top.equalTo(370)
            make.leading.equalTo(buttonThertyTwo.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonThertyFour.snp.makeConstraints { make in
            make.top.equalTo(370)
            make.leading.equalTo(buttonThertyThree.snp.trailing).offset(8)
            make.height.equalTo(40)
            make.width.equalTo(60)
        }

        buttonThertyFive.snp.makeConstraints { make in
            make.top.equalTo(370)
            make.leading.equalTo(buttonThertyFour.snp.trailing).offset(8)
            make.height.equalTo(40)
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

