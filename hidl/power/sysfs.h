#include <fstream>
#include <string>

namespace utils {

void sysfs_write(std::string path, std::string value) {
    std::ofstream stream(path);
    stream << value;
    stream.close();
}

}
