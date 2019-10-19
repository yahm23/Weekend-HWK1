
def pet_shop_name(petshop_hash)
  return petshop_hash[:name]
end


def total_cash(petshop_hash)
  return cash_sum = petshop_hash[:admin][:total_cash]
end


def add_or_remove_cash(petshop_hash,amount)
  new_amount = petshop_hash[:admin][:total_cash]+amount
  petshop_hash[:admin][:total_cash] = new_amount
end


def pets_sold(petshop_hash)
  return petshop_hash[:admin][:pets_sold]
end


def increase_pets_sold(petshop_hash,amount)
  petshop_hash[:admin][:pets_sold] += amount
end


def stock_count(petshop_hash)
  return petshop_hash[:pets].length
end


def pets_by_breed(petshop_hash,breed)
  breed_array =[]
  for pet in petshop_hash[:pets]
    if breed == pet[:breed]
      breed_array.push(breed)
    end
  end
  return breed_array
end

def find_pet_by_name(petshop_hash,name)
  for pet in petshop_hash[:pets]
    if name == pet[:name]
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(petshop_hash, name)
  for pet in petshop_hash[:pets]
    index = petshop_hash[:pets].index(pet)
    #p index
    if name == pet[:name]
      #p petshop_hash[:pets][index]
      petshop_hash[:pets].delete_at(index)
      p petshop_hash[:pets]
    end
  end
end




def add_pet_to_stock(petshop_hash,new_pet)
  petshop_hash[:pets].push(new_pet)
end

def customer_cash(person_hash)
  return person_hash[:cash]
end

def remove_customer_cash(person_hash, value)
  person_hash[:cash]= person_hash[:cash] - value
end

def customer_pet_count(person_hash)
  return person_hash[:pets].length
end

def add_pet_to_customer(customer_hash,newpet_hash)
  customer_hash[:pets].push(newpet_hash)
end
# customer = @customers[0]
# add_pet_to_customer(customer, @new_pet)
# p @customers[0]

# => OPTIONAL

def customer_can_afford_pet(customer_hash,pet_hash)
  budget = customer_hash[:cash]
  pet_cost = pet_hash[:price]

  if budget >= pet_cost
    return true
  else
    return false
  end
end


def sell_pet_to_customer(petshop_hash, pet_hash, customer_hash)
  if pet_hash != nil
    budget = customer_hash[:cash]
    pet_cost = pet_hash[:price]
    index = petshop_hash.index(pet_hash)
    if budget >= pet_cost
      petshop_hash[:pets].delete(index)
      customer_hash[:cash] -= pet_cost
      customer_hash[:pets].push(pet_hash)
      petshop_hash[:admin][:pets_sold] += 1
      petshop_hash[:admin][:total_cash] += pet_cost
    end
  end
end
