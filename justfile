pyenv := ".tox/py311"

test *params='':
    {{pyenv}}/bin/coverage erase
    {{pyenv}}/bin/coverage run -m pytest --pdb -s {{params}}
    {{pyenv}}/bin/coverage report

vreg:
    tox run -e vreg

doc:
    tox run -e doc

wiki:
    tox run -e wiki

tox:
    tox run

release:
    ./scripts/make_release

htmlcov:
    {{pyenv}}/bin/coverage html
    xdg-open ./htmlcov/index.html
    
types:
    {{pyenv}}/bin/mypy --check-untyped-defs pyprland

