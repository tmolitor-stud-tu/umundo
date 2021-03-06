# on 64Bit builds we have unresolved symbols
# message("linking umundo-monitor")
# message("UMUNDOCORE_LIBRARIES: ${UMUNDOCORE_LIBRARIES}")
# message("UMUNDOS11N_LIBRARIES: ${UMUNDOS11N_LIBRARIES}")

if (BUILD_UMUNDO_S11N)
	if (WIN32)
		add_executable(umundo-monitor umundo-monitor.cpp ${PROJECT_SOURCE_DIR}/contrib/snippets/XGetopt.cpp)
	else()
		add_executable(umundo-monitor umundo-monitor.cpp)
	endif()

	target_link_libraries(umundo-monitor umundocore umundoserial)
	set_target_properties(umundo-monitor PROPERTIES FOLDER "Tools")

	INSTALL_EXECUTABLE(
		TARGETS umundo-monitor
		COMPONENT tools 
	)
endif()

if (NET_RTP)
	add_executable(umundo-rtp-pub umundo-rtp-pub.cpp)
	target_link_libraries(umundo-rtp-pub umundocore)
	set_target_properties(umundo-rtp-pub PROPERTIES FOLDER "Tools")

	INSTALL_EXECUTABLE(
		TARGETS umundo-rtp-pub
		COMPONENT tools 
	)

	add_executable(umundo-rtp-sub umundo-rtp-sub.cpp)
	target_link_libraries(umundo-rtp-sub umundocore)
	set_target_properties(umundo-rtp-sub PROPERTIES FOLDER "Tools")

	INSTALL_EXECUTABLE(
		TARGETS umundo-rtp-sub
		COMPONENT tools 
	)
	
	find_package(Portaudio)
	if(PORTAUDIO_FOUND)
		include_directories(${PORTAUDIO_INCLUDE_DIRS})
		
		add_executable(umundo-multicast-phone-pub umundo-multicast-phone-pub.cpp)
		target_link_libraries(umundo-multicast-phone-pub umundocore ${PORTAUDIO_LIBRARIES})
		set_target_properties(umundo-multicast-phone-pub PROPERTIES FOLDER "Tools")

		INSTALL_EXECUTABLE(
			TARGETS umundo-multicast-phone-pub
			COMPONENT tools 
		)
		
		add_executable(umundo-multicast-phone-sub umundo-multicast-phone-sub.cpp)
		target_link_libraries(umundo-multicast-phone-sub umundocore ${PORTAUDIO_LIBRARIES})
		set_target_properties(umundo-multicast-phone-sub PROPERTIES FOLDER "Tools")

		INSTALL_EXECUTABLE(
			TARGETS umundo-multicast-phone-sub
			COMPONENT tools 
		)
		
		add_executable(umundo-phone umundo-phone.cpp)
		target_link_libraries(umundo-phone umundocore ${PORTAUDIO_LIBRARIES})
		set_target_properties(umundo-phone PROPERTIES FOLDER "Tools")

		INSTALL_EXECUTABLE(
			TARGETS umundo-phone
			COMPONENT tools 
		)
	endif()
	
	find_package(Freenect)
	find_package(OpenGL)
	find_package(GLUT)
	if(FREENECT_FOUND)
		include_directories(${FREENECT_INCLUDE_DIR})
		
		add_executable(umundo-kinect-pub umundo-kinect-pub.cpp)
		target_link_libraries(umundo-kinect-pub umundocore ${FREENECT_LIBRARY})
		set_target_properties(umundo-kinect-pub PROPERTIES FOLDER "Tools")

		INSTALL_EXECUTABLE(
			TARGETS umundo-kinect-pub
			COMPONENT tools 
		)
	endif()
	
	if(OPENGL_FOUND AND GLUT_FOUND)
		include_directories(${OPENGL_INCLUDE_DIR})
		include_directories(${GLUT_INCLUDE_DIR})
		
		add_executable(umundo-kinect-sub umundo-kinect-sub.cpp)
		target_link_libraries(umundo-kinect-sub umundocore ${OPENGL_LIBRARIES} ${GLUT_LIBRARIES})
		set_target_properties(umundo-kinect-sub PROPERTIES FOLDER "Tools")

		INSTALL_EXECUTABLE(
			TARGETS umundo-kinect-sub
			COMPONENT tools 
		)
	endif()

endif()

if (WIN32)
	add_executable(umundo-pingpong umundo-pingpong.cpp ${PROJECT_SOURCE_DIR}/contrib/snippets/XGetopt.cpp)
else()
	add_executable(umundo-pingpong umundo-pingpong.cpp)
endif()
target_link_libraries(umundo-pingpong umundocore)
set_target_properties(umundo-pingpong PROPERTIES FOLDER "Tools")

INSTALL_EXECUTABLE(
	TARGETS umundo-pingpong
	COMPONENT tools 
)

add_executable(umundo-stream-send umundo-stream-send.cpp)
target_link_libraries(umundo-stream-send umundocore)
set_target_properties(umundo-stream-send PROPERTIES FOLDER "Tools")

INSTALL_EXECUTABLE(
	TARGETS umundo-stream-send
	COMPONENT tools 
)

add_executable(umundo-stream-receive umundo-stream-receive.cpp)
target_link_libraries(umundo-stream-receive umundocore)
set_target_properties(umundo-stream-receive PROPERTIES FOLDER "Tools")

INSTALL_EXECUTABLE(
	TARGETS umundo-stream-receive
	COMPONENT tools 
)

if (WIN32)
	add_executable(umundo-debug umundo-debug.cpp ${PROJECT_SOURCE_DIR}/contrib/snippets/XGetopt.cpp)
else()
	add_executable(umundo-debug umundo-debug.cpp)
endif()
target_link_libraries(umundo-debug umundocore)
set_target_properties(umundo-debug PROPERTIES FOLDER "Tools")

INSTALL_EXECUTABLE(
	TARGETS umundo-debug
	COMPONENT tools 
)


if (WIN32)
	add_executable(umundo-capture umundo-capture.cpp ${PROJECT_SOURCE_DIR}/contrib/snippets/XGetopt.cpp)
else()
	add_executable(umundo-capture umundo-capture.cpp)
endif()
target_link_libraries(umundo-capture umundocore)
set_target_properties(umundo-capture PROPERTIES FOLDER "Tools")

INSTALL_EXECUTABLE(
	TARGETS umundo-capture
	COMPONENT tools 
)


if (WIN32)
	add_executable(umundo-replay umundo-replay.cpp ${PROJECT_SOURCE_DIR}/contrib/snippets/XGetopt.cpp)
else()
	add_executable(umundo-replay umundo-replay.cpp)
endif()
target_link_libraries(umundo-replay umundocore)
set_target_properties(umundo-replay PROPERTIES FOLDER "Tools")

INSTALL_EXECUTABLE(
	TARGETS umundo-replay
	COMPONENT tools 
)

if (BUILD_UMUNDO_S11N AND BUILD_UMUNDO_RPC)
	add_executable(umundo-echo-service umundo-echo-service.cpp)
	target_link_libraries(umundo-echo-service umundocore umundoserial umundorpc)
	set_target_properties(umundo-echo-service PROPERTIES FOLDER "Tools")

	INSTALL_EXECUTABLE(
		TARGETS umundo-echo-service
		COMPONENT tools 
	)
endif()

if (WIN32)
	add_executable(umundo-bridge umundo-bridge.cpp ${PROJECT_SOURCE_DIR}/contrib/snippets/XGetopt.cpp)
else()
	add_executable(umundo-bridge umundo-bridge.cpp)
endif()
target_link_libraries(umundo-bridge umundocore)
set_target_properties(umundo-bridge PROPERTIES FOLDER "Tools")

INSTALL_EXECUTABLE(
	TARGETS umundo-bridge
	COMPONENT tools 
)

if (WIN32)
	add_executable(umundo-throughput umundo-throughput.cpp ${PROJECT_SOURCE_DIR}/contrib/snippets/XGetopt.cpp)
else()
	add_executable(umundo-throughput umundo-throughput.cpp)
endif()
target_link_libraries(umundo-throughput umundocore)
set_target_properties(umundo-throughput PROPERTIES FOLDER "Tools")

INSTALL_EXECUTABLE(
	TARGETS umundo-throughput
	COMPONENT tools 
)
