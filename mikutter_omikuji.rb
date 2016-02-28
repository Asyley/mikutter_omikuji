#-*- coding: utf-8 -*-
Plugin.create :mikutter_omikuji do
  on_appear do |ms|
    ms.each do |m|

      if Time.now - m[:created] > 5
        next
      end

      if m.message.to_s =~ /^@#{Service.primary.user.to_s} おみくじ/
        Service.primary.post :message => "@#{m.user.to_s} マジキチ", :replyto => m.message
      end
    end
  end
end
