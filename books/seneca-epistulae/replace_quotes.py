import json
import re

def process_quotes():
    # Load the quotes list
    with open('quotes_list.json', 'r', encoding='utf-8') as f:
        quotes = json.load(f)
        
    # Load the Typst text file
    with open('text.typ', 'r', encoding='utf-8') as f:
        text_content = f.read()

    # Create a list of replacement pairs sorted by length descending 
    # to avoid partial matches replacing parts of larger matches
    quote_texts = [q['text'] for q in quotes]
    quote_texts.sort(key=len, reverse=True)
    
    # Simple replacement approach
    for quote_str in quote_texts:
        # We need to consider that during our scrape -> typst conversion, 
        # we might have modified characters. Let's make sure things like `<` aren't missed.
        # But wait, find_dirs ran on the HTML, json_to_typ escaped `<` and `>`.
        # So we need to map the quote_str to what it looks like in Typst.
        escaped_quote = quote_str.replace("<", r"\<").replace(">", r"\>").replace("*", r"\*").replace("_", r"\_")
        
        # If the quote spans multiple lines, it might match exactly. 
        # Let's see if we can do a simple string replacement.
        typst_block = f"\n#quote(block: true)[\n{escaped_quote}\n]\n"
        
        # Replace occurrences in the text
        if escaped_quote in text_content:
            # We want to make sure it's surrounded by newlines so we don't break paragraph formatting
            # Let's use a regex to replace it
            pattern = re.escape(escaped_quote)
            # Sometimes quotes might be embedded in paragraphs, or stand alone. 
            # In text.typ they should be paragraphs themselves if they were <dir> or inside a <p>.
            text_content = re.sub(pattern, typst_block.replace('\\', r'\\'), text_content)

    with open('text.typ', 'w', encoding='utf-8') as f:
        f.write(text_content)
        
    print("Replaced quotes with #quote(...) blocks.")

if __name__ == "__main__":
    process_quotes()