class Asset < ActiveRecord::Base
  
  has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  
  attr_accessor :photo_base64
  
  before_validation :set_file
  def set_file
    StringIO.open(Base64.decode64(self.photo_base64)) do |data|
      data.original_filename = "image_name.png"
      data.content_type = "image/png"
      self.file = data
    end
  end
  
end


if defined? StringIO
  class StringIO
    attr_accessor :original_filename, :content_type
    def original_filename
      @original_filename ||= "stringio.png"
    end
    def content_type
      @content_type ||= "image/jpeg"
    end
  end
end