= Welcome! =
Please be sure to write descriptive comments on your git commits!

= Conventions Herein =

== Code Lines ==
Any lines beginning with a right arrow are lines of code that can be run 
literally. The exception is portions of the line within square brackets, 
which should be descriptive and replaced appropriately. E.g.:
   > 'my_awesome_function([inputs_1], [input_2])'

= Structure and Usage =
There are in fact TWO projects in this repo; a Matlab code base and a Python code base.
Each codebase is organized in the following way (and is described in a rough 
workflow/hierarchy sequence).

== .\matlab_project\setup_paths_XYZ.m ==
Various scripts to load the desired path structure into your Matlab environment 
in order to more easily access the other files herein.

=== Usage ===
Just run the script by its name and it will load the desired path(s). E.g.:
   > 'setup_paths_all'
   
=== Development Guidelines ===
* All of these scripts MUST be runnable without inputs
* Please maintain these files as appropriate (when adding/removing directories).
* Feel free to add more setup_path_XYZ files to setup particular configs as needed.
* Please follow/maintain the rough tempalte in the existing files:
** Use 'filesep' to support multiple OS's
** Use relative paths from 'root' to support various arrangements of the repo
* Ideally all code should reside within the repo, unless there is a pressing
reason to do otherwise.
   
== Subdir: .\matlab_project\drivers ==
Various drivers that do some interesting 'end-to-end' coherent executions. Test 
and prototype drivers are ok to have here too (ideally they'll be clear named and 
described).

=== Usage ===
Just run the script by its name and it will load the desired path(s). E.g.:
   > 'driver'
No need to first run any setup_paths_XYZ files if you cd to the drivers directory 
first, as each driver file should execute the necessary add_path_XYZ script(s) at 
the top of its code.

== Subdir: .\matlab_project\utilities ==
Various functions that may take one or more inputs and return one or more outputs 
see the functions' headers for more info. Generally the intent here is to not call 
these functions directly though but rather to call the driver scripts that will 
call them internally.

== Subdir: .\data ==
Raw (public/downloaded/extracted) data files for use everywhere in this code 
repository. (MNIST, etc).
