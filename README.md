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

# 把提供的选项转换为等价的JSON Query结构体
# 触发Http请求并从Response中检索对应的结果
# 为每个查询结果实例化对应的模型对象
some_pages = pages.where(options)
page = cycle_pages.first

# 由于不同Database下的Page都可能有不同的属性
# 因此每个Page实例中的属性需要动态生成
page.attributes
page.update(frequency: 'once')

```

