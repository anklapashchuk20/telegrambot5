

require 'telegram/bot'
token = "5341770306:AAHd-aLNu59FIB86lOxTtr9PIElVUPQP-aU"

Question = ["Мені здається важким мистецтво наслідувати звички інших людей.",

            "Я б, мабуть, міг зіграти дурня, щоб привернути увагу або розважити оточуючих.",

            "З мене міг би вийти непоганий актор.",

            "Іншим людям іноді здається, що я переживаю щось глибше, ніж це є насправді.",

            "У компанії я рідко опиняюся у центрі уваги.",

            "У різних ситуаціях та у спілкуванні з різними людьми я часто веду себе зовсім по-різному.",

             "Я можу відстоювати лише те, в чому я щиро переконаний.",

             "Щоб досягти успіху у справах і у відносинах з людьми, я намагаюся бути таким, яким мене очікують бачити.",

             "Я можу бути дружнім з людьми, яких я не виношу.",

              "Я не завжди такий, яким здаюся." ]
 answer = ["вірно", "невірно"]  

points = 0
i = 0

res1 = 0
res2 = 0
res3 = 0 

 Telegram::Bot::Client.run(token) do |bot|
	bot.listen do |message|
		case message
            when Telegram::Bot::Types::CallbackQuery
            	 if message.data == 'info_button'
                        	bot.api.send_message(chat_id: message.from.id, text: "Що таке самоконтроль?" )
                        	bot.api.send_message(chat_id: message.from.id, text: "Самоконтроль - здатність контролювати свої емоції, думки й поведінку.")
                        	bot.api.send_message(chat_id: message.from.id, text: "Здатність людини приймати усвідомлені рішення та втілювати їх у життя. ")
                        	bot.api.send_message(chat_id: message.from.id, text: "Важливою особливістю людини – є здатність усвідомлювати, контролювати свої вчинки, тому що крім фізичного тіла, людина володіє духовною стороною існування.")
                        	
                        	button_lists = [
							Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Пройти опитування', callback_data: 'start_button'),
	                		Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Способи розвитку самоконтролю', callback_data: 'advice_button'),
	                		
	            		]
	            		markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: button_lists)
	            		bot.api.send_message(chat_id: message.from.id, text: "________________________________")
	            		bot.api.send_message(chat_id: message.from.id, text: '     Що Вас цікавить?', reply_markup: markup)
                        end
              if message.data == 'advice_button'
                        	bot.api.send_message(chat_id: message.from.id, text: "Способи розвитку самоконтролю" )
                        	bot.api.send_message(chat_id: message.from.id, text: "Найкращі прийоми для розвитку самоконтролю:")
                        	bot.api.send_message(chat_id: message.from.id, text: "1. Самообмеження ")
                        	bot.api.send_message(chat_id: message.from.id, text: "2. Розпізнавання емоцій")
                        	bot.api.send_message(chat_id: message.from.id, text: "3. Контроль емоцій")
                        	bot.api.send_message(chat_id: message.from.id, text: "4. Відточення навичок")
                        	
                        	button_lists = [
							Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Пройти опитування', callback_data: 'start_button'),
	                		Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Що таке самоконтроль?', callback_data: 'info_button'),
	                		
	            		]
	            		markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: button_lists)
	            		bot.api.send_message(chat_id: message.from.id, text: "________________________________")
	            		bot.api.send_message(chat_id: message.from.id, text: '    Що Вас цікавить?', reply_markup: markup)
                        end
                        if message.data == 'start_button'
						points = 0
						i = 0
						res1 = 0
						res2 = 0
						res3 = 0
						
			     		bot.api.send_message(chat_id: message.from.id, text: " #{Question[i]}")
			    		i = i + 1
						markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: answer)
				  
				bot.api.send_message(chat_id: message.from.id,text: "Якщо твердження ВІРНО або майже вірно по відношенню до Вас, то оберіть 'Вірно', якщо твердження НЕВІРНО, або ЧАСТІШЕ НЕВІРНО, - 'Невірно'", reply_markup: markup)
                        end

                        if message.data == 'stop_button'
                        	points = 0
							i = 0
							res1 = 0
							res2 = 0
							res3 = 0
                        	button_lists = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
							bot.api.send_message(chat_id: message.from.id, text: "Завершити!", reply_markup: button_lists)

				#НЕ ЗБЕРІГАЮТЬСЯ ДАНІ У ТАБЛИЦЮ
                        end

                        if message.data == 'pause_button'
                        	i = i - 1
                        	button_lists = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
			  				bot.api.send_message(chat_id: message.from.id, text: "Пауза", reply_markup: button_lists)
							bot.api.send_message(chat_id: message.from.id, text: "Ви зупинились на #{i} питанні.")
							button_lists = [
							Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Продовжити', callback_data: 'contin_button'),
	                		Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Завершити', callback_data: 'stop_button'),
	            				]
	            			markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: button_lists)
	            			bot.api.send_message(chat_id: message.from.id, text: 'Що обираєте?', reply_markup: markup)
                        end

                        if message.data == 'contin_button'
                        	bot.api.send_message(chat_id: message.from.id, text: " #{Question[i]}")
			    			i = i + 1
							markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: answer)
							bot.api.send_message(chat_id: message.from.id,text: "Якщо твердження ВІРНО або майже вірно по відношенню до Вас, то оберіть 'Вірно', якщо твердження НЕВІРНО, або ЧАСТІШЕ НЕВІРНО, - 'Невірно'", reply_markup: markup)
                        end
             when Telegram::Bot::Types::Message

			    if message.text == '/start'
			    
			    	bot.api.send_message(chat_id: message.from.id, text: "Привіт, #{message.from.first_name}!")
			    	bot.api.send_message(chat_id: message.from.id, text: "За допомогою цього тесту ви можете визначити рівень контролю при спілкуванні з іншими людьми. Уважно прочитайте десять речень, що описують реакції на деякі ситуації. Кожне з них оцініть як правильне чи неправильне для себе.")
			   		
			    		
			    		button_lists = [
				
							Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Пройти опитування', callback_data: 'start_button'),
		               		Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Що таке самоконтроль?', callback_data: 'info_button'),
		               		Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Способи розвитку самоконтролю', callback_data: 'advice_button'),
		                		
		           		]
		            		markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: button_lists)
		            		bot.api.send_message(chat_id: message.chat.id, text: 'Що Вас цікавить?', reply_markup: markup)
	            		
				end
			end
			
			 
		end
	end
