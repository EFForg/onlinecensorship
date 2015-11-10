# Define Paperclip gem to uplaod images on windows OS .
#module Paperclip
#  class MediaTypeSpoofDetector
#    def spoofed?
#      false
#    end
#  end
#end

# Define Locale in Paperclip
Paperclip.interpolates :locale do |attachment, style|
  I18n.locale.to_s
end

# initializers images names by the model id (:id)
Paperclip.interpolates :parent_id do |a, s|
  a.instance.contract.id
end
