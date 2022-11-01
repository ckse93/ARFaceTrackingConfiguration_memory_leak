# ARFaceTrackingConfiguration_memory_leak
repo for reporting ARFaceTrackingConfiguration's memory leak issue 

# Steps to reproduce
1. run the app on a physical device, and click on the "debug navigator" (spray can icon)
2. double click on the "Memory" cell, it will open detailed memory usage and history view
3. on the app, tap on "present arView" button, it will present ARView and will place a cooking pan over your face 
4. notice the memory spike on the memory view on xcode 
5. close the ARView by tapping on orange "dismiss arview" button 
6. notice the memory will still hang 
