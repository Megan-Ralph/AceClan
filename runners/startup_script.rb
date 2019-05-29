#create existing games
Game.where(name: "Apex Legends", description: "Update Me", forum_game_id: 47).first_or_create
Game.where(name: "Rainbow Six: Siege", description: "Update Me", forum_game_id: 52).first_or_create
Game.where(name: "Counter Strike: Global Offensive", description: "Update me", forum_game_id: 53).first_or_create
Game.where(name: "PUBG", description: "Update me", forum_game_id: 54).first_or_create
Game.where(name: "League of Legends", description: "Update me", forum_game_id: 70).first_or_create
