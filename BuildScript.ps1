$msbuildPath = "MSBuild.exe"  # MSBuild.exe 파일의 경로로 수정해주세요
$solutionPath = "C:\Users\snail\Desktop\msbuild-test\ConsoleApp1\ConsoleApp1.sln"  # 솔루션 파일 경로로 수정해주세요

$excludedProjects = @(
    "C:\Users\snail\Desktop\msbuild-test\ConsoleApp1\ConsoleApp2\ConsoleApp2.csproj"  # 제외할 프로젝트 경로로 수정해주세요
)

$msbuildArgs = @(
    $solutionPath,
    "/p:Configuration=Debug",
    "/p:Platform=AnyCPU",
    "/t:Rebuild"
)

# 제외할 프로젝트들을 포함하지 않도록 MSBuild 인수를 조정합니다.
foreach ($project in $excludedProjects) {
    $msbuildArgs += "/p:ExcludeProjects=$project"
}

# MSBuild 실행
Start-Process -FilePath $msbuildPath -ArgumentList $msbuildArgs -Wait
msbuild 시 특정 프로젝트 제외 옵션이 있나? 내 폴더 구조는 다음과 같아. ConsoleApp1/ConsoleApp1.csproj, ConsoleApp2/ConsoleApp2.csproj, ConsoleApp.sln 이야. 
솔루션에서는 1과 2를 프로젝트로 가지고 있어. 나는 2 프로젝트를 제외하고 싶어.
msbuld에서 특정 프로젝트를 제외하고 빌드하는 옵션이 있어? 있다면 어떻게 해야하는지 알려줘.
만약 없다면 내가 원하는 동작을 하기 위해서는 어떻게 해야할까?