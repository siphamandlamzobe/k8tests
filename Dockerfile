FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["k8Test.csproj", "."]
RUN dotnet restore "./k8Test.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "k8Test.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "k8Test.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "k8Test.dll"]