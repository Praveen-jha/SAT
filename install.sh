#/bin/bash

folder="dabs"

version=$(python -c "import sys; print(sys.version_info[:])" 2>&1)
if [[ -z "$version" ]]; then
    echo "Python not found"
    exit 1
fi

major=$(echo $version | cut -d ',' -f 1 | tr -d '(')
minor=$(echo $version | cut -d ',' -f 2)

if [[ $major -lt 3 || $minor -lt 9 ]]; then
    echo "Python 3.9 or higher is required"
    exit 1
fi

cd $folder
pip install -r requirements.txt --break-system-packages  # if you are using python version 3.10 then --break-system-packages not required else you have to put it hello
python main.py