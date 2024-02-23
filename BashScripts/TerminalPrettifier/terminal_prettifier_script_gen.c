#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#define CONCAT_STR(start_str, file_name, end_str) strcat(strcat(start_str, file_name), end_str)

struct
{
    const char* config_file_start_str;
    const char* config_file_end_str;
} Constants;

void init_constants()
{
    Constants.config_file_start_str = "printf 'eval \"$(oh-my-posh init bash --config /home/codespace/.oh-my-posh-configs/";
    Constants.config_file_end_str = ")\"\\n' >> ~/.bashrc";
}

void file_print_configs(FILE* file)
{
    FILE* config_file_names = fopen("./config_file_names.txt", "r");
    // FILE* config_file_contents;
    char file_name[100];
    // char file_content[100];
    
    assert(file != NULL);
    
    while (fgets(file_name, sizeof(file_name), config_file_names) != NULL)
    {
        file_name[strcspn(file_name, "\n")] = '\0';
        // config_file_contents = fopen(strcat("./config_file_contents/", file_name), "r");
        fprintf(file, "%s%s%s\n", Constants.config_file_start_str, file_name, Constants.config_file_end_str);
        fprintf(file, "%s%s\n", "touch ~/.oh-my-posh-configs/", file_name);
        fprintf(file, "%s\n", "printf '%s\\n' '{' \\\n");
        // fgets(file_content, sizeof(file_content), config_file_contents);
        // while (fgets(file_content, sizeof(file_content), config_file_contents) != NULL)
        // {
        //     fprintf(file, "'%s' \\\n", file_content);
        // }
        // fclose(config_file_contents);
    }
    
    fclose(config_file_names);
}

void file_print_requirements(FILE *file)
{
    fprintf(file, "%s\n", "mkdir ~/bin ~/.oh-my-posh-configs");
    fprintf(file, "%s\n", "printf '\\nexport PATH=\"/home/codespace/bin:$PATH\"\\n >> ~/.bashrc\'");

    file_print_configs(file);

    fprintf(file, "%s\n", "curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin");
}

int main(const int argc, const char** argv[])
{
    init_constants();

    FILE* bash_script = fopen("./terminal_prettifier.sh", "w");

    file_print_requirements(bash_script);

    fclose(bash_script);
    return 0;
}
