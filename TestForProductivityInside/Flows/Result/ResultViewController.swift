//
//  ResultViewController.swift
//  TestForProductivityInside
//
//  Created by Георгий Попандопуло on 29.01.2022.
//

import UIKit
import SnapKit

protocol ResultView: AnyObject {
    
}

final class ResultViewController: UIViewController {
    
     // MARK: - Internal Properties
     
    var presenter: ResultPresenter?
    
    // MARK: - Private Properties
    
    private let titleLabel = UILabel()
    private let resultLabel = UILabel()
    private let newGameButton = UIButton()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
        configureUI()
    }
}

// MARK: - Private Methods

private extension ResultViewController {
    func setupSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(resultLabel)
        view.addSubview(newGameButton)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(80)
            make.left.right.equalTo(titleLabel)
        }
        
        newGameButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.left.right.equalTo(titleLabel)
            make.height.equalTo(45)
        }
    }
    
    func configureUI() {
        titleLabel.text = "Congratulations"
        titleLabel.textAlignment = .center
        
        resultLabel.text = presenter?.getResultText() ?? ""
        resultLabel.textAlignment = .center
        
        newGameButton.setTitle("Start new game", for: .normal)
        newGameButton.backgroundColor = .blue
        newGameButton.layer.cornerRadius = 16
        newGameButton.addTarget(self, action: #selector(newGameButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func newGameButtonTapped() {
        presenter?.startNewGame()
    }
}

extension ResultViewController: ResultView {
        
}
