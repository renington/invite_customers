require './lib/intercom'

dublin_office = Intercom.new("Dublin", "53.339428", "-6.257664")
dublin_office.invite_customers_from_distance_and_txt 100.00, './data/customers.txt'