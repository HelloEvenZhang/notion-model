# Notion::Rb

一个能让你像ActiveModel一样增删改查Notion中的Databases和Pages的RubyGem

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
Notion.config.token = 'YOUR_NOTION_TOKEN'

# 或者
Notion.configure do |config|
  config.token = "YOUR_NOTION_TOKEN"
end

# 参考ActiveRecord处理数据的方法，以面向对象的方式操作数据
database = Notion::Database.find(your_database_id)

# 由于不同Database下的Page都可能有不同的属性
# 因此每个Page实例中的属性在获得pages时动态生成
pages = database.pages

# 把提供的选项转换为等价的JSON Query结构体
# 触发Http请求并从Response中检索对应的结果
# 为每个查询结果实例化对应的模型对象
some_pages = pages.where(options)

```
