// Generated by gencpp from file rgmc_manipulation/ParallelSpinPadsGripperCommandFeedback.msg
// DO NOT EDIT!


#ifndef RGMC_MANIPULATION_MESSAGE_PARALLELSPINPADSGRIPPERCOMMANDFEEDBACK_H
#define RGMC_MANIPULATION_MESSAGE_PARALLELSPINPADSGRIPPERCOMMANDFEEDBACK_H


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
struct ParallelSpinPadsGripperCommandFeedback_
{
  typedef ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> Type;

  ParallelSpinPadsGripperCommandFeedback_()
    : par_position(0.0)
    , par_effort(0.0)
    , pads_position()
    , pads_effort()  {
    }
  ParallelSpinPadsGripperCommandFeedback_(const ContainerAllocator& _alloc)
    : par_position(0.0)
    , par_effort(0.0)
    , pads_position(_alloc)
    , pads_effort(_alloc)  {
  (void)_alloc;
    }



   typedef double _par_position_type;
  _par_position_type par_position;

   typedef double _par_effort_type;
  _par_effort_type par_effort;

   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _pads_position_type;
  _pads_position_type pads_position;

   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _pads_effort_type;
  _pads_effort_type pads_effort;





  typedef boost::shared_ptr< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct ParallelSpinPadsGripperCommandFeedback_

typedef ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<std::allocator<void> > ParallelSpinPadsGripperCommandFeedback;

typedef boost::shared_ptr< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback > ParallelSpinPadsGripperCommandFeedbackPtr;
typedef boost::shared_ptr< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback const> ParallelSpinPadsGripperCommandFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator1> & lhs, const ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator2> & rhs)
{
  return lhs.par_position == rhs.par_position &&
    lhs.par_effort == rhs.par_effort &&
    lhs.pads_position == rhs.pads_position &&
    lhs.pads_effort == rhs.pads_effort;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator1> & lhs, const ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace rgmc_manipulation

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2806a1e58dffdfdf7bed2a77162778b6";
  }

  static const char* value(const ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2806a1e58dffdfdfULL;
  static const uint64_t static_value2 = 0x7bed2a77162778b6ULL;
};

template<class ContainerAllocator>
struct DataType< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "rgmc_manipulation/ParallelSpinPadsGripperCommandFeedback";
  }

  static const char* value(const ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# FEEDBACK\n"
"float64 par_position  # The current parallel gripper gap size (in meters)\n"
"float64 par_effort    # The current parallel gripper effort exerted (motor current)\n"
"float64[] pads_position # The current fingertip pads angular position (in radians)\n"
"float64[] pads_effort   # The current fingertip pads effort (in mA)\n"
;
  }

  static const char* value(const ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.par_position);
      stream.next(m.par_effort);
      stream.next(m.pads_position);
      stream.next(m.pads_effort);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ParallelSpinPadsGripperCommandFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::rgmc_manipulation::ParallelSpinPadsGripperCommandFeedback_<ContainerAllocator>& v)
  {
    s << indent << "par_position: ";
    Printer<double>::stream(s, indent + "  ", v.par_position);
    s << indent << "par_effort: ";
    Printer<double>::stream(s, indent + "  ", v.par_effort);
    s << indent << "pads_position[]" << std::endl;
    for (size_t i = 0; i < v.pads_position.size(); ++i)
    {
      s << indent << "  pads_position[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.pads_position[i]);
    }
    s << indent << "pads_effort[]" << std::endl;
    for (size_t i = 0; i < v.pads_effort.size(); ++i)
    {
      s << indent << "  pads_effort[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.pads_effort[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // RGMC_MANIPULATION_MESSAGE_PARALLELSPINPADSGRIPPERCOMMANDFEEDBACK_H
