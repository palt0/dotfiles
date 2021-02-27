let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
      \   {'buns': ["'''", "'''"], 'filetype': ['python'], 'nesting': 0, 'input': ["3'"]},
      \   {'buns': ['"""', '"""'], 'filetype': ['python'], 'nesting': 0, 'input': ['3"']},
      \ ]
