# Project File Saver

This script saves the content of all project files to a single output file. It supports specifying output file name, ignoring specific files and folders, and scanning nested directories.

## Table of Contents

- [Features](#features)
- [Usage](#usage)
    - [Prerequisites](#prerequisites)
    - [Examples](#examples)
- [License](#license)


## Features

1. Save all project files content to an output file.
2. Exclude current bash script file.
3. Get output file name with `--output filename.md` argument.
4. Get ignored files and folders with `--ignore` argument.
5. Script scans all project files, including nested folders and files.
6. If the user does not define the `--output` file name, the default file name is "data.txt".

## Usage

### Prerequisites

To make the `save.sh` script executable on your computer, you need to set the executable permission for the file. You can do this using the `chmod` command. Here's how:

```sh
chmod +x save.sh
```

## Examples

#### Example 1: Save all project files as `data.txt`

This command will run the script without specifying any ignored files or output file name. The script will use the default output file name, `data.txt`.

```sh
test@computer % ./save.sh   
```

<br /> 

#### Example 2: Save all project files as `my_data.md`

This command will run the script and specify an output file name, `my_data.md`.

```sh
test@computer % ./save.sh   --output my_data.md
```

<br /> 

#### Example 3: Save all files except `__test__` folder and `package-lock.json` as `summarize.md`

This command will run the script, ignoring the `__test__` folder and `package-lock.json` file. The output file will be named `summarize.md`.

```sh
test@computer % ./save.sh  --ignore __test__ package-lock.json  --output summarize.md
```

<br /> 

#### Example 4: Save all files except specified files and folders as `placeholder_documentation.md`

This command will run the script, ignoring `node_modules`, `package.json`, `webpack.config.js`, `src`, `__tests__`, `package-lock.json`, and `LICENSE`. The output file will be named `placeholder_documentation.md`.

```sh
test@computer % ./save.sh --ignore node_modules package.json webpack.config.js src __tests__ package-lock.json LICENSE --output placeholder_documentation.md
```

<br /> 




