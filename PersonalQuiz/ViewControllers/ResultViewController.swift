//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var results: [Answer] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        print(results)
        let resultAnimal = identifyCommonTypeOfAnimal(from: results)
        print(resultAnimal)
        resultLabel.text = "Вы - \(resultAnimal.rawValue)!"
        definitionLabel.text = resultAnimal.definition
    }
}

extension ResultViewController {
    private func identifyCommonTypeOfAnimal(from: [Answer]) -> Animal {
        let animal: Animal
        var animalCount:[Int] = []
        
        let cats = results.filter { $0.animal == .cat }
        animalCount.append(cats.count)
        let dogs = results.filter { $0.animal == .dog }
        animalCount.append(dogs.count)
        let rabbit = results.filter { $0.animal == .rabbit }
        animalCount.append(rabbit.count)
        let turtle = results.filter { $0.animal == .turtle }
        animalCount.append(turtle.count)
        
        var commonAnimalCount = animalCount.sorted(by: >)
        
        switch commonAnimalCount.removeFirst() {
        case cats.count:
            animal = .cat
        case dogs.count:
            animal = .dog
        case rabbit.count:
            animal = .rabbit
        default:
            animal = .turtle
        }
        return animal
    }
}
