#!/usr/bin/env python3

import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class SimplePublisher(Node):
    def __init__(self):
        # Initialize the Node with the name 'simple_publisher'
        super().__init__('simple_publisher')
        
        # Create a publisher on the 'yan_defter_topic' with a queue size of 10
        self.publisher_ = self.create_publisher(String, 'yan_defter_topic', 10)
        
        # Create a timer that triggers the timer_callback every 1.0 second
        timer_period = 1.0  # seconds
        self.timer = self.create_timer(timer_period, self.timer_callback)
        self.i = 0

    def timer_callback(self):
        # Create a new String message
        msg = String()
        # Format the message containing an iteration counter
        msg.data = f'Hello from Yan Defter! Message count: {self.i}'
        
        # Publish the message
        self.publisher_.publish(msg)
        
        # Log the published message to the console
        self.get_logger().info(f'Publishing: "{msg.data}"')
        self.i += 1

def main(args=None):
    # Initialize the ROS 2 Python client library
    rclpy.init(args=args)

    # Create an instance of our publisher node
    simple_publisher = SimplePublisher()

    try:
        # Spin the node so the callbacks process
        rclpy.spin(simple_publisher)
    except KeyboardInterrupt:
        pass
    finally:
        # Destroy the node explicitly
        simple_publisher.destroy_node()
        # Shutdown the ROS client library for Python
        rclpy.shutdown()

if __name__ == '__main__':
    main()
