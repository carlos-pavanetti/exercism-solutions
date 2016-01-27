module House (rhyme) where

rhyme :: String
rhyme = concatMap strophe [0..11]

strophe :: Int -> String
strophe n = "This is the " ++ concatMap verse [n, n-1 .. 0]

verse :: Int -> String
verse i = noun ++ delim ++ "that " ++ action ++ end
    where
        (delim, end) = if i == 0 then (" ", ".\n\n") else ("\n", " the ")
        noun   = fst (subjects !! i)
        action = snd (subjects !! i)

type Noun = String
type Verb = String
subjects :: [(Noun, Verb)]
subjects = [
    ("house", "Jack built"),
    ("malt", "lay in"),
    ("rat", "ate"),
    ("cat", "killed"),
    ("dog", "worried"),
    ("cow with the crumpled horn", "tossed"),
    ("maiden all forlorn", "milked"),
    ("man all tattered and torn", "kissed"),
    ("priest all shaven and shorn", "married"),
    ("rooster that crowed in the morn", "woke"),
    ("farmer sowing his corn", "kept"),
    ("horse and the hound and the horn", "belonged to")]
