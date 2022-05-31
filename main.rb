

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
 answer = ["_вірно✅", "_невірно❌"]  

result = 0
i = 0


 Telegram::Bot::Client.run(token) do |bot|
	bot.listen do |message|
		case message
            when Telegram::Bot::Types::CallbackQuery
            	 if message.data == 'start_button'
						result = 0
						i = 0
			     		bot.api.send_message(chat_id: message.from.id, text: " #{Question[i]}")
			    		i = i + 1
						markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: answer)
				  
				bot.api.send_message(chat_id: message.from.id,text: "Якщо твердження ВІРНО або майже вірно по відношенню до Вас, то оберіть 'Вірно', якщо твердження НЕВІРНО, або ЧАСТІШЕ НЕВІРНО, - 'Невірно'", reply_markup: markup)
                        end

                        if message.data == 'stop_button'
                        	result = 0
							i = 0
							
                        	button_lists = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
							bot.api.send_message(chat_id: message.from.id, text: "Завершити!", reply_markup: button_lists)

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
							bot.api.send_message(chat_id: message.from.id,text: "Вам пропонуються твердження щодо Ваших реакцій на різні життєві ситуації. Якщо твердження вірне або майже вірне по відношенню до вас, то натисніть 'Вірно', якщо твердження невірне, або частіше неправильне, то  натисніть 'Невірно'.", reply_markup: markup)
                        end
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

			if message.text == '_вірно✅'
				if i == 2 || i == 3 || i == 4 || i == 6 || i == 8 || i == 9 || i == 10 
				result = result + 1
				
			    end
			    tmp = true
			end    

			if message.text == '_невірно❌'
				if i == 1 || i == 5 || i == 7 
				result = result + 1
				
			    end
			tmp = true
			end
			if message.text == '/help'
					    button_lists = [
						Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Призупинити тест', callback_data: 'pause_button'),
						Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Продовжити тест ▶', callback_data: 'contin_button'),
				        Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Завершити! ', callback_data: 'stop_button'),
				         ]
				            		markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: button_lists)
				            		bot.api.send_message(chat_id: message.chat.id, text: 'Що обираєте?', reply_markup: markup)
						end
			if message.text =~ /^\/stop/
	        	result = 0
	             i = 0
				
			button_lists = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
			    	bot.api.send_message(chat_id: message.chat.id,text: "Завершити!", reply_markup: button_lists)
			end

			if message.text =~ /^_/ && i < 10
				bot.api.send_message(chat_id: message.from.id, text: " #{Question[i]}")

				i = i + 1
				tmp = false
			end
			

			if i == 10 && tmp == true
							
				 button_lists = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
				 bot.api.send_message(chat_id: message.chat.id,text: "Ви пройшли тест!", reply_markup: button_lists)
				 bot.api.send_message(chat_id: message.from.id, text: " #{result}")
						
					if result >6
						bot.api.send_message(chat_id: message.from.id, text: "У Вас високий комунікативний контроль. Ви легко входите в будь-яку роль, гнучко реагуєте на зміну ситуації, добре відчуваєте і можете передбачати враження, яке справляєте на оточуючих")
								button_lists = [
				                			Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Завершити!', callback_data: 'stop_button'),
				            			]
				            			markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: button_lists)
				            			bot.api.send_message(chat_id: message.chat.id, text: 'Що обираєте?', reply_markup: markup)
					end

							
					if result >= 4 && result <= 6
						bot.api.send_message(chat_id: message.from.id, text: "У Вас середній рівень комунікативного контролю. Ви щирі, але не стримані у своїх емоційних проявах.")
								button_lists = [
				                		
				                	Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Завершити! ', callback_data: 'stop_button'),
				            			]
				            			markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: button_lists)
				            			bot.api.send_message(chat_id: message.chat.id, text: 'Що обираєте?', reply_markup: markup)
							end

					if result < 4
								bot.api.send_message(chat_id: message.from.id, text: "У Вас низький комунікативний контроль, тобто Ваша поведінка стійка і Ви не вважаєте за потрібне змінюватися в залежності від ситуації. Ви здатні до щирого розкриття у спілкуванні, тому деякі Вважають вас «незручним» через вашу прямолінійність.")
								button_lists = [
				                		
				                			Telegram::Bot::Types::InlineKeyboardButton.new(text: 'Завершити! ', callback_data: 'stop_button'),
				            			]
				            			markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: button_lists)
				            			bot.api.send_message(chat_id: message.chat.id, text: 'Що обираєте?', reply_markup: markup)
					end
							
			end


		end
	end
end	
