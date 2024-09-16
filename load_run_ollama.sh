if test -d "$HOME/.ollama"
then
    echo "~/.ollama directory exists"
else
    echo "~/.ollama directory does not exist"
    cd ~ && mc cp -r s3/$VAULT_TOP_DIR/Caches/.ollama .
fi
ollama serve &
ollama run mistral-large &