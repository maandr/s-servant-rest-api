module Data.Dictionary (
      Dictionary(..)
    , dictSize
    , dictAdd
    , dictRemove
    , dictFind
    , dictContains
    , dictMap
) where

newtype Dictionary key value = Dictionary [(key, value)] deriving ( Show, Eq )

dictSize :: Dictionary key value -> Int
dictSize (Dictionary dict) = length dict

-- Dictionary<K, V> dictAdd(Dictionary<K, V> dict, K key, V value)
dictAdd :: Dictionary key value -> key -> value -> Dictionary key value
dictAdd (Dictionary dict) key value = Dictionary (dict ++ [(key, value)])

dictRemove :: Eq key => Dictionary key value -> key -> Dictionary key value
dictRemove (Dictionary []) _ = Dictionary []
dictRemove (Dictionary ((key, value):dict)) removeKey =
    if key == removeKey
    then Dictionary dict
    else dictRemove (Dictionary (dict ++ [(key, value)])) removeKey

dictContains :: Eq key => Dictionary key value -> key -> Bool
dictContains (Dictionary []) _ = False
dictContains (Dictionary ((key, value):dict)) searchKey =
    key == searchKey || dictContains (Dictionary dict) searchKey

-- Optional<V> dictFind(Dictionary<K, V> dict, K key)
dictFind :: Eq key => Dictionary key value -> key -> Maybe value
dictFind (Dictionary []) _ = Nothing
dictFind (Dictionary ((key, value):dict)) searchKey =
    if key == searchKey
    then Just value
    else dictFind (Dictionary dict) searchKey

-- Dictionary<K, B> dictMap(Func<A, B> mapper, Dictionary<K, A> dict)
dictMap :: (a -> b) -> Dictionary key a -> Dictionary key b
dictMap _ (Dictionary []) = Dictionary []
dictMap f (Dictionary ((key, value):dict)) = 
    let value' = f value
        Dictionary dict' = dictMap f (Dictionary dict)
    in Dictionary ((key, f value):dict')