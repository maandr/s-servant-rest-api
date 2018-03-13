module Data.Dictionary (
      Dictionary(..)
    , dictAdd
    , dictFind
    , dictMap
) where

newtype Dictionary key value = Dictionary [(key, value)] deriving ( Show, Eq )

-- Dictionary<K, V> dictAdd(Dictionary<K, V> dict, K key, V value)
dictAdd :: Dictionary key value -> key -> value -> Dictionary key value
dictAdd (Dictionary dict) key value = Dictionary (dict ++ [(key, value)])

-- Optional<V> dictFind(Dictionary<K, V> dict, K key)
dictFind :: Eq key => Dictionary key value -> key -> Maybe value
dictFind (Dictionary []) _ = Nothing
dictFind (Dictionary ((key, value):dict)) search =
    if search == key
    then Just value
    else dictFind (Dictionary dict) search

-- Dictionary<K, B> dictMap(Func<A, B> mapper, Dictionary<K, A> dict)
dictMap :: (a -> b) -> Dictionary key a -> Dictionary key b
dictMap _ (Dictionary []) = Dictionary []
dictMap f (Dictionary ((key, value):dict)) = 
    let value' = f value
        Dictionary dict' = dictMap f (Dictionary dict)
    in Dictionary ((key, f value):dict')