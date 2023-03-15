# Notion::Rb

为了自动化管理Notion开发的小工具，主要用于处理Notion中的Database和Page的数据

## 安装

依赖：
- Ruby >= 2.6

安装命令：
```bash
gem install notion-rb
```

或在Gemfile中增加
```ruby
gem 'notion-rb'
```

然后执行
```bash
bundle install
```

## 使用
```ruby
# 先做好必要配置
Notion.configure do |config|
  config.xxx = xxx
end

# 参考ActiveRecord处理数据的方法
# A database has many pages
database = Notion::Database.find(database_id)
pages = database.pages

cycle_pages = pages.where(frequency: 'cycle')
page = cycle_pages.first

page.attributes
page.update(frequency: 'once')

```

