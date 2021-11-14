# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Tag.create(name: "海鮮", theme_name: "生猛海鮮", collections: ["漁", "港", "海鮮", "海產", "蝦", "蟹", "魚"])
Tag.create(name: "打卡景點", theme_name: "網美打卡熱點", collections: ["網美", "拍照", "打卡", "少女"])
Tag.create(name: "海岸", theme_name: "海岸美景", collections: ["海洋", "海岸", "海景", "珊瑚", ""])
Tag.create(name: "露營", theme_name: "露營熱門", collections: ["露營", "野營", "野炊", "生火"])
Tag.create(name: "地標", theme_name: "", collections: ["燈塔", "碼頭", "鐵塔"])
Tag.create(name: "古早味", theme_name: "回憶古早味", collections: ["古早", "擔仔麵", "本土味", "眷村"])
Tag.create(name: "年度活動", theme_name: "年度活動", collections: ["一年一度", "年度"])
Tag.create(name: "彩虹", theme_name: "Rainbow Life", collections: ["彩虹", "七彩"])
Tag.create(name: "日式料理", theme_name: "品嚐日本風", collections: ["壽司", "拉麵", "大阪燒"])
Tag.create(name: "度假地點", theme_name: "放鬆度假去！", collections: ["民宿", "放鬆", "度假"])