# this tool calculates XP amounts only and shouldn't interface with any LUA
# it should also never output to any pre-written files, this will destroy the project
# ! use wisely !

def calculate_xp(levels):
  xp = 100       # base xp needed
  xp_list = [xp] # list of levels + xp needed

  for level in range(2, levels + 1):
    if level <= 30:
      multiplier = 1.05
    elif level <= 50:
      multiplier = 1.09
    elif level <= 100:
      multiplier = 1.12
    elif level > 100:
      multiplier = 1
        
    xp *= multiplier
    xp_list.append(round(xp))

  return xp_list

def main():
  levels = int(input("Enter the number of levels: "))
  xp_list = calculate_xp(levels)

  output_choice = input("Do you want to save the output to a file? (yes/no): ").strip().lower()

  # pipes output into a valid LUA table! :D
  if output_choice == 'yes':
    filename = input("Enter the filename: ").strip() # remove any spaces from filename
    filename = filename + ".lua"                     # append .lua to filename
    with open(filename, 'w') as file:                # create and then open the file
      file.write("levelTable = {\n")                 # this creates a Lua table
      for level, xp in enumerate(xp_list, start=1):  # we walk through every level provided by xp_list
        file.write(f"  {xp},\n")                     # we write the XP amount and make a new line "\n"
      file.write("\n}")                              # once done we close the table with "}"
    print(f"Output has been written to {filename}")  # we print this, close the file and stop running
  else:
    print("\nXP required for each level:")
    for level, xp in enumerate(xp_list, start=1):
      print(f"Level {level}: {xp}")

if __name__ == "__main__":
  main()