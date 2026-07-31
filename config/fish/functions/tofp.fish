function tofp --wraps='tfrs --exec tofu --prefix=-target= -- plan -out out.tfplan' --description 'alias tofp=tfrs --exec tofu --prefix=-target= -- plan -out out.tfplan'
    tfrs --exec tofu --prefix=-target= -- plan -out out.tfplan $argv
end
