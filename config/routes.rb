Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get("/", to: "home#welcome") 

  get("/about_us", to: "home#about_us") 

  # post("/process_contact", to: "home#process_contact")





end
