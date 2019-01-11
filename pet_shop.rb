


def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, swag)
  pet_shop[:admin][:total_cash] += swag
  return total_cash(pet_shop)
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number_of_pet_sales)
  pet_shop[:admin][:pets_sold] += number_of_pet_sales
  return nil
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, breed)
  pets_of_breed = []
  for pet in pet_shop[:pets]
    pets_of_breed << pet if pet[:breed] == breed
  end
  return pets_of_breed
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    return pet if pet[:name] == name
  end
  return nil
end

def remove_pet_by_name(pet_shop, pet_to_remove)
  #binding.pry
  new_pets = []
  for pet in pet_shop[:pets]
    new_pets << pet if pet[:name] != pet_to_remove
  end
  pet_shop[:pets] = new_pets
  return nil
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
  return nil
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
  return nil
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
  return nil
end

#Optional tasks

def customer_can_afford_pet(customer, the_pet)
  return customer[:cash] >= the_pet[:price] ? true : false
end

def sell_pet_to_customer(pet_shop, pet, customer)
  # check pet is not nil
  return false if pet == nil
  #check shop has the pet
  return false if find_pet_by_name(pet_shop, pet[:name]) == nil
  # check customer can afford pet
  return false if !customer_can_afford_pet(customer,pet)
  #remove pet from stock
  remove_pet_by_name(pet_shop, pet[:name])
  #increase shop cash
  add_or_remove_cash(pet_shop, pet[:price])
  #increase pets sold
  increase_pets_sold(pet_shop, 1)
  #decrease customer cash
  remove_customer_cash(customer, pet[:price])
  #add pet to customer
  add_pet_to_customer(customer, pet)
  return true
end
