function tfp --wraps='tfrs --exec terraform --prefix=-target= -- plan -out state.out -compact-warnings' --description 'alias tfp=tfrs --exec terraform --prefix=-target= -- plan -out state.out -compact-warnings'
    tfrs --exec terraform --prefix=-target= -- plan -out state.out -compact-warnings $argv
end
