export type ReturnValue = { value: boolean };

export interface DetectEnvironmentPlugin {
  isDebug(): Promise<ReturnValue>;
  isTestFlight(): Promise<ReturnValue>;
  isAdHoc(): Promise<ReturnValue>;
  isSimulator(): Promise<ReturnValue>;
  isAppStore(): Promise<ReturnValue>;
  isSandbox(): Promise<ReturnValue>;
}
