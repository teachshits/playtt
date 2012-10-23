#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Player.create( email: 'vitaliy@vasko.com',password: 'vasko1', level: 'Новичек',password_confirmation: 'vasko1', first_name: 'Виталий', last_name:'Васько', gear: 'гладкая/антиспин', city: 'Бровары')
  Player.create( email: 'katkov@ivan.com', level: 'Профи', password: 'katkov', password_confirmation: 'katkov', first_name: 'Ivan', last_name:'Katkov',
  gear: 'неизвестно', city: 'Полтава')
  Player.create( email: 'me@lessless.pp.ua', level: 'Слабый новичек', password: '123457', password_confirmation: '123457', first_name: 'Евгений', last_name:'Куртов', gear: 'гладкие', city: 'Бровары', admin: true)


  Place.create(name: 'Ракетка', description: 'Лучший клуб Киева', address: 'просп. Тычины, 15', city:'Киев')
  Place.create(name: 'Эксперт', description: 'Дарница, возле Детского мира', address: 'ул. Андрея Малышко, 5', city:'Киев')
  Place.create(name: 'Энергия', description: 'наиболее развитый клуб Полтавы', address: ' ул.Коваля,3', city:'Полтава')
  Place.create(name: 'Игровой Портал', description: 'ТЦ Форум, 5ый этаж', address: 'Короленко 60', city:'Бровары')

