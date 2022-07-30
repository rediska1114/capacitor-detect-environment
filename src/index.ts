import { registerPlugin } from '@capacitor/core';

import type { DetectEnvironmentPlugin, ReturnValue } from './definitions';

const CapacitorDetectEnvironment = registerPlugin<DetectEnvironmentPlugin>(
  'DetectEnvironment',
  {
    // web: () => import('./web').then(m => new m.DetectEnvironmentWeb()),
  },
);

function wrapMethod(f: () => Promise<ReturnValue>): () => Promise<boolean> {
  return () => f().then(v => v.value);
}

export class DetectEnvironment {
  isDebug = wrapMethod(CapacitorDetectEnvironment.isDebug);
  isTestFlight = wrapMethod(CapacitorDetectEnvironment.isTestFlight);
  isAdHoc = wrapMethod(CapacitorDetectEnvironment.isAdHoc);
  isSimulator = wrapMethod(CapacitorDetectEnvironment.isSimulator);
  isAppStore = wrapMethod(CapacitorDetectEnvironment.isAppStore);
  isSandbox = wrapMethod(CapacitorDetectEnvironment.isSandbox);
}

export * from './definitions';
