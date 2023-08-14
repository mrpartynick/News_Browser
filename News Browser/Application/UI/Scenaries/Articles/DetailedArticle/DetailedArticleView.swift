//
//  DetailedArticleView.swift
//  News Browser
//
//  Created by Николай Циминтия on 13.08.2023.
//

import UIKit

class DetailedArticleView: UIViewController {
    public var article: Article?
    private let imageView = RoundedImageView()
    
    private let articleText: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isEditable = false
        tv.isScrollEnabled = true
        tv.font = .systemFont(ofSize: 16)
        return tv
    }()
    
    lazy private var toResourceButton: RoundedButton = {
        let b = RoundedButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("To resource", for: .normal)
        b.setTitleColor(.white, for: .normal)
        b.backgroundColor = .purple
        b.addTarget(self, action: #selector(goToResource(sender: )), for: .touchUpInside)
        return b
    }()
    
    private let imageViewOffset: CGFloat = 10
    
    //MARK: - init
    init(article: Article?) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        articleText.text = article?.title
        setupHierarchy()
        setConstraints()
    }
    
    //MARK: - setup hierarchy
    private func setupHierarchy() {
        view.addSubview(imageView)
        view.addSubview(articleText)
        view.addSubview(toResourceButton)
    }
    
    //MARK: - set constraints
    private func setConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: imageViewOffset).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -imageViewOffset).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.bounds.height/3).isActive = true
        
        articleText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: imageViewOffset).isActive = true
        articleText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: imageViewOffset).isActive = true
        articleText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -imageViewOffset).isActive = true
        articleText.heightAnchor.constraint(lessThanOrEqualToConstant: view.bounds.height/3).isActive = true
        
        toResourceButton.topAnchor.constraint(equalTo: articleText.bottomAnchor, constant: imageViewOffset).isActive = true
        toResourceButton.widthAnchor.constraint(equalToConstant: view.bounds.width/3).isActive = true
        toResourceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    //MARK: - go to resource
    @objc private func goToResource(sender: UIButton) {
        guard let stringURL = article?.urlToArticle,
              let url = URL(string: stringURL)
        else {return}
        UIApplication.shared.open(url)
    }
}
