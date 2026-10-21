using OhMyREPL

OhMyREPL.input_prompt!("> ", :magenta)
OhMyREPL.output_prompt!(">> ", :red)

count(x) = length(collect(x))
