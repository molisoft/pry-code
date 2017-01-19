# Description

Pry-code 项目是基于pry的一个代码自动完成项目。

基于TCP协议（当然你也可以扩展为http，主要是为了让速度更快一些）。

# Prerequisites

- A Rails >= 3.0 Application

# Installation

Add this line to your gemfile:

	gem 'pry-code', :github => "molisoft/pry-code"

`bundle install` and enjoy pry-code.

# Usage

```
$ rails console  启动自动完成服务
[1] pry(main)> code-server
```
