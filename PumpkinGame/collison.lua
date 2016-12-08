function CheckCollision(object1X,object1Y,object1W,object1H, object2X,object2Y,object2W,object2H)
  return object1X < object2X + object2W and
         object2X < object1X + object1W and
         object1Y < object2Y + object2H and
         object2Y < object1Y + object1H
end