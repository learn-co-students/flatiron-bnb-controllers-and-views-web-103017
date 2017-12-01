class Listing < ActiveRecord::Base
  belongs_to :neighborhood, required: true
  belongs_to :host, :class_name => "User"

  has_many :reservations
  has_many :reviews, :through => :reservations
  has_many :guests, :class_name => "User", :through => :reservations

  validates :address, presence: true
  validates :description, presence: true
  validates :listing_type, presence: true
  validates :price, presence: true
  validates :title, presence: true

  after_save :set_host_as_host
  before_destroy :unset_host_as_host

  def average_review_rating
    reviews.average(:rating)
  end

  private

  def self.available(start_date, end_date)

    listings = self.all

    # all_listings = Hash.new(0)
    # listings = Hash.new(0)
    openings = []

    listings.each do |listing|

      if listing != []
        is_available = true
        listing.reservations.each do |reservation|
          #binding.pry
          checkin = reservation.check_in
          checkout = reservation.check_out
          if [start_date.to_date, checkin].max < [end_date.to_date, checkout].min
            is_available = false
          end
        end
        if is_available
          openings << listing
        end
      end
    end
   openings
  end


  # it feels to me like part of what makes this complicated is
  # that we have column in the database called is_host,
  # but instead this could just be a method, and then rely on that..
  # not sure if it's worth the effort though.
  def unset_host_as_host
    # remove .id
    if Listing.where(host: host).where.not(id: id).empty?
      host.update(is_host: false)
    end
  end

  def set_host_as_host
    unless host.is_host?
      host.update(is_host: true)
    end
  end
end
