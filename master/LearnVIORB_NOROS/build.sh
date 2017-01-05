echo "Configuring and building Thirdparty/DBoW2 ..."

cd Thirdparty/DBoW2
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j

cd ../../g2o

echo "Configuring and building Thirdparty/g2o ..."

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j

cd ../../../

echo "Uncompress vocabulary ..."

#cd Vocabulary
#tar -xf ORBvoc.txt.tar.gz
#cd ..

echo "Configuring and building ORB_SLAM2 ..."

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j
cd ..

echo "Build ROS node ..."

cd Examples/ROS/ORB_VIO
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j
#cd ../../../../

echo ""
echo "Modify the configuration file config/euroc.yaml"
echo "Run as: ./project path_to_ORBVOC.TXT path_to_euroc.yaml path_to_imu/data.csv path_to_cam0/data.csv path_to_cam0/data"
echo ""

#echo "Converting vocabulary to binary"
#./tools/bin_vocabulary
