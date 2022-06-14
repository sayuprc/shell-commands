# ランダム値を返す
# 第一引数: ランダム値の長さ(デフォルト8)
# 第二引数: 個数(デフォルト1)
function rand
  set len $argv[1]
  set count $argv[2]

  if test -z "$len"
    set len 8
  end

  if test -z "$count"
    set count 1
  end

  if string match -rqv '^\d.*$' "$len"
    echo "Length must be numeric."
    return 1
  end

  if string match -rqv '^\d.*$' "$count"
    echo "Count must be numeric."
    return 1
  end

  cat /dev/urandom | base64 -w 0 | fold -w $len | head -n $count
end