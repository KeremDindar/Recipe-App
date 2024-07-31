//
//  GridRecipe.swift
//  FoodRecipe
//
//  Created by Kerem on 29.05.2024.
//

import Foundation





struct Recipe: Identifiable {
    
    let id = UUID()
    let image: String
    let title: String
    let chef: Chef
    //Double
    let rating: Int
    let createdAt: Date
    let category: String
    let isPopular: Bool
    let prepareTime: TimeInterval
    let ingridents: [Ingrident]
    let procedures: [Procedure]
    let comment: String
    
    
}

struct Ingrident: Identifiable {
    
    let id = UUID()
    let image: String
    let name: String
    let amount: Int
}

struct Procedure: Identifiable {
    let id = UUID()
    let description: String
}

struct Chef: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let location: String
    
}




//let recipes = [
//    Recipe(image: "food1", title: "Traditional spare ribs baked", chef: Chef.init(name: "Laura wilson", image: "food1", location: "asdasd"), rating: 3, createdAt: .now, category: "Cereal", isPopular: true, prepareTime: 20, ingridents: [Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300),Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "adsasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300)], procedures: [Procedure(description: "asdasafkhdsöfgnsdjgnsdjkgnsdkgdasd"),Procedure(description: "asdasafkhdsöfgnsdjgnsdjkgnsdkgdasd")], comment: "znfkajsfnkajsfbnkjasfhkajsfasjkf"),
//    
//    Recipe(image: "food2", title: "Lamb chops with fruity couscous and mint", chef: Chef.init(name: "Laura wilson", image: "food1", location: "asdasd"), rating: 3, createdAt: .now, category: "Cereal", isPopular: true, prepareTime: 20, ingridents: [Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300),Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "adsasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300)], procedures: [Procedure(description: "dsklgnsdömgnvlksdnvlksdjgnlksdgjnklsdjglksdjg")], comment: "znfkajsfnkajsfbnkjasfhkajsfasjkf"),
//
//    Recipe(image: "food3", title: "spice roasted chicken with flavored rice", chef: Chef.init(name: "Rock", image: "food1", location: "asdasd"), rating: 3, createdAt: .now, category: "Cereal", isPopular: false, prepareTime: 20, ingridents: [Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300),Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "adsasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300)], procedures: [Procedure(description: "sdkgjsdklgjsdlkgmndskvnjdslkvhsdlkfgjhsdg")], comment: "znfkajsfnkajsfbnkjasfhkajsfasjkf"),
//    
//    Recipe(image: "food4", title: "Chinese style Egg fried rice with sliced pork fillet", chef: Chef.init(name: "Laura wilson", image: "food1", location: "asdasd"), rating: 3, createdAt: .now, category: "Fruit", isPopular: true, prepareTime: 20, ingridents: [Ingrident(image: "food1", name: "asdasd", amount: 300)], procedures: [Procedure(description: "lsdgjhfsdkljgjhsdlkgjklsdjgs")], comment: "znfkajsfnkajsfbnkjasfhkajsfasjkf"),
//    
//    Recipe(image: "food1", title: "asdasd", chef: Chef.init(name: "John", image: "food1", location: "asdasd"), rating: 3, createdAt: .now, category: "Spanish", isPopular: false, prepareTime: 20, ingridents: [Ingrident(image: "asdasd", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300),Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "adsasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300)], procedures: [Procedure(description: "sdgkjdslkgjsdlkgjsdlkghsdklgsd")], comment: "znfkajsfnkajsfbnkjasfhkajsfasjkf"),
//    
//    Recipe(image: "food2", title: "asdasd", chef: Chef.init(name: "Laura wilson", image: "food1", location: "asdasd"), rating: 3, createdAt: .now, category: "Spanish", isPopular: true, prepareTime: 20, ingridents: [Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300),Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "adsasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300)], procedures: [Procedure(description: "sdjghsdljkvndklsjhflsdvnsdlkhjfglsdg")], comment: "znfkajsfnkajsfbnkjasfhkajsfasjkf"),
//    
//    Recipe(image: "food3", title: "asdasd", chef: Chef.init(name: "Laura wilson", image: "food1", location: "asdasd"), rating: 3, createdAt: .now, category: "Fruit", isPopular: false, prepareTime: 20, ingridents: [Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300),Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "adsasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300)], procedures: [Procedure(description: "ldgnlsdjhglsdlksdvljkdahfjashfsajfhasf")], comment: "znfkajsfnkajsfbnkjasfhkajsfasjkf"),
//    
//    Recipe(image: "food4", title: "asdasd", chef: Chef.init(name: "Laura wilson", image: "food1", location: "asdasd"), rating: 3, createdAt: .now, category: "Cereal", isPopular: true, prepareTime: 20, ingridents: [Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300),Ingrident(image: "food1", name: "asdasd", amount: 300),Ingrident(image: "food1", name: "adsasd", amount: 300),Ingrident(image: "food1", name: "asdas", amount: 300)], procedures: [Procedure(description: "lkdsgjskjdlghsamfnasjkfnasömghsdgdnsögjhsdkgbsdjkghsdgjsdkjghs"),Procedure(description: "jfhaskjfhsdkjgnsdnösdgjhsdvnsdjgkdgfhwoghsdo")], comment: "znfkajsfnkajsfbnkjasfhkajsfasjkf")
//
//
//]




let recipes = [
    Recipe(
        image: "food1",
        title: "Traditional spare ribs baked",
        chef: Chef.init(
            name: "Laura Wilson",
            image: "food1",
            location: "Los Angeles, CA"
        ),
        rating: 4,
        createdAt: .now,
        category: "Cereal",
        isPopular: true,
        prepareTime: 20,
        ingridents: [
            Ingrident(image: "food1", name: "Strawberries", amount: 200),
            Ingrident(image: "food2", name: "Milk", amount: 200),
            Ingrident(image: "food3", name: "Yogurt", amount: 100),
            Ingrident(image: "food4", name: "Honey", amount: 50)
        ],
        procedures: [
            Procedure(description: "Combine all ingredients in a blender and blend until smooth."),
            Procedure(description: "Serve immediately and enjoy!")
        ],
        comment: "A delicious and refreshing smoothie perfect for breakfast or a snack."
    ),
    
    Recipe(
        image: "food2",
        title: "Lamb chops with fruity couscous and mint",
        chef: Chef.init(
            name: "Laura Wilson",
            image: "food2",
            location: "New York, NY"
        ),
        rating: 5,
        createdAt: .now,
        category: "Cereal",
        isPopular: true,
        prepareTime: 15,
        ingridents: [
            Ingrident(image: "food2", name: "Oats", amount: 100),
            Ingrident(image: "food1", name: "Almond Milk", amount: 200),
            Ingrident(image: "food3", name: "Blueberries", amount: 100),
            Ingrident(image: "food4", name: "Banana", amount: 1)
        ],
        procedures: [
            Procedure(description: "Combine oats and almond milk in a bowl."),
            Procedure(description: "Top with blueberries and sliced banana. Enjoy!")
        ],
        comment: "A quick and healthy breakfast option that's packed with nutrients."
    ),
    
    Recipe(
        image: "food3",
        title: "spice roasted chicken with flavored rice",
        chef: Chef.init(
            name: "Rock",
            image: "food3",
            location: "Chicago, IL"
        ),
        rating: 4,
        createdAt: .now,
        category: "Cereal",
        isPopular: false,
        prepareTime: 25,
        ingridents: [
            Ingrident(image: "food3", name: "Granola", amount: 150),
            Ingrident(image: "food1", name: "Greek Yogurt", amount: 200),
            Ingrident(image: "food2", name: "Honey", amount: 50),
            Ingrident(image: "food4", name: "Mixed Berries", amount: 100)
        ],
        procedures: [
            Procedure(description: "Layer granola, Greek yogurt, and mixed berries in a bowl."),
            Procedure(description: "Drizzle with honey and serve.")
        ],
        comment: "A delicious and satisfying granola parfait that's perfect for any time of day."
    ),
    
    Recipe(
        image: "food4",
        title: "Chinese style Egg fried rice with sliced pork fillet",
        chef: Chef.init(
            name: "Laura Wilson",
            image: "food4",
            location: "San Francisco, CA"
        ),
        rating: 3,
        createdAt: .now,
        category: "Fruit",
        isPopular: true,
        prepareTime: 10,
        ingridents: [
            Ingrident(image: "food4", name: "Apple", amount: 1),
            Ingrident(image: "food1", name: "Peanut Butter", amount: 50),
            Ingrident(image: "food2", name: "Granola", amount: 30)
        ],
        procedures: [
            Procedure(description: "Slice the apple into thin wedges."),
            Procedure(description: "Spread peanut butter on each apple slice and sprinkle with granola.")
        ],
        comment: "A simple and tasty snack that's perfect for a quick energy boost."
    ),
    
    Recipe(
        image: "food1",
        title: "Traditional spare ribs baked",
        chef: Chef.init(
            name: "John",
            image: "food1",
            location: "Miami, FL"
        ),
        rating: 4,
        createdAt: .now,
        category: "Spanish",
        isPopular: false,
        prepareTime: 30,
        ingridents: [
            Ingrident(image: "food1", name: "Chorizo", amount: 200),
            Ingrident(image: "food2", name: "Rice", amount: 150),
            Ingrident(image: "food3", name: "Bell Peppers", amount: 100),
            Ingrident(image: "food4", name: "Onion", amount: 1)
        ],
        procedures: [
            Procedure(description: "Cook chorizo in a pan until browned."),
            Procedure(description: "Add rice, bell peppers, and onion to the pan and cook until vegetables are tender.")
        ],
        comment: "A flavorful Spanish-inspired dish that's perfect for dinner."
    ),
    
    Recipe(
        image: "food2",
        title: "Lamb chops with fruity couscous and mint",
        chef: Chef.init(
            name: "Laura Wilson",
            image: "food2",
            location: "Austin, TX"
        ),
        rating: 5,
        createdAt: .now,
        category: "Spanish",
        isPopular: true,
        prepareTime: 35,
        ingridents: [
            Ingrident(image: "food2", name: "Paella Rice", amount: 200),
            Ingrident(image: "food1", name: "Shrimp", amount: 150),
            Ingrident(image: "food3", name: "Tomatoes", amount: 100),
            Ingrident(image: "food4", name: "Peas", amount: 50)
        ],
        procedures: [
            Procedure(description: "Cook paella rice in a large pan."),
            Procedure(description: "Add shrimp, tomatoes, and peas, and cook until shrimp is pink and cooked through.")
        ],
        comment: "A delicious and classic Spanish paella that's sure to impress."
    ),
    
    Recipe(
        image: "food3",
        title: "spice roasted chicken with flavored rice",
        chef: Chef.init(
            name: "Laura Wilson",
            image: "food3",
            location: "Seattle, WA"
        ),
        rating: 4,
        createdAt: .now,
        category: "Fruit",
        isPopular: false,
        prepareTime: 15,
        ingridents: [
            Ingrident(image: "food3", name: "Watermelon", amount: 300),
            Ingrident(image: "food1", name: "Feta Cheese", amount: 50),
            Ingrident(image: "food2", name: "Mint Leaves", amount: 10)
        ],
        procedures: [
            Procedure(description: "Cube the watermelon and place in a large bowl."),
            Procedure(description: "Crumble feta cheese over the watermelon and sprinkle with mint leaves.")
        ],
        comment: "A refreshing watermelon salad that's perfect for summer."
    ),
    
    Recipe(
        image: "food4",
        title: "Chinese style Egg fried rice with sliced pork fillet",
        chef: Chef.init(
            name: "Laura Wilson",
            image: "food4",
            location: "Portland, OR"
        ),
        rating: 5,
        createdAt: .now,
        category: "Cereal",
        isPopular: true,
        prepareTime: 20,
        ingridents: [
            Ingrident(image: "food4", name: "Quinoa", amount: 150),
            Ingrident(image: "food1", name: "Almonds", amount: 50),
            Ingrident(image: "food2", name: "Raisins", amount: 50),
            Ingrident(image: "food3", name: "Honey", amount: 30)
        ],
        procedures: [
            Procedure(description: "Cook quinoa according to package instructions."),
            Procedure(description: "Mix in almonds, raisins, and honey. Serve warm or chilled.")
        ],
        comment: "A nutritious and hearty quinoa bowl that's perfect for any meal."
    )
]



