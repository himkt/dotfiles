# mknippo: Create a nippo very easily

## Usage

Simply run `mknippo` on your shell.

## Feature

`mknippo` check your past nippo-s (up to 30 days) and pick up a latest one of them.
If a previous nippo was found, extract a todo-list and work-in-progress-list.
Then, mknippo takes over them and create the nippo for today.

## Example

I assume the nippo `2019:02:20.md` like below on the current directly.

```
# 2019:02:19.md

## Done
- nothing

## Work in Progress
- write a code of mknippo

## Todo
- write tests for dotfiles

## Trouble
- I forgot all

## TIL
- nothing
```

Then I run the command `mknippo`.
`mknippo` generates the nippo for today like below with the following message.
(I made this document on `Wednesday, February 20, 2019`.)

```zsh
$ mknippo
Found the previous nippo
created: 2019:02:20.md
$
$ cat 2019:02:20.md
# 2019:02:20.md
## Done
-

## Work in Progress
- write a code of mknippo
-

## Todo
- write tests for dotfiles
-

## Trouble
-

## TIL
-
```
