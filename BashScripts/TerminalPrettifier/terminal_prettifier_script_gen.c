#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

struct
{
    const char* start_str;
    const char* start_str_default;
    const char* end_str;
} ConfigConstants;

void init_constants()
{
    ConfigConstants.start_str = "printf '# eval \"$(oh-my-posh init bash --config /home/codespace/.oh-my-posh-configs/";
    ConfigConstants.start_str_default = "printf 'eval \"$(oh-my-posh init bash --config /home/codespace/.oh-my-posh-configs/";
    ConfigConstants.end_str = ")\"\\n' >> ~/.bashrc";
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
    char file_name[100];
    char file_content[500];
    char temp[100];
    
    assert(file != NULL);
    
    while (fgets(file_name, sizeof(file_name), config_file_names) != NULL)
    {
        file_name[strcspn(file_name, "\n")] = '\0';
        if (strcmp(file_name, "sonicboom_light.omp.json") == 0)
            fprintf(file, "%s%s%s\n", ConfigConstants.start_str_default, file_name, ConfigConstants.end_str);
        else
            fprintf(file, "%s%s%s\n", ConfigConstants.start_str, file_name, ConfigConstants.end_str);
        fprintf(file, "%s%s\n", "touch ~/.oh-my-posh-configs/", file_name);
        fprintf(file, "%s%s\n", "truncate -s 0 ~/.oh-my-posh-configs/", file_name);
        fprintf(file, "%s\n", "printf '%s\\n' '{' \\");
        strcpy(temp, "./config_file_contents/");
        strcat(temp, file_name);
        config_file_contents = fopen(temp, "r");
        while (fgets(file_content, sizeof(file_content), config_file_contents) != NULL)
        {
            if (strncmp(file_content, "{", 1) == 0) continue;
            fprintf(file, "'%s' \\\n", str_replace(file_content, "\n", ""));
        }
        fprintf(file, "%s%s\n", ">> ~/.oh-my-posh-configs/", file_name);
        fclose(config_file_contents);
    }
    
    fclose(config_file_names);
}

void file_print_requirements(FILE *file)
{
    fprintf(file, "%s\n", "mkdir ~/bin ~/.oh-my-posh-configs");
    fprintf(file, "%s\n", "printf '\\n# HALT TERMINAL PRETTIFIER\\n' >> ~/.bashrc");
    fprintf(file, "%s\n", "printf '\\nexport PATH=\"/home/codespace/bin:$PATH\"\\n' >> ~/.bashrc");

    file_print_configs(file);

    fprintf(file, "%s\n", "curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin");
    fprintf(file, "%s\n", "exec bash");
}

int main(const int argc, const char** argv[])
{
    char temp[100], test_string[] = "# HALT TERMINAL PRETTIFIER\n";
    init_constants();

    FILE* bashrc = fopen("/home/codespace/.bashrc", "r");
    
    while (fgets(temp, sizeof(temp), bashrc) != NULL)
    {
        if (strncmp(temp, test_string, sizeof(test_string)) == 0) return 1;
    }

    fclose(bashrc);

    FILE* my_script = fopen("./terminal_prettifier.sh", "w");

    file_print_requirements(my_script);

    fclose(my_script);
    return 0;
}
