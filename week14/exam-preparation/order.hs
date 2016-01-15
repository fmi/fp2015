data Order = Online Float Int Int | Offline Float 
type Orders = [Order]

isOnline :: Order -> Bool
isOnline (Online _ _ _) = True
isOnline _ = False

timeUntilReceiving :: Order -> Int
timeUntilReceiving (Online _ _ deliveryTime) = deliveryTime
timeUntilReceiving _ = error "No time for offline orders"

getPrice :: Order -> Float
getPrice (Online price _ _) = price
getPrice (Offline price) = price

totalPrice :: Orders -> Float
totalPrice = sum . (map getPrice)

onlineOrders :: Orders -> Int
onlineOrders = length . (filter isOnline)

isExpensive :: Order -> Bool
isExpensive = (>= 100) . getPrice

instance Show Order where
  show (Online price id deliveryTime) = "Online::" ++ show (price, id, deliveryTime)
  show (Offline price) = "Offline::" ++ show price

instance Eq Order where
  (==) (Online _ id1 _) (Online _ id2 ) = id1 == id2
  (==) (Offline price1) (Offline price) = price == price
