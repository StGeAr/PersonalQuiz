//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 3. Отобразить результаты в соответствии с этим животным
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var results: [Answer]!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        let resultAnimal = identifyCommonTypeOfAnimal()
        
        resultLabel.text = "Вы - \(resultAnimal.rawValue)!"
        definitionLabel.text = resultAnimal.definition
    }
}

extension ResultViewController {
    private func identifyCommonTypeOfAnimal() -> Animal {
        let animal: Animal
        var animalCount:[Int] = []
        
        let cats = results.filter { $0.animal == Animal.cat }
        animalCount.append(cats.count)
        let dogs = results.filter { $0.animal == Animal.dog }
        animalCount.append(dogs.count)
        let rabbit = results.filter { $0.animal == Animal.rabbit }
        animalCount.append(rabbit.count)
        let turtle = results.filter { $0.animal == Animal.turtle }
        animalCount.append(turtle.count)
        
        var commonAnimalCount = animalCount.sorted(by: >)
        
        switch commonAnimalCount.removeFirst() {
        case cats.count:
            animal = .dog
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
