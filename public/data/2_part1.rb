def palindrome?(word)
    word.downcase!()
    cleanw=word.gsub(/\W+/,"")
    return cleanw.reverse()==cleanw
end

def count_words(word)
    word.downcase!()
    words=word.split(/\s*\W+\s*/)
    return words.inject({}) {|h,v| h[v]=h[v].to_i+1; h}
end
