module SpaceAge(Planet(..), ageOn) where

data Planet = Mercury | Venus | Earth | Mars | Jupiter | Saturn | Uranus | Neptune

ageOn :: (Fractional c, Num c) => Planet -> c -> c
ageOn Mercury seconds = seconds / 7600543.81992
ageOn Venus   seconds = seconds / 19414149.052176
ageOn Earth   seconds = seconds / 31557600
ageOn Mars    seconds = seconds / 59354032.69008
ageOn Jupiter seconds = seconds / 374355659.124
ageOn Saturn  seconds = seconds / 929292362.8848
ageOn Uranus  seconds = seconds / 2651370019.3296
ageOn Neptune seconds = seconds / 5200418560.0320005
