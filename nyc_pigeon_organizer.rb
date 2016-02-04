def original_data
original_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}
end


def collect_pigeon_names(original_data)
  original_data[:lives].values.flatten
end
## all pigeon names
## ["Theo", "Peter Jr.", "Lucky", ...]



def collect_attribute_labels(original_data)
  original_data.keys
end 
## [:color, :gender, :lives]



def find_what_you_want(name, attribute_label)

  attribute_ary = []
  
    original_data[attribute_label].each do |color, who|
   
     if original_data[attribute_label][color].include?(name)
        attribute_ary << color.to_s
     end
   end
 return  attribute_ary
end

### At this point I have my names, I have my labels and I have a 'machine' that spits out the arrays
### but I have no hash


def pigeon_template
  pigeon_template = {}
  collect_pigeon_names(original_data).collect do |names|
    pigeon_template[names] = {}
    collect_attribute_labels(original_data).collect do |labels|
      pigeon_template[names][labels] = find_what_you_want(names, labels)
    end
  end  
  pigeon_template 
end 

def nyc_pigeon_organizer(original_data)  
  pigeon_template
end    
