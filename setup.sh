sudo apt update && sudo apt install --yes lshw

if command -v ollama &> /dev/null
then
    echo "ollama command is available"
else
    echo "ollama command is not available : installing it "
    curl -fsSL https://ollama.com/install.sh | sh
    echo "ollama : end of install "
fi

cd ~/work/ollama-langchain-mistral-notebook/
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
#python3 -m spacy download fr_core_news_lg
python3 -m ipykernel install --user --name=venv --display-name "Python (.venv)"

./load_run_ollama.sh &