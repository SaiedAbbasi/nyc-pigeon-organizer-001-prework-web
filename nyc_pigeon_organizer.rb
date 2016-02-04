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
## Nami's all powerful method
##The outcome will be all the arrays at the bottom tier of the final hash
## This takes in every pigeon's name... "Theo" & the three labels:
## :color, :gender, :lives
#Then
## creates an empty array to store the return value
## iterates into the original hash provided to us, 
## so we can access the final hash keys and values
####attribute_label = :gender, :lives, :color
####I've named the keys color, to help me remember but it takes in from purple to city hall
## It then checks to see if original data, for each attribute_label[key]... values include the pigeon's name
##For example, original_data[attribute_label][:male].include?("Theo")
## include? evaluates to true and tosses Theo into an array.  
## This array will be the value of our deepest hash


 

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
##This builds my hash
## Make empty hash... I called it a template 
## use method to return all pigeon names and iterate over each name
## Create the first teir of the hash by using my new hash name pigeon_template combined with the [] method to add a key... value equals another empty hash
## Use method to return all attribute labels iterate over each label
## line 77 is the magic of Nami's method
## It takes the hash we just added the names to and an empty hash
## And adds each label as a key into the new hash.  That's the left side of the equal sign.
## The right side will be an array of values... which is what Nami's method produces
## So find_what_you_want(names, labels) is called and names from the iteration on line 74 is plugged in
## and labels from line 76 is plugged in.  This runs her method and returns only the approriate array per hash key
## lastly return the new hash


def nyc_pigeon_organizer(original_data)  
  pigeon_template
  # holder = {}
  # pigeon_template.each do |name, attribute_set|
  #   attribute_set.each do |attribute_label, attribute|
  #     pigeon_template[name][attribute_label] = find_what_you_want(name, attribute_label) 
  #   end
  # end
  # pigeon_template
end    
#This method just returns the new hash again... it is the method the test wants to return the hash






# def collect_colors(original_data)
#    holder = []
#    holder = original_data[:color].keys.flatten
#    holder
# end
## returns an array with all colors
## [:purple, :grey, :white, :brown]
