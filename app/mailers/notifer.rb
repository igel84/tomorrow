class Notifer < ActionMailer::Base
  default :from => "2morrowfest@eventfactory.ru"

  def email_friend(name, article, receiver_email)
		@name = name
		@article = article
		@sender_name = '2morrow/Завтра'
		mail :to => receiver_email, :subject => @name
  end
end
