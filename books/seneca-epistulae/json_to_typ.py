import json
import re

def roman_to_arabic(roman):
    roman_numerals = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000}
    result = 0
    prev_value = 0
    for char in reversed(roman.upper()):
        if char in roman_numerals:
            value = roman_numerals[char]
            if value < prev_value:
                result -= value
            else:
                result += value
            prev_value = value
        else:
            return roman # Fallback if there are non-Roman characters
    return str(result)

def convert():
    with open('epistulae.json', 'r', encoding='utf-8') as f:
        books = json.load(f)
        
    with open('text.typ', 'w', encoding='utf-8') as f:
        for book in books:
            for letter in book['letters']:
                arabic_num = roman_to_arabic(letter['number'])
                f.write(f"= {arabic_num}\n\n")
                for p in letter['paragraphs']:
                    # Normalize (1) to [1] for consistency
                    p = re.sub(r'\((\d+)\)', r'[\1]', p)
                    
                    # Typst treats < > [ ] * and _ as syntax elements. 
                    # For a Latin text scrape, it's safer to escape them or replace them
                    # if they are used as textual annotations.
                    p = p.replace("<", r"\<")
                    p = p.replace(">", r"\>")
                    p = p.replace("*", r"\*")
                    p = p.replace("_", r"\_")
                    # We leave brackets [ ] alone assuming they match regex or we escape inside them if needed. 
                    # Since our regex targets `\[\d+\]` explicitly, we don't escape `[` globally.
                    # But if the text has stray unmatched brackets, typst will complain about delimiters.
                    # A safer approach for Typst block strings without full parsing is to just
                    # emit the paragraph, but wait, the unclosed delimiter error was `[` or `<` ?
                    # Let's escape brackets that are NOT part of `[number]`:
                    # Temporarily protect [123] patterns
                    p = re.sub(r'\[(\d+)\]', r'__BRACKET__\1__BRACKET_END__', p)
                    p = p.replace("[", r"\[")
                    p = p.replace("]", r"\]")
                    # Restore them
                    p = p.replace("__BRACKET__", "[")
                    p = p.replace("__BRACKET_END__", "]")
                    
                    f.write(f"{p}\n\n")
                    
if __name__ == "__main__":
    convert()