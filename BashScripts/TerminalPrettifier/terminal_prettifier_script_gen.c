#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>

#define STR_CONCAT_3(str1, str2, str3) str1 str2 str3

#define BUFFER_SIZE 100
#define SAME_STR 0
#define BASHRC_ERROR 1

struct
{
    const char* configs_path;
    const char* custom_scripts_path;
    const char* configs_script;
    const char* start_str;
    const char* start_str_default;
    const char* end_str;
} ConfigConstants;

void init_constants()
{
    ConfigConstants.configs_path = "~/.oh-my-posh-configs";
    ConfigConstants.custom_scripts_path = "~/.custom-bash-scripts";
    ConfigConstants.configs_script = "terminal-prettifier-configs.sh";
    ConfigConstants.start_str = "printf '# eval \"$(oh-my-posh init bash --config /home/codespace/.oh-my-posh-configs/";
    ConfigConstants.start_str_default = "printf 'eval \"$(oh-my-posh init bash --config /home/codespace/.oh-my-posh-configs/";

    char* temp = (char*) calloc(BUFFER_SIZE, sizeof(char));
    strcat(temp, ")\"\\n' >> ");
    strcat(temp, ConfigConstants.custom_scripts_path);
    strcat(temp, "/");
    strcat(temp, ConfigConstants.configs_script);
    ConfigConstants.end_str = temp;
}

// You must free the result if result is non-NULL.
char *str_replace(char *orig, char *rep, char *with) {
    char *result; // the return string
    char *ins;    // the next insert point
    char *tmp;    // varies
    int len_rep;  // length of rep (the string to remove)
    int len_with; // length of with (the string to replace rep with)
    int len_front; // distance between rep and end of last rep
    int count;    // number of replacements

    // sanity checks and initialization
    if (!orig || !rep)
        return NULL;
    len_rep = strlen(rep);
    if (len_rep == 0)
        return NULL; // empty rep causes infinite loop during count
    if (!with)
        with = "";
    len_with = strlen(with);

    // count the number of replacements needed
    ins = orig;
    for (count = 0; tmp = strstr(ins, rep); ++count) {
        ins = tmp + len_rep;
    }

    tmp = result = malloc(strlen(orig) + (len_with - len_rep) * count + 1);

    if (!result)
        return NULL;

    // first time through the loop, all the variable are set correctly
    // from here on,
    //    tmp points to the end of the result string
    //    ins points to the next occurrence of rep in orig
    //    orig points to the remainder of orig after "end of rep"
    while (count--) {
        ins = strstr(orig, rep);
        len_front = ins - orig;
        tmp = strncpy(tmp, orig, len_front) + len_front;
        tmp = strcpy(tmp, with) + len_with;
        orig += len_front + len_rep; // move to next "end of rep"
    }
    strcpy(tmp, orig);
    return result;
}

void file_print_configs(FILE* file)
{
    FILE* config_file_names = fopen("./config_file_names.txt", "r");
    FILE* config_file_contents;
    char file_name[BUFFER_SIZE];
    char file_content[5 * BUFFER_SIZE];
    char temp[BUFFER_SIZE];
    
    assert(file != NULL);
    
    while (fgets(file_name, sizeof(file_name), config_file_names) != NULL)
    {
        file_name[strcspn(file_name, "\n")] = '\0';
        if (strcmp(file_name, "sonicboom_light.omp.json") == SAME_STR)
            fprintf(file, "%s%s%s\n", ConfigConstants.start_str_default, file_name, ConfigConstants.end_str);
        else
            fprintf(file, "%s%s%s\n", ConfigConstants.start_str, file_name, ConfigConstants.end_str);
        printf("End string: %s\n", ConfigConstants.end_str);
        fprintf(file, "%s%s\n", "touch ~/.oh-my-posh-configs/", file_name);
        fprintf(file, "%s%s\n", "truncate -s 0 ~/.oh-my-posh-configs/", file_name);
        fprintf(file, "%s\n", "printf '%s\\n' '{' \\");
        strcpy(temp, "./config_file_contents/");
        strcat(temp, file_name);
        config_file_contents = fopen(temp, "r");
        while (fgets(file_content, sizeof(file_content), config_file_contents) != NULL)
        {
            if (strncmp(file_content, "{", 1) == SAME_STR) continue;
            fprintf(file, "'%s' \\\n", str_replace(file_content, "\n", ""));
        }
        fprintf(file, "%s%s\n", ">> ~/.oh-my-posh-configs/", file_name);
        fclose(config_file_contents);
    }
    
    fclose(config_file_names);
}

void file_print_head_requirements(FILE* file, bool print_to_bashrc)
{
    fprintf(file, "mkdir %s %s %s\n", "~/bin", ConfigConstants.configs_path, ConfigConstants.custom_scripts_path);
    fprintf(file, "touch %s/%s\n", ConfigConstants.custom_scripts_path, ConfigConstants.configs_script);
    fprintf(file, "truncate -s 0 %s/%s\n", ConfigConstants.custom_scripts_path, ConfigConstants.configs_script);
    if (!print_to_bashrc) return;
    fprintf(file, "printf '\\n%s\\n' >> ~/.bashrc\n", "# HALT TERMINAL PRETTIFIER");
    fprintf(file, "printf '%s\\n' >> ~/.bashrc\n", "export PATH=\"/home/codespace/bin:$PATH\"");
    fprintf(file, "printf 'source %s/%s\\n' >> ~/.bashrc\n", ConfigConstants.custom_scripts_path, ConfigConstants.configs_script);
}

void file_print_tail_requirements(FILE* file)
{
    fprintf(file, "curl -s https://ohmyposh.dev/install.sh | bash -s -- -d %s\n", "~/bin");
    fprintf(file, "exec bash\n");
}

int main(const int argc, const char** argv[])
{
    char temp[BUFFER_SIZE], test_string[] = "# HALT TERMINAL PRETTIFIER\n";
    bool print_to_bashrc = true;
    init_constants();

    FILE* bashrc = fopen("/home/codespace/.bashrc", "r");
    
    while (fgets(temp, sizeof(temp), bashrc) != NULL)
    {
        if (strncmp(temp, test_string, sizeof(test_string)) == SAME_STR) print_to_bashrc = false;
    }

    fclose(bashrc);

    FILE* my_script = fopen("./terminal_prettifier.sh", "w");

    file_print_head_requirements(my_script, print_to_bashrc);
    file_print_configs(my_script);
    file_print_tail_requirements(my_script);

    // free(ConfigConstants.end_str);
    fclose(my_script);
    return 0;
}
