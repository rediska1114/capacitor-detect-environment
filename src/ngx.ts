import { Injectable } from '@angular/core';
import { Plugins } from '@capacitor/core';
import { DetectEnvironmentPlugin, ReturnValue } from './definitions';

const CDetectEnv = Plugins.DetectEnvironment as DetectEnvironmentPlugin;

function wrapMethod(f: () => Promise<ReturnValue>): Promise<boolean> {
  return f().then(v => v.value);
}

@Injectable()
export class DetectEnvironment {
  isDebug = wrapMethod(CDetectEnv.isDebug);
  isTestFlight = wrapMethod(CDetectEnv.isTestFlight);
  isAdHoc = wrapMethod(CDetectEnv.isAdHoc);
  isSimulator = wrapMethod(CDetectEnv.isSimulator);
  isAppStore = wrapMethod(CDetectEnv.isAppStore);
  isSandbox = wrapMethod(CDetectEnv.isSandbox);
}
