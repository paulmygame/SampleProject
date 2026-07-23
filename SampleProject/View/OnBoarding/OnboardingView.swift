//
//  OnboardingView.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 7/18/26.
//

import UIKit

class OnboardingView: UIViewController {
    
    private let viewModel = OnboardingViewModel()
    private var currentPage = 0
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.isPagingEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(
            OnboardingCollectionViewCell.self,
            forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier
        )
        return collection
    }()
    
    private let pageControl: UIPageControl = {
        let page = UIPageControl()
        page.currentPage = 0
        page.pageIndicatorTintColor = UIColor.systemGray4
        page.currentPageIndicatorTintColor = UIColor.systemOrange
        return page
    }()

    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor.systemOrange
        button.layer.cornerRadius = 14
        return button
    }()
    
    private let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        setupActions()
        pageControl.numberOfPages = viewModel.pages.count
    }
    
}

// MARK: - Setup

private extension OnboardingView {
    
    func setupViews() {
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        view.addSubview(skipButton)
    }

    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(pageControl.snp.top).offset(-20)
        }

        pageControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nextButton.snp.top).offset(-24)
        }

        nextButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(24)
            make.height.equalTo(56)
            make.bottom.equalTo(skipButton.snp.top).offset(-16)
        }

        skipButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }

    }

    func setupActions() {

        nextButton.addTarget(
            self,
            action: #selector(nextTapped),
            for: .touchUpInside
        )

        skipButton.addTarget(
            self,
            action: #selector(skipTapped),
            for: .touchUpInside
        )

    }

}

extension OnboardingView: UICollectionViewDelegate,
                           UICollectionViewDataSource,
                           UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {

        viewModel.pages.count

    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OnboardingCollectionViewCell.identifier,
            for: indexPath
        ) as? OnboardingCollectionViewCell else {

            return UICollectionViewCell()

        }

        cell.configure(with: viewModel.pages[indexPath.row])

        return cell

    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        CGSize(width: collectionView.frame.width,
               height: collectionView.frame.height)

    }

}

private extension OnboardingView {

    @objc func nextTapped() {

        if currentPage < viewModel.pages.count - 1 {

            currentPage += 1

            let indexPath = IndexPath(item: currentPage, section: 0)

            collectionView.scrollToItem(
                at: indexPath,
                at: .centeredHorizontally,
                animated: true
            )

            updatePage()

        } else {

            UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")

            let home = HomeView()

            navigationController?.setViewControllers(
                [home],
                animated: true
            )

        }

    }

    @objc func skipTapped() {

        UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
        let home = HomeView()
        navigationController?.setViewControllers(
            [home],
            animated: true
        )

    }

    func updatePage() {

        pageControl.currentPage = currentPage
        let title = currentPage == viewModel.pages.count - 1 ? "Get Started" : "Next"
        nextButton.setTitle(title, for: .normal)

    }

}

extension OnboardingView {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)

        currentPage = page

        updatePage()

    }

}
