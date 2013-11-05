class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :point_total # add point_total as a reader to access the variable (when seeding)

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    order("point_total DESC") #modified this to reflect the indexing (made the read much quicker vs. going through all database fields)
    # joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')
  end

  def sum_karma
    self.karma_points.sum(:value) #used this to seed the new field - after that, it's kind of done
  end

  def total_karma
    self.point_total # added this as a new method
  end

  def self.page(page_num, num_of_results = 10)
    # page_num = 1 unless page_num
    limit(num_of_results).offset((page_num - 1)*num_of_results)


    # if page_num == nil
    #   limit(num_of_results).offset(0)
    # else
    #   limit(num_of_results).offset((page_num - 1)*num_of_results)
    # end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.number_of_pages(num_of_results_per_page)
    (all.count/num_of_results_per_page.to_f).ceil
  end
end
