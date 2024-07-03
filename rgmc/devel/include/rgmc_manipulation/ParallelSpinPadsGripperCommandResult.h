// Generated by gencpp from file rgmc_manipulation/ParallelSpinPadsGripperCommandResult.msg
// DO NOT EDIT!


#ifndef RGMC_MANIPULATION_MESSAGE_PARALLELSPINPADSGRIPPERCOMMANDRESULT_H
#define RGMC_MANIPULATION_MESSAGE_PARALLELSPINPADSGRIPPERCOMMANDRESULT_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace rgmc_manipulation
{
template <class ContainerAllocator>
struct ParallelSpinPadsGripperCommandResult_
{
  typedef ParallelSpinPadsGripperCommandResult_<ContainerAllocator> Type;

  ParallelSpinPadsGripperCommandResult_()
    : par_final_position(0.0)
    , par_final_effort(0.0)
    , par_stalled(false)
    , par_reached_goal(false)
    , pads_final_position()
    , pads_final_effort()
    , pads_stalled(false)
    , pads_reached_goal(false)  {
    }
  ParallelSpinPadsGripperCommandResult_(const ContainerAllocator& _alloc)
    : par_final_position(0.0)
    , par_final_effort(0.0)
    , par_stalled(false)
    , par_reached_goal(false)
    , pads_final_position(_alloc)
    , pads_final_effort(_alloc)
    , pads_stalled(false)
    , pads_reached_goal(false)  {
  (void)_alloc;
    }



   typedef double _par_final_position_type;
  _par_final_position_type par_final_position;

   typedef double _par_final_effort_type;
  _par_final_effort_type par_final_effort;

   typedef uint8_t _par_stalled_type;
  _par_stalled_type par_stalled;

   typedef uint8_t _par_reached_goal_type;
  _par_reached_goal_type par_reached_goal;

   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _pads_final_position_type;
  _pads_final_position_type pads_final_position;

   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _pads_final_effort_type;
  _pads_final_effort_type pads_final_effort;

   typedef uint8_t _pads_stalled_type;
  _pads_stalled_type pads_stalled;

   typedef uint8_t _pads_reached_goal_type;
  _pads_reached_goal_type pads_reached_goal;





  typedef boost::shared_ptr< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> const> ConstPtr;

}; // struct ParallelSpinPadsGripperCommandResult_

typedef ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<std::allocator<void> > ParallelSpinPadsGripperCommandResult;

typedef boost::shared_ptr< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult > ParallelSpinPadsGripperCommandResultPtr;
typedef boost::shared_ptr< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult const> ParallelSpinPadsGripperCommandResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator1> & lhs, const ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator2> & rhs)
{
  return lhs.par_final_position == rhs.par_final_position &&
    lhs.par_final_effort == rhs.par_final_effort &&
    lhs.par_stalled == rhs.par_stalled &&
    lhs.par_reached_goal == rhs.par_reached_goal &&
    lhs.pads_final_position == rhs.pads_final_position &&
    lhs.pads_final_effort == rhs.pads_final_effort &&
    lhs.pads_stalled == rhs.pads_stalled &&
    lhs.pads_reached_goal == rhs.pads_reached_goal;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator1> & lhs, const ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace rgmc_manipulation

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e170c820e7fe9881bd93a13cfc59ebbe";
  }

  static const char* value(const ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe170c820e7fe9881ULL;
  static const uint64_t static_value2 = 0xbd93a13cfc59ebbeULL;
};

template<class ContainerAllocator>
struct DataType< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "rgmc_manipulation/ParallelSpinPadsGripperCommandResult";
  }

  static const char* value(const ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# RESULT\n"
"float64 par_final_position  # The final parallel gripper gap size (in meters)\n"
"float64 par_final_effort    # The final parallel gripper effort exerted (motor current)\n"
"bool par_stalled      # True iff the gripper is exerting max effort and not moving\n"
"bool par_reached_goal # True iff the gripper position has reached the commanded setpoint\n"
"float64[] pads_final_position # The final fingertip pads angular position (in radians)\n"
"float64[] pads_final_effort   # The final fingertip pads effort (in mA)\n"
"bool pads_stalled      # True iff one of the pads is exerting max effort and not moving\n"
"bool pads_reached_goal # True iff both pads reached goal position\n"
;
  }

  static const char* value(const ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.par_final_position);
      stream.next(m.par_final_effort);
      stream.next(m.par_stalled);
      stream.next(m.par_reached_goal);
      stream.next(m.pads_final_position);
      stream.next(m.pads_final_effort);
      stream.next(m.pads_stalled);
      stream.next(m.pads_reached_goal);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ParallelSpinPadsGripperCommandResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::rgmc_manipulation::ParallelSpinPadsGripperCommandResult_<ContainerAllocator>& v)
  {
    s << indent << "par_final_position: ";
    Printer<double>::stream(s, indent + "  ", v.par_final_position);
    s << indent << "par_final_effort: ";
    Printer<double>::stream(s, indent + "  ", v.par_final_effort);
    s << indent << "par_stalled: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.par_stalled);
    s << indent << "par_reached_goal: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.par_reached_goal);
    s << indent << "pads_final_position[]" << std::endl;
    for (size_t i = 0; i < v.pads_final_position.size(); ++i)
    {
      s << indent << "  pads_final_position[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.pads_final_position[i]);
    }
    s << indent << "pads_final_effort[]" << std::endl;
    for (size_t i = 0; i < v.pads_final_effort.size(); ++i)
    {
      s << indent << "  pads_final_effort[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.pads_final_effort[i]);
    }
    s << indent << "pads_stalled: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.pads_stalled);
    s << indent << "pads_reached_goal: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.pads_reached_goal);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RGMC_MANIPULATION_MESSAGE_PARALLELSPINPADSGRIPPERCOMMANDRESULT_H
