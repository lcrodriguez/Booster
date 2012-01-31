namespace :bootstrap do
      desc "Add the default account"
      task :default_user => :environment do
        Account.current = Account.find_by_name("Default");
        
        @userType = UserType.create( :name => "Administrador", :is_admin => true)
        
        User.create( :username => 'developer', :password => 'cabezon', 
          :email => "lcrodriguez@gmail.com", :first_name => "Leonardo", 
          :last_name => "Rodriguez", :user_type_id => 1 )
      end

      desc "Add the default account"
      task :default_account => :environment do
        Account.create :name => "Default", :subdomain => "sharp-mountain-372", :owner_email => "lcrodriguez@gmail.com", :description => "Description"
      end

      desc "Run all bootstrapping tasks"
      task :all => [:default_account, :default_user]
end