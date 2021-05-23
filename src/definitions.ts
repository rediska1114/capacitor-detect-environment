declare module '@capacitor/core' {
  interface PluginRegistry {
    DetectEnvironment: DetectEnvironmentPlugin;
  }
}

export interface DetectEnvironmentPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
