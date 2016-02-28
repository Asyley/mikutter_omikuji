#-*- coding: utf-8 -*-
Plugin.create :mikutter_reply do
  on_appear do |ms|
    ms.each do |m|

      if Time.now - m[:created] > 5
        next
      end

      if m.message.to_s =~ /^@#{Service.primary.user.to_s} おみくじ/
        m.favorite
        Service.primary.post :message => "@#{m.user.to_s} マジキチ", :replyto => m.message
      elsif m.message.to_s =~ /^@#{Service.primary.user.to_s} ACODC/
        m.favorite
        Service.primary.post :message => "@#{m.user.to_s} アリス・カータレットちゃんのおぱんつドリップコーヒー", :replyto => m.message
      elsif m.message.to_s =~ /^@#{Service.primary.user.to_s} SCODC/
        m.favorite
        Service.primary.post :message => "@#{m.user.to_s} シャロちゃんのおぱんつドリップコーヒー", :replyto => m.message
      end
    end
  end
end

