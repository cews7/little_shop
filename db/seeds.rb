# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = [{title: "Animals"},
              {title: "Cars"},
              {title: "Miscellaneous"},
              {title: "Apparel"}]

category_objects = categories.map do |category|
    puts "Creating #{category[:title]}"
    Category.create!(category)
end


items = [{title: "Miniature Pony", description: "This majestic little beauty will be the pet you always wanted and the life of any party. Who needs a cat?",
          price: 19999.99, image: "https://c1.staticflickr.com/7/6111/6869176460_795613ac05_b.jpg",
          category_id: category_objects[0].id, retired: false},
         {title: "Tiny Dog", description: "Ever wanted a guard dog that you could take with you? Ever got tired of having to recharge the batteries in your tazer? Get this little fella that can fit in your purse and never feel unsafe again.",
          price: 299.99, image: "http://www.dogbreedplus.com/dog_breeds/images/White-and-Grey-Pomsky.jpg",
          category_id: category_objects[0].id, retired: false},
         {title: "Tea Cup Pig", description: "Ever wonder where bacon bits come from?",
          price: 199.99, image: "http://www.newfoundreads.com/wp-content/uploads/2016/04/teacup-pig-1.jpg",
          category_id: category_objects[0].id, retired: false},
         {title: "Fuzzy Thing", description: "Don't know what this is? Us either, but you know you want it",
          price: 99.99, image: "http://www.thepetmatchmaker.com/wp-content/uploads/2014/10/tiny-animal-7.jpg",
          category_id: category_objects[0].id, retired: false},
         {title: "Finger Monkeys", description: "All the rage in Toronto. Come as a set so you can use them as wedding rings.",
          price: 149.99, image: "https://s-media-cache-ak0.pinimg.com/236x/e8/7a/10/e87a10102602330e9eca2027e99f1d30.jpg",
          category_id: category_objects[0].id, retired: false},
         {title: "Tiny Sportscar", description: "Tired of having a hard time finding parking downtown but still want to look cool in a sportscar? look no further.",
          price: 299.99, image: "https://s-media-cache-ak0.pinimg.com/236x/2f/cb/b9/2fcbb9a477214eb0c2cf912914b3f023.jpg",
          category_id: category_objects[1].id, retired: false},
         {title: "Mini Cooper", description: "I don't know about you but I've always wanted to reenact the scene in the Italian Job where they drive through the sewer in the Mini Coopers.",
          price: 23999.99, image: "http://static.usnews.rankingsandreviews.com/images/Auto/custom/13282/2017_MINI_Cooper_2.jpg",
          category_id: category_objects[1].id, retired: false},
         {title: "Tiny Racer", description: "For the middleaged man who still love RC Cars.",
          price: 79999.99, image: "https://s-media-cache-ak0.pinimg.com/564x/fa/ec/95/faec95496196ee63fcc61426d32ffb24.jpg",
          category_id: category_objects[1].id, retired: false},
         {title: "Tiny Fire Extinguisher", description: "For the pyro on the go. Never get caught lighting fires in the gas station bathrooms again.",
          price: 39.99, image: "https://rumorscity.com/wp-content/uploads/2014/09/These-Tiny-Items-Might-Be-More-Useful-Than-What-People-Think-01.jpg",
          category_id: category_objects[2].id, retired: false},
         {title: "Little Mermaid Keychain", description: "Want everyone to know your obsession with Disney? Look no further. No it doesnt come in any other characters.",
          price: 2.99, image: "https://d2npbuaakacvlz.cloudfront.net/images/uploaded/large-present/2013/5/28/the-only-way-to-make-disney-stuff-better-is-to-put-it-on-tiny-baby-items-updated-1369773643.jpg",
          category_id: category_objects[2].id, retired: false},
         {title: "Tiny Vase", description: "Who needs an entire boquet of roses? Our vases can only hold a single flower.",
          price: 79.99, image: "http://thumbs.ebaystatic.com/images/g/cGwAAOSwe8tXMcCX/s-l225.jpg",
          category_id: category_objects[2].id, retired: false},
         {title: "Tiny Painted Beans", description: "Want to appear fancier then you really are? Our intricately painted beans will be the hit of any party! *** Warning paint may contain traces of lead ***",
          price: 19.99, image: "http://www.goodfoodrecipes.com/wp-content/uploads/2014/06/osman-gazi.jpg",
          category_id: category_objects[2].id, retired: false},
         {title: "Tiny Baby Shoe", description: "Who could ever say no to someone wearing these adorable little things! *** Baby not included.***",
          price: 9.99, image: "http://shoesandmore.bnpb.biz/wp-content/uploads/LupineCanvasTinyStrappySandal-10004728-S.jpg",
          category_id: category_objects[3].id, retired: false},
         {title: "Small Coin Purse", description: "Who wants to spend an afternoon at an arcade? Not you! Our coin purses will comfortably hold 7 quarters guaranteeing you nothing more than 10 minutes of skeeball and a chance at those prizes in the counter that nobody wants.",
          price: 5.99, image: "http://2.bp.blogspot.com/-Fd-EFqN9QkQ/TbNp39mx7yI/AAAAAAAABoQ/7PncmW23bfA/s1600/3%2Blila%2Bcoin%2Bpurses%2B2.jpg",
          category_id: category_objects[3].id, retired: false},
         {title: "Tiny House", description: "Everything else you own is small, why not your house? As seen on TV.",
          price: 79999.99, image: "https://gbhli6sybc-flywheel.netdna-ssl.com/wp-content/uploads/Elm_1bc8d06f-e804-4ff9-87c3-87e592f0f401_grande.jpg",
          category_id: category_objects[2].id, retired: false},
         {title: "Tiny Cell Phone", description: "As if you didn't already have a hard enough time trying to find your cell phone.",
          price: 299.99, image: "http://wtuz.com/wp-content/uploads/2014/06/sold-out-icon-2.png",
          category_id: category_objects[2].id, retired: true},
         {title: "Tiny Umbrella", description: "Not to be confused with the ones you find in your drink, this amazing item can anything dry... as long as it isn't bigger than your average Barbie Doll.",
          price: 19.99, image: "http://wtuz.com/wp-content/uploads/2014/06/sold-out-icon-2.png",
          category_id: category_objects[2].id, retired: true},
         {title: "Tiny Flashlight", description: "For those moments where you only need about 4 cubic inches of light.",
          price: 39.99, image: "http://wtuz.com/wp-content/uploads/2014/06/sold-out-icon-2.png",
          category_id: category_objects[2].id, retired: true},

        ]


items.each do |item|
  puts "Creating #{item[:title]}"
  Item.create!(item)
end
