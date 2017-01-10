# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories.delete_all
items.delete_all



categories = [{title: "Animals", image: "http://wallpaper-gallery.net/images/animal/animal-13.jpg"},
              {title: "Cars", image: "http://media.caranddriver.com/images/16q1/665057/buick-avista-concept-dissected-design-powertrain-and-more-feature-car-and-driver-photo-666699-s-450x274.jpg"},
              {title: "Miscellaneous", image: "http://www.fitness.co.nz/media/catalog/product/m/i/miscellaneous-products-or-services.png"},
              {title: "Apparel", image: "https://financialtribune.com/sites/default/files/field/image/ordi/04%20India%20Apparel%20.jpg"},
              {title: "Office Supplies", image: "http://www.sbcomputers-office.com/suny-mwbe/images/iStock_000020657575_Small%20office%20supplies.jpg"},
              {title: "Technology", image: "http://emergingwarriors.com/wp-content/uploads/2016/05/14594978_WelcomeToTheFuture_03112013Final1.jpg"},
              {title: "Food", image: "http://whatdoclientsreallywant.com/wp-content/uploads/2013/12/small-things.jpg"},
             ]
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
          category_id: category_objects[5].id, retired: true},
         {title: "Tiny Umbrella", description: "Not to be confused with the ones you find in your drink, this amazing item can anything dry... as long as it isn't bigger than your average Barbie Doll.",
          price: 19.99, image: "http://wtuz.com/wp-content/uploads/2014/06/sold-out-icon-2.png",
          category_id: category_objects[2].id, retired: true},
         {title: "Tiny Flashlight", description: "For those moments where you only need about 4 cubic inches of light.",
          price: 39.99, image: "http://wtuz.com/wp-content/uploads/2014/06/sold-out-icon-2.png",
          category_id: category_objects[2].id, retired: true},
         {title: "Tiny Scissors", description: "And you thought safety scissors were hard yo use.",
          price: 9.99, image: "http://media-saver.com/wp-content/uploads/2013/09/1e923cf0ll-things-7.jpg?w=500&h=375",
          category_id: category_objects[4].id, retired: false},
         {title: "Tiny Lizzard", description: "The perfect pet to take anywhere, this little lizard will fit in your pocket!",
          price: 49.99, image: "http://media-saver.com/wp-content/uploads/2013/09/7fd59ff9l-things-17.jpg?w=500&h=375",
          category_id: category_objects[0].id, retired: false},
         {title: "Tiny Gameboy", description: "As if the screen already wasn't hard enoungh to see.",
          price: 59.99, image: "http://technabob.com/blog/wp-content/uploads/2008/02/papercraft_nintendo_ds2.jpg",
          category_id: category_objects[5].id, retired: false},
         {title: "Tiny Bike", description: "Did your husband accidentally shrink the kids again? This bike will be the perfect size for them.",
          price: 59.99, image: "http://blog.shoplet.com/wp-content/uploads/2011/10/tiny-side-climbing-mouse.jpg",
          category_id: category_objects[2].id, retired: false},
         {title: "Tiny Office Supply Set", description: "Who wouldn't want all of their office supplies to fit on a single board.",
          price: 59.99, image: "https://media.licdn.com/mpr/mpr/p/7/005/078/33d/15243f9.jpg",
          category_id: category_objects[4].id, retired: false},
         {title: "Tiny 3 inch Television", description: "Big Game? More like Tiny Game.",
          price: 999.99, image: "http://wtuz.com/wp-content/uploads/2014/06/sold-out-icon-2.png",
          category_id: category_objects[5].id, retired: true},
         {title: "Tiny Vacuum", description: "Good luck vacuuming a flore in under a day with this.",
          price: 129.99, image: "http://wtuz.com/wp-content/uploads/2014/06/sold-out-icon-2.png",
          category_id: category_objects[2].id, retired: true},
         {title: "Tiny Waterbottle", description: "Good for 3 gulps.",
          price: 13.99, image: "http://wtuz.com/wp-content/uploads/2014/06/sold-out-icon-2.png",
          category_id: category_objects[2].id, retired: true},
         {title: "Tiny Keyboard", description: "Perfect for your kids to practice their typing skills with.",
          price: 34.99, image: "http://wtuz.com/wp-content/uploads/2014/06/sold-out-icon-2.png",
          category_id: category_objects[5].id, retired: true},
         {title: "Tiny Pastries", description: "On a diet? These beauties are perfect for cheat days!",
          price: 8.99, image: "http://cdn.acidcow.com/pics/20100325/food_10.jpg",
          category_id: category_objects[6].id, retired: false},
         {title: "Tiny Sushi", description: "Perfect for the person who isn't sure if they like sushi.",
          price: 21.99, image: "http://farm4.staticflickr.com/3764/9461755305_de69a49769_z.jpg",
          category_id: category_objects[6].id, retired: false},
         {title: "Tiny Tacos", description: "Fun to say, more fun to eat!",
          price: 9.99, image: "http://cdn.foodbeast.com.s3.amazonaws.com/content/wp-content/uploads/2012/10/Tiny-Tacos.jpg",
          category_id: category_objects[6].id, retired: false},
         {title: "Tiny Gingerbread House", description: "Perfect for the Holidays!",
          price: 12.99, image: "http://i.imgur.com/zc7TCJg.jpg",
          category_id: category_objects[6].id, retired: false},
         {title: "Tiny Vegetables", description: "Your kids will never know they are eating vegetables!",
          price: 11.99, image: "http://randommization.com/wp-content/uploads/2010/09/miniature-food_3.jpg",
          category_id: category_objects[6].id, retired: false},
         {title: "Tiny Tape Dispenser", description: "So small you'll never be able to find it!",
          price: 4.99, image: "http://i.imgur.com/yrndkp9.jpg",
          category_id: category_objects[4].id, retired: false},
         {title: "Tiny Tape Measure", description: "Hope you don't need to meausre anything more than a foot.",
          price: 7.99, image: "https://images-na.ssl-images-amazon.com/images/I/418eTYRY3VL._SY300_.jpg",
          category_id: category_objects[2].id, retired: false},

        ]


items.each do |item|
  puts "Creating #{item[:title]}"
  Item.create!(item)
end
