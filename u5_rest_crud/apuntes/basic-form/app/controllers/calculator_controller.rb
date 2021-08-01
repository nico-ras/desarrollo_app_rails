# app/controllers/calculator_controller.rb
class CalculatorController < ApplicationController
    
    # sólo muestra el formulario
    
    def add
    end
    
    def compute_add
        first = params[:first].to_i
        last = params[:last].to_i
        @total = first + last
    end
end