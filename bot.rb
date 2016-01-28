#!/usr/bin/ruby

require 'telegram/bot'


token = 'API_KEY'
pwner = 'NOME'

Telegram::Bot::Client.run(token) do |bot|
bot.listen do |message|
  case message
  when Telegram::Bot::Types::InlineQuery
    results = [
      Telegram::Bot::Types::InlineQueryResultArticle
        .new(id: 1, title: 'whoami', message_text: "inl1ne by #{pwner}"),
      Telegram::Bot::Types::InlineQueryResultArticle
        .new(id: 2, title: 'who r u', message_text: "Hello, #{message.from.first_name} #{message.from.last_name}\n user:#{message.from.username}"),

    ]
    bot.api.answer_inline_query(inline_query_id: message.id, results: results)
  when Telegram::Bot::Types::Message
    bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.last_name}!")
  end
end
end
