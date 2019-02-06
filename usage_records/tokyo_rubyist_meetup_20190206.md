# [TOKYO RUBYIST MEETUP 2019-02-06](https://trbmeetup.doorkeeper.jp/events/85868)

## Pair Programming session
1. Replace `jbuilder` with `fast_jsonapi` for `/users` and `/user/:id` endpoint

1. Update lib/perfomance_test.rb to benchmark jbuilder vs fast_jsonapi serializer you just created :)

    1. open rails console
    1. `require 'performance_test'`
    1. `PerformanceTest.run` 

1. Go to Scout to find performance problems

    Login from [https://scoutapp.com/users/sign_in](https://scoutapp.com/users/sign_in)
    - username: rails_demo@scoutapp.com
    - password: password

1. Use DevTrace to improve perfomance
    
    ![image](https://d2ddoduugvun08.cloudfront.net/items/0j2W063D2Q0W2C3F1s37/Screen%20Recording%202019-02-05%20at%2001.04%20PM.gif?X-CloudApp-Visitor-Id=2836786&v=f11608df)
    NOTE: Because of the way Scout DevTrace works, you need to get html response. If you access to .json, you won't be able to see the DevTrace view.


## Git Revision
