# /context

**"What is this project?"** - Analyze and explain current project.

## What It Does
1. Identify project type (language, framework)
2. Map file structure
3. Find key files (build configs, entry points)
4. Detect patterns (architecture, testing, CI)
5. Summarize in scannable format

## Output Format
```
## Project: <name>

| Aspect     | Value                              |
|------------|------------------------------------|
| Type       | Android App / Ktor API / CLI / etc |
| Language   | Kotlin 1.9                         |
| Build      | Gradle 8.x                         |
| Framework  | Compose / Ktor / KMP               |

## Structure
| Directory  | Purpose                |
|------------|------------------------|
| app/       | Main application       |
| core/      | Shared business logic  |
| data/      | Repositories, network  |
| test/      | Unit tests             |

## Key Files
| File                  | Purpose            |
|-----------------------|--------------------|
| build.gradle.kts      | Build config       |
| settings.gradle.kts   | Module definitions |
| gradle.properties     | Build properties   |

## Patterns Detected
- Architecture: MVVM with Clean Architecture
- DI: Koin / Hilt
- Testing: JUnit + MockK
- CI: GitHub Actions

## Commands Available
- Build: `./gradlew build`
- Test: `./gradlew test`
- Run: `./gradlew run`
```

## Commands Used
| Command                        | Purpose              |
|--------------------------------|----------------------|
| `ls -la`                       | Root structure       |
| `find . -name "*.gradle.kts"`  | Find build files     |
| `cat <build-file>`             | Read configs         |
| `head -50 <entry-point>`       | Sample main code     |

## Boundaries
- ✅ **Always:** Read-only analysis, structured output
- 🚫 **Never:** Modify files, make assumptions without reading
