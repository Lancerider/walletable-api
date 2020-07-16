USERS = [
  {
    email: "diego@able.co",
    first_name: "Diego",
    last_name: "Torres",
    phone: 4002019,
    password: "diego123"
  }, 
  {
    email: "julio@able.co",
    first_name: "Julio",
    last_name: "Navarro",
    phone: 4002020,
    password: "julio123"
  }
]

USERS.each do |user_data|
  p 'creating user'
  user = User.create(user_data)
  user.accounts.create(name: "BCP")
  user.accounts.create(name: "Scotianbank")
  user.accounts.create(name: "Interbank")
  user.accounts.create(name: "Bank of China")
  # enum category: [:food_and_drinks,:shopping,:services,:transport,:income,:others]

  user.accounts.each do |account|
    # May
    account.transactions.create(date: DateTime.new(2020,05,20),payee:"Tanta",amount: 1000,description: "Codeable's dinner",category:0)
    account.transactions.create(date: DateTime.new(2020,05,21),payee:"Complejo La 9",amount: 150,description: "Able's Soccer Day",category:5)
    account.transactions.create(date: DateTime.new(2020,05,22),payee:"Coolbox",amount: 200,description: "Headphones",category:1)
    # June
    account.transactions.create(date: DateTime.new(2020,06,20),payee:"KFC",amount: 1000,description: "Codeable's dinner",category:0)
    account.transactions.create(date: DateTime.new(2020,06,21),payee:"Complejo Chino",amount: 150,description: "Able's Soccer Day",category:5)
    account.transactions.create(date: DateTime.new(2020,06,22),payee:"Radioshack",amount: 200,description: "Headphones",category:1)
    # July
    account.transactions.create(date: DateTime.new(2020,07,20),payee:"Mc Donalds",amount: 1000,description: "Codeable's dinner",category:0)
    account.transactions.create(date: DateTime.new(2020,07,21),payee:"Able",amount: 150,description: "Workshop's",category:2)
    account.transactions.create(date: DateTime.new(2020,07,22),payee:"LATAM",amount: 2000,description: "Cohort's travel",category:3)
  end
end