-- loops through "arabic, english" pairs (one per line) from a file that defaults to dictionary.txt
-- and prints out a LuaTex flashcard block for each

function MakeFlashCards()
  local csvfile = require("./luarocks/5.3/lua-csv/csv")
  local data = csvfile.open("dictionary.csv")
  local arabic
  local english
  local line

  for line in io.lines(data) do
    for arabic, english in line:gmatch("(%w+),(%w+)") do
      tex.sprint("\\begin{flashcard}\n" ..
                "{\\textarabic}\n" ..
                "  {" .. arabic:gsub("%s+", "") .. "}\n" ..
                "  " .. english:gsub("%s+", "") .. "\n" ..
                "\\end{flashcard}\\smallskip")
    end
  end
  
return { makeflashcards = MakeFlashCards }
end