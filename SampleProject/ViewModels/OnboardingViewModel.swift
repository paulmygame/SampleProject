//
//  OnboardingViewModel.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 7/18/26.
//

import Foundation

final class OnboardingViewModel {
    let pages: [OnboardingModel] = [
        OnboardingModel(
            image: "onboarding1",
            title: "All your favorites",
            description: "Get all your loved foods in one place, you just place the order we do the rest."
        ),
        OnboardingModel(
            image: "onboarding2",
            title: "Order from nearby",
            description: "Choose your favorite restaurants and enjoy fast delivery anytime."
        ),
        OnboardingModel(
            image: "onboarding3",
            title: "Fast Delivery",
            description: "Your food arrives fresh and hot at your doorstep."
        ),
    ]
}
