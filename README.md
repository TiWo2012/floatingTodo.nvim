# floatingTodo.nvim

## important:
1. you have to have a .todo.md in your home folder.
1. only works on unix systems

## setup:

<details>
<summary>lazy.nvim</summary>

<br>
'''lua

{
    "TiWo2012/floatingTodo.nvim",
    config = function()
        require("floatingTodo").setup()
    end,
}'''
</details>

## my nvim config:
[ignitionvim](https://github.com/TiWo2012/ignitionvim)
