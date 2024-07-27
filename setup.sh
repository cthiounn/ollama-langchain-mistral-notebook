sudo apt update && sudo apt install --yes lshw

if command -v ollama &> /dev/null
then
    echo "ollama command is available"
else
    echo "ollama command is not available : installing it "
    curl -fsSL https://ollama.com/install.sh | sh
    echo "ollama : end of install "
fi

if test -d "$HOME/.ollama"
then
    echo "~/.ollama directory exists"
else
    echo "~/.ollama directory does not exist"
    cd ~ && mc cp -r s3/$VAULT_TOP_DIR/.ollama .
fi
python3 -m venv .env
source .env/bin/activate
pip install -r requirements.txt
python3 -m ipykernel install --user --name=dotenv --display-name "Python (.env)"
ollama serve &
ollama run mistral-large &