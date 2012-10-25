#encoding: utf-8
class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  attr_accessible :id, :city, :first_name, :gear, :last_name,  :level, :admin
  validates  :city, :first_name,  :last_name, :level, presence: true,
             :length => { :maximum => 25 }
  validates  :email, :presence => true, :uniqueness => true, :format => {with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/}
  #TODO: добавить поддержку gravatar

  validates :password, length:  { minimum: 6 }
  validates :level, :inclusion => {:in => ['Новичек','Любитель','Профи'], :message => 'Неверный уровень игры'}


  has_many :participations, :dependent => :destroy
  has_many :meetings, :through => :participations

end
