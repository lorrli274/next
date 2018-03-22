Building a chat system is a good way to dive into concurrency. We'll need a server component of a chat system that's able to maintain connections with multiple clients. This will allow us to distribute the messages it receives from one client to all the other connected clients.

![](https://github.com/Codevolve/next/blob/master/courses/community/Ruby%20Magic/assets/chat_example.png?raw=t)

Our chat server is running in the left tab. There are two chat clients running in the right tabs. Any message that is sent by a client will be received by all other clients.
