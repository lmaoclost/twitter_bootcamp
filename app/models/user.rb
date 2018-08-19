class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets

  has_many :active_relationship, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationship, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :followers, through: :passive_relationship, source: :follower
  has_many :following, through: :active_relationship, source: :followed
  
  def following?(other_user)
    # Esse método checa se um usuário está seguindo o outro.
    following.include? other_user
  end

  def follow!(other_user)
    # Este método criará o relacionamento entre um usuário e outro.
    #active_relationships.create(followed: other_user)
    following << other_user
  end

  def unfollow!(other_user)
    # Este método apagará o relacionamento entre um usuário e outro.
    following.destroy other_user
  end
end