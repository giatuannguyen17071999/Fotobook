module CONSTANTS
  class User 
    MAX_LENGTH_NAME = 25
    MAX_LENGTH_EMAIL = 255
    MAX_LENGTH_PASS = 64
  end
  class Post
    MAX_LENGTH_TITLE = 140
    MAX_LENGTH_DESCRIPTION = 300
  end
  class Photo < Post
  end
  class Album < Post
  end
end