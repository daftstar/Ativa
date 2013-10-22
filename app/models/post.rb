class Post < ActiveRecord::Base
  belongs_to :phase
  belongs_to :project
  belongs_to :user
  default_scope order('created_at DESC')
  before_save :set_defaults

  mount_uploader :attachment, ImageUploader

 #hardcoded
  # def snippet()
  #   message.truncate(20)
  # end

#more dynamic, 10 is overwritten by any argument passed in
  # def snippet(len=10)
  #   message.truncate(len)
  # end

  def snippet(options={})
    if options.has_key? :length
      message.truncate(options[:length])
    else
      message.truncate(20)
    end
  end

  private

    def set_defaults
      if self.title == "" then self.title = "Post #{rand(255)}" end
      if self.message == "" then self.message = "(no message)" end
    end

end
