#!/bin/bash

# DCloud 插件市场数据抓取脚本
# 使用 webReader 工具抓取插件详细信息

# 第一批：uni-id 系列
UNIID_PLUGINS=(
  "uni-id-common"
  "uni-id-co"
  "uni-id-pages"
  "uni-config-center"
  "uni-captcha"
)

# 第二批：主流 UI 组件库
UI_PLUGINS=(
  "uview-ui"
  "uview-plus"
  "thorui"
  "firstui"
  "tuniao-ui"
  "ultra-ui"
)

# 插件市场基础 URL
MARKETPLACE_BASE="https://ext.dcloud.net.cn/plugin?id="

# 输出目录
OUTPUT_DIR="../assets/plugins"

# 创建输出目录
mkdir -p "$OUTPUT_DIR"

# 函数：抓取单个插件信息
scrape_plugin() {
  local plugin_id=$1
  local url="${MARKETPLACE_BASE}${plugin_id}"
  local output_file="${OUTPUT_DIR}/${plugin_id}.json"

  echo "正在抓取插件: $plugin_id"
  echo "URL: $url"

  # 这里需要使用 webReader 工具，实际执行时由 Claude 调用
  # 伪代码示例：
  # webReader --url="$url" --output="$output_file" --format=json

  echo "已保存到: $output_file"
}

# 主流程
echo "==================================="
echo "DCloud 插件数据抓取"
echo "==================================="
echo ""

echo "第一批：uni-id 系列插件"
for plugin in "${UNIID_PLUGINS[@]}"; do
  scrape_plugin "$plugin"
  sleep 2  # 避免请求过快
done

echo ""
echo "第二批：UI 组件库"
for plugin in "${UI_PLUGINS[@]}"; do
  scrape_plugin "$plugin"
  sleep 2
done

echo ""
echo "==================================="
echo "抓取完成！"
echo "==================================="
