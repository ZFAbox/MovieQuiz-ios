//
//  MovieQuizPresenter.swift
//  MovieQuiz
//
//  Created by Федор Завьялов on 24.12.2023.
//

import Foundation
import UIKit

final class MovieQuizPresenter {
    
    var questionAmount = 10
    private var currentQuestionIndex = 0
    
    func convert(model: QuizQuestion) -> QuizStepViewModel {
        
        let image = UIImage(data: model.image) ?? UIImage()
        let questionText: String = model.text
        let questionNumber: String = "\(currentQuestionIndex + 1)/\(questionAmount)"
        
        return QuizStepViewModel(image: image, question: questionText, questionNumber: questionNumber)
    }
    
    func isLastQuestion () -> Bool {
        currentQuestionIndex == questionAmount - 1
    }
    
    func resetQuestionIndex () {
        currentQuestionIndex = 0
    }
    
    func switchQuestionIndex () {
        currentQuestionIndex += 1
    }
    
}
