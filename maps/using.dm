//Easily change which map to build by uncommenting ONE below.

// Для тестов механа раскомментируйте #define EXAMPLEMAP и не забудьте закомментировать обратно перед коммитом!
// Он меняет карту на карту для тестов.
// Если вы тестите свою карту - он вам не поможет.
// При добавлении новой карты не забудьте добавить #ifndef EXAMPLEMAP и #endif к её инклюду .dmm, если нужно.
// #define EXAMPLEMAP

#ifdef EXAMPLEMAP
	#include "torch_doh\map.dm" // <--- Поменяйте если надо
	#warn Запущена EXAMPLEMAP, не забудьте выключить!
#else
	// #include "example\map.dm"
	// #include "torch\map.dm"
	//#include "torch_fd\map.dm" // Basic Torch of FD
	#include "torch_doh\map.dm" // DEATH OF HOPE
	// #include "lightbrigade\map.dm"
	//#include "tempeterra\_map.dm"
#endif
