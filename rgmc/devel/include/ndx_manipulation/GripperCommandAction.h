// Generated by gencpp from file ndx_manipulation/GripperCommandAction.msg
// DO NOT EDIT!


#ifndef NDX_MANIPULATION_MESSAGE_GRIPPERCOMMANDACTION_H
#define NDX_MANIPULATION_MESSAGE_GRIPPERCOMMANDACTION_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <ndx_manipulation/GripperCommandActionGoal.h>
#include <ndx_manipulation/GripperCommandActionResult.h>
#include <ndx_manipulation/GripperCommandActionFeedback.h>

namespace ndx_manipulation
{
template <class ContainerAllocator>
struct GripperCommandAction_
{
  typedef GripperCommandAction_<ContainerAllocator> Type;

  GripperCommandAction_()
    : action_goal()
    , action_result()
    , action_feedback()  {
    }
  GripperCommandAction_(const ContainerAllocator& _alloc)
    : action_goal(_alloc)
    , action_result(_alloc)
    , action_feedback(_alloc)  {
  (void)_alloc;
    }



   typedef  ::ndx_manipulation::GripperCommandActionGoal_<ContainerAllocator>  _action_goal_type;
  _action_goal_type action_goal;

   typedef  ::ndx_manipulation::GripperCommandActionResult_<ContainerAllocator>  _action_result_type;
  _action_result_type action_result;

   typedef  ::ndx_manipulation::GripperCommandActionFeedback_<ContainerAllocator>  _action_feedback_type;
  _action_feedback_type action_feedback;





  typedef boost::shared_ptr< ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> const> ConstPtr;

}; // struct GripperCommandAction_

typedef ::ndx_manipulation::GripperCommandAction_<std::allocator<void> > GripperCommandAction;

typedef boost::shared_ptr< ::ndx_manipulation::GripperCommandAction > GripperCommandActionPtr;
typedef boost::shared_ptr< ::ndx_manipulation::GripperCommandAction const> GripperCommandActionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::ndx_manipulation::GripperCommandAction_<ContainerAllocator1> & lhs, const ::ndx_manipulation::GripperCommandAction_<ContainerAllocator2> & rhs)
{
  return lhs.action_goal == rhs.action_goal &&
    lhs.action_result == rhs.action_result &&
    lhs.action_feedback == rhs.action_feedback;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::ndx_manipulation::GripperCommandAction_<ContainerAllocator1> & lhs, const ::ndx_manipulation::GripperCommandAction_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace ndx_manipulation

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2a460c35d012a847b808e9d53b723d17";
  }

  static const char* value(const ::ndx_manipulation::GripperCommandAction_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2a460c35d012a847ULL;
  static const uint64_t static_value2 = 0xb808e9d53b723d17ULL;
};

template<class ContainerAllocator>
struct DataType< ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ndx_manipulation/GripperCommandAction";
  }

  static const char* value(const ::ndx_manipulation::GripperCommandAction_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"GripperCommandActionGoal action_goal\n"
"GripperCommandActionResult action_result\n"
"GripperCommandActionFeedback action_feedback\n"
"\n"
"================================================================================\n"
"MSG: ndx_manipulation/GripperCommandActionGoal\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalID goal_id\n"
"GripperCommandGoal goal\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: actionlib_msgs/GoalID\n"
"# The stamp should store the time at which this goal was requested.\n"
"# It is used by an action server when it tries to preempt all\n"
"# goals that were requested before a certain time\n"
"time stamp\n"
"\n"
"# The id provides a way to associate feedback and\n"
"# result message with specific goal requests. The id\n"
"# specified must be unique.\n"
"string id\n"
"\n"
"\n"
"================================================================================\n"
"MSG: ndx_manipulation/GripperCommandGoal\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"float64 position    # The current gripper gap size (in meters)\n"
"float64 max_effort  # Max motor current\n"
"float64 velocity    # Motor velocity\n"
"\n"
"================================================================================\n"
"MSG: ndx_manipulation/GripperCommandActionResult\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalStatus status\n"
"GripperCommandResult result\n"
"\n"
"================================================================================\n"
"MSG: actionlib_msgs/GoalStatus\n"
"GoalID goal_id\n"
"uint8 status\n"
"uint8 PENDING         = 0   # The goal has yet to be processed by the action server\n"
"uint8 ACTIVE          = 1   # The goal is currently being processed by the action server\n"
"uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing\n"
"                            #   and has since completed its execution (Terminal State)\n"
"uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)\n"
"uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due\n"
"                            #    to some failure (Terminal State)\n"
"uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,\n"
"                            #    because the goal was unattainable or invalid (Terminal State)\n"
"uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing\n"
"                            #    and has not yet completed execution\n"
"uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,\n"
"                            #    but the action server has not yet confirmed that the goal is canceled\n"
"uint8 RECALLED        = 8   # The goal received a cancel request before it started executing\n"
"                            #    and was successfully cancelled (Terminal State)\n"
"uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be\n"
"                            #    sent over the wire by an action server\n"
"\n"
"#Allow for the user to associate a string with GoalStatus for debugging\n"
"string text\n"
"\n"
"\n"
"================================================================================\n"
"MSG: ndx_manipulation/GripperCommandResult\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"float64 position  # The current gripper gap size (in meters)\n"
"float64 effort    # The current effort exerted (motor current)\n"
"bool stalled      # True iff the gripper is exerting max effort and not moving\n"
"bool reached_goal # True iff the gripper position has reached the commanded setpoint\n"
"\n"
"================================================================================\n"
"MSG: ndx_manipulation/GripperCommandActionFeedback\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"\n"
"Header header\n"
"actionlib_msgs/GoalStatus status\n"
"GripperCommandFeedback feedback\n"
"\n"
"================================================================================\n"
"MSG: ndx_manipulation/GripperCommandFeedback\n"
"# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"float64 position  # The current gripper gap size (in meters)\n"
"float64 effort    # The current effort exerted (motor current)\n"
"bool stalled      # True iff the gripper is exerting max effort and not moving\n"
"bool reached_goal # True iff the gripper position has reached the commanded setpoint\n"
;
  }

  static const char* value(const ::ndx_manipulation::GripperCommandAction_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.action_goal);
      stream.next(m.action_result);
      stream.next(m.action_feedback);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GripperCommandAction_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ndx_manipulation::GripperCommandAction_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ndx_manipulation::GripperCommandAction_<ContainerAllocator>& v)
  {
    s << indent << "action_goal: ";
    s << std::endl;
    Printer< ::ndx_manipulation::GripperCommandActionGoal_<ContainerAllocator> >::stream(s, indent + "  ", v.action_goal);
    s << indent << "action_result: ";
    s << std::endl;
    Printer< ::ndx_manipulation::GripperCommandActionResult_<ContainerAllocator> >::stream(s, indent + "  ", v.action_result);
    s << indent << "action_feedback: ";
    s << std::endl;
    Printer< ::ndx_manipulation::GripperCommandActionFeedback_<ContainerAllocator> >::stream(s, indent + "  ", v.action_feedback);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NDX_MANIPULATION_MESSAGE_GRIPPERCOMMANDACTION_H